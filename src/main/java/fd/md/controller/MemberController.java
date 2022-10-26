package fd.md.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import fd.md.domain.Book;
import fd.md.domain.Member;
import fd.md.service.BookService;
import fd.md.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("member")
public class MemberController {
	private MemberService memberService;
	private BookService bookService;
	
	@GetMapping("/signup.do")
	public String signup() {
		//log.info("#회원가입 페이지 진입");
		return "member/signup";
	}
	//회원가입 정보입력
	@PostMapping("/signup.do")
	public String signupGet(Member member) {
		memberService.signupS(member);
		//log.info("#회원가입 성공");
		return "redirect:/member/login.do";
	}
	@GetMapping("/login.do")
	public String login() {
		//log.info("#로그인 페이지 진입");
		return "member/login";
	}
	//로그인 정보입력
	@PostMapping("/loginok.do")
	public ModelAndView loginGet(Member member, HttpSession session) {
		String inputPw = member.getPw();	
		Member mb = memberService.loginokS(member);
		ModelAndView mv = new ModelAndView();

		if (mb == null) {
			log.info("#회원정보 불일치");
			mv.setViewName("member/login");
			mv.addObject("message","fail");
		} else if (!inputPw.equals(mb.getPw())) { //실패시
			log.info("#비밀번호 오류");
			mv.setViewName("member/login");
			mv.addObject("message","notPw");
		} else if (inputPw.equals(mb.getPw())) {
			log.info("#로그인 성공");
			session.setAttribute("email", mb.getEmail());
			session.setAttribute("name", mb.getName());
			mv.setViewName("index");
			mv.addObject("message","loginOK");
		}
		return mv;
	}
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest httprequest) {
		HttpSession session = httprequest.getSession();
		session.invalidate();
		//log.info("#로그아웃 성공");
		return "redirect:../";
	}
	@GetMapping("/mypage.do")
	public ModelAndView mypage(HttpSession session) {
		Object emailObj = session.getAttribute("email");
		String email = (String)emailObj;	
		Member mb = new Member();
		mb.setEmail(email);
		Member member = memberService.loginokS(mb);	
		List<Book> blist = bookService.listS(email);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/mypage");
		mv.addObject("member", member);
		mv.addObject("blist",blist);
		log.info("#blist:" + blist);
		return mv;
	}
	@PostMapping("/updateok.do")
	public String updateok(Member member,HttpSession session) {
		log.info("##member:"+member);
		Object emailObj = session.getAttribute("email");
		String email = (String)emailObj;
		member.setEmail(email);
		memberService.updateokS(member);
		return "redirect:/member/mypage.do";
	}
	@GetMapping("/book.do")
	public ModelAndView book(HttpSession session,String hosname) {
		String email = (String)session.getAttribute("email");
		Member mem = new Member();
		mem.setEmail(email);
		Member member = memberService.loginokS(mem);
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		String tomorrow = ""+year+"-"+month+"-"+(day+1);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/book");
		mv.addObject("member",member);
		mv.addObject("hosname",hosname);
		mv.addObject("tomorrow",tomorrow);	
		return mv;
	}
	@PostMapping("/book.do")
	public String book(Book book,HttpServletRequest request) {
		//log.info("#boooooooo"+ book);
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		book.setEmail(email);
		log.info("#book:"+book);
		bookService.insertS(book);
		return "redirect:/member/mypage.do";
	}
	@GetMapping("/book/del.do")
	public String delete(long seq) {
		bookService.deleteS(seq);
		return "redirect:/member/mypage.do";
	}	
}
