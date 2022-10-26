package fd.md.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import fd.md.domain.Board;
import fd.md.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("review")
public class ReviewController {
	private BoardService service;
	@GetMapping("/list.do")
	public ModelAndView list() {
		List<Board> list = service.listS(); //�����迭List(util)���� Board �迭�߿� �ϳ��� ��´� ���? ������ list()
		ModelAndView mv = new ModelAndView ("review/list" ,"list", list);//review�� list���� list.jsp������ �´�  list�̸����� list�����͸�
		log.info(list);		
		return mv;
	}
	@GetMapping("/rwrite.do")
	public String rwrite() {
		return "review/rwrite";
	}


	  @PostMapping("/rwrite.do")
	 public String rwrite(Board board, HttpServletRequest request){
		  log.info("#aa: "+ board);
		  //log.info("#board: "+board);
		  HttpSession session = request.getSession();
		  String email = (String) session.getAttribute("email");
		  board.setEmail(email);
		  
		  log.info("#bb: "+ board);
		  service.insertS(board);
	  return "redirect:list.do";
	  }
	
	@GetMapping("/rcontent.do")
	public ModelAndView rcontent(long seq) {
		Board list = service.contentS(seq);
		log.info("#list: "+list);
		
		//��ȸ�� ������Ʈ
		long views = list.getViews();
		list.setViews(views+1);
		service.updateViewS(list);
		
		ModelAndView mv = new ModelAndView("review/rcontent", "list", list); 
		return mv;
	}
	@GetMapping("/rupdate.do")
	public ModelAndView rupdate(long seq) {
		Board list = service.contentS(seq);
		ModelAndView mv = new ModelAndView("review/rupdate", "list", list);
		return mv;
	}
	
	@GetMapping("/del.do")
	public String delete(long seq) {
		service.deleteS(seq);
		return "redirect:list.do";
	}

	@PostMapping("rupdate.do")
	public String update(Board board) {
		log.info("board: "+board);
		service.updateS(board);
		long seq=board.getSeq();
		String url="redirect:rcontent.do?seq=";
		url=url+seq;
		return url;
	}
}





