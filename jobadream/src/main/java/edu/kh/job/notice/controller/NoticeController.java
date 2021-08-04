package edu.kh.job.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.job.notice.model.service.NoticeService;
import edu.kh.job.notice.model.vo.Notice;
import edu.kh.job.notice.model.vo.Pagination;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	
	// 게시글목록조회
	@RequestMapping(value = "/notice/noticeList", method=RequestMethod.GET)
	public String noticeList(Model model, Pagination pg,/*페이징처리*/
							@RequestParam(value="cp", required =false, defaultValue = "1") int cp
							) {
		
		pg.setCurrentPage(cp);
		Pagination pagination = service.getPagination(pg);
		
		// pagination을 이용하여 현재 목록페이지 조회
		List<Notice> noticeList = service.selectNoticeList(pagination);
		
		for(Notice n : noticeList) {
			System.out.println(n);
		}
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pagination", pagination);
		
		
		return "notice/noticeList";
	}

}
