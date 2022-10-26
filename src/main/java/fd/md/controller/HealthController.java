package fd.md.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fd.md.domain.Healthinfo;
import fd.md.service.Healthinfoservice;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("health")
public class HealthController {
	private Healthinfoservice healthinfoservice;
	
	@GetMapping("/healthinfo.do")
	public String listS() {
		return "/health/healthinfo";
	}
	
	@PostMapping("/healthinfo")
	public @ResponseBody List<Healthinfo> listS(int month) {
		log.info("#month: "+month);
		List<Healthinfo> list = healthinfoservice.listS(month);
		log.info("#list"+list);
		return list;
	}
	
}
