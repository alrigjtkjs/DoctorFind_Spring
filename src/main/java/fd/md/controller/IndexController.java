package fd.md.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fd.md.domain.Board;
import fd.md.domain.Event;
import fd.md.domain.Healthinfo;
import fd.md.service.BoardService;
import fd.md.service.Eventservice;
import fd.md.service.Healthinfoservice;
import fd.md.service.SearchService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("")
public class IndexController {
	private Healthinfoservice healthinfoservice;
	private Eventservice eventservice;
	private BoardService boardservice;
	private SearchService searchservice;
	
	@GetMapping("")
	public String index() {
		return "index";
	}
	public String healthinfo() {
		return "index";
	}
	
	@PostMapping("/healthinfo")
	public @ResponseBody List<Healthinfo> listS(int month) {
		List<Healthinfo> list = healthinfoservice.listS(month);
		return list;
	}
	@PostMapping("/event")
	public @ResponseBody List<Event> listS(){
		log.info("�쐞");
		List<Event> list = eventservice.listS();
		log.info("諛�");
		return list;
	}
	@PostMapping("/review")
	public @ResponseBody List<Board> list(){
		List<Board> lists = boardservice.listS();
		return lists;
	}
	@GetMapping("/search")
	public String search(HttpServletRequest request, String inputname, HttpSession session) {
		session.setAttribute("hosname",inputname);
		
		return "";
	}
}
