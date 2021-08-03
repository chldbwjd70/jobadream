package edu.kh.job.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.job.notice.model.service.NoticeService;
import edu.kh.job.notice.model.vo.Pagination;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	
	// 게시글목록조회
	@RequestMapping(value = "/notice/noticeList", method=RequestMethod.GET)
	public String noticeList(Model model, Pagination pg /*페이징처리*/) {
		
		//Pagination pagination = service.getPagination()
		return null;
	}

}
