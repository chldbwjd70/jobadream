package edu.kh.job.qusetions.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.job.qusetions.model.service.QusetionsService;
import edu.kh.job.qusetions.model.vo.Pagination;
import edu.kh.job.qusetions.model.vo.Qusetions;

@Controller
public class QusetionsController {
	
	@Autowired
	private QusetionsService service;
	
	// 게시글목록조회
		@RequestMapping(value = "/qusetions/qusetionsList", method=RequestMethod.GET)
		public String noticeList(Model model, Pagination pg,/*페이징처리*/
								@RequestParam(value="cp", required =false, defaultValue = "1") int cp
								) {
			
			pg.setCurrentPage(cp);
			Pagination pagination = service.getPagination(pg);
			
			// pagination을 이용하여 현재 목록페이지 조회
			List<Qusetions> qusetionsList = service.selectQusetionsList(pagination);
			
			model.addAttribute("qusetionsList", qusetionsList);
			model.addAttribute("pagination", pagination);
		
			
			return "qusetions/qusetionsList";
		}

}
