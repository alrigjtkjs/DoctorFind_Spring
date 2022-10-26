package fd.md.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import fd.md.domain.Hospital;
import fd.md.domain.Search;
import fd.md.domain.SearchListResult;
import fd.md.service.SearchService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.Calendar;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/search")
public class SearchController {
	private SearchService service;
	
	@GetMapping("/search.do")
	public ModelAndView search(HttpServletRequest request, HttpSession session,
			String addr1, String addr2, String addr3, String inputname) {
		
		String cpStr = request.getParameter("cp");	
		int cp = 1;
		int ps = 15;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", cp);	
		
		// 주소 키워드
		String addr ="";
		if(addr1 == null) {
			Object addrObj = session.getAttribute("addr");	
			if(addrObj != null) {
				addr = (String)addrObj;
			}
		}else {
			if(addr3 == "") {
				addr=addr2;
			}else {
				addr=addr2+" "+addr3;
			}	
		}
		if(addr=="시/도 선택 시/군/구 선택") {
			addr="";
		}
		session.setAttribute("addr", addr);

		// 병원명 키워드
		if(inputname == null) {
			Object nameObj = session.getAttribute("hosname");
			if(nameObj != null) {
				inputname = (String)nameObj;
			}
		}else {
			inputname = inputname.trim();
		}
		session.setAttribute("hosname", inputname);
		
		SearchListResult listResult = null;
		listResult = service.getSearchListResult(cp, ps, inputname, addr);
		
		List<Integer> range = new ArrayList<>();
		if(listResult.getTotalPageCount()>10) {
			for(int i=cp;i<cp+10;i++) {
				range.add(i);
				if(i==listResult.getTotalPageCount()) {		
					break;
				}
			}
			int s = range.size();
			for(int j=1;j<=10-s;j++) {
				range.add(0,cp-j);
			}
		}else {
			for(int i=1;i<=listResult.getTotalPageCount();i++) {
				range.add(i);
			}
		}
					
		Calendar cal = Calendar.getInstance();
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("search/search");
		mv.addObject("listResult",listResult);
		mv.addObject("today", dayOfWeek);
		mv.addObject("keyword", inputname);
		mv.addObject("range", range);
		
		if(listResult.getList().size() == 0) {
			if(cp > 1)
				return new ModelAndView("redirect:search.do?cp="+(cp-1));
			else 
				return new ModelAndView("search/search", "listResult", null);
		}else {
			return mv;
		}
	}
	
	@GetMapping("/map.do")
	public String map() {
		
		return "search/map";
	}
	@PostMapping("/map.do")
	public ModelAndView map(ModelAndView mv, HttpServletRequest request) {
		
		mv.setViewName("search/map");
		mv.addObject("123",request.getParameter("sId"));
		String rstr = request.getParameter("sId"); // 가져온 검색 값
		
		log.info("test1: " + rstr);
		List<Search> list = service.maplistS(rstr);
		
		HttpSession session = request.getSession();
		session.setAttribute("mapKey", rstr);
		
		ModelAndView mv2 = new ModelAndView("search/map", "list", list);
		
		return mv2;
	}

}
