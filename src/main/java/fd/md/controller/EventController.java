package fd.md.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import fd.md.domain.Event;
import fd.md.service.Eventservice;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/event")
public class EventController {
	private Eventservice service;
	@GetMapping("/list.do")
	public ModelAndView listS() {
		List<Event> list = service.listS();
		ModelAndView mv = new ModelAndView("event/list","list",list);
		return mv;
	}
	@GetMapping("/econtent.do")
	public ModelAndView contentS(int seq) {
		List<Event> content = service.contentS(seq);
		ModelAndView mv = new ModelAndView("event/econtent","content", content);
		return mv;
	}

}
