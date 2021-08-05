package edu.kh.job.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.job.member.model.vo.Member;
import edu.kh.job.notice.model.service.NoticeService;
import edu.kh.job.notice.model.vo.Notice;
import edu.kh.job.notice.model.vo.Pagination;

@Controller
@SessionAttributes({"loginMember"}) 
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
	
	// 게시글 상세조회
	@RequestMapping("/notice/{noticeNo}")
	public String noticeView(Model model, @PathVariable("noticeNo") int noticeNo,
							@RequestParam(value="cp", required =false, defaultValue = "1") int cp) {
		
		Notice notice = service.selectNotice(noticeNo);
		
		//System.out.println("확인 : "  +notice);
		
		model.addAttribute("notice", notice);
		
		
		return "notice/noticeView";
	}
	
	// 등록 화면전환
	@RequestMapping(value = "/notice/insert" , method = RequestMethod.GET)
	public String insertView(Model model) {
		return "notice/noticeInsert";
	}
	
	// 게시글 등록
	@RequestMapping(value = "/notice/insert" , method = RequestMethod.POST)
	public String noticeInsert(@ModelAttribute Notice notice, @ModelAttribute("loginMember") Member loginMember,
								RedirectAttributes ra,HttpServletRequest request) {
		notice.setMemberNo(loginMember.getMemberNo());
		
		int noticeNo = service.insertNotice(notice);
		String path = null;
		
		if(noticeNo>0) { // 성공
			path = "redirect:" + noticeNo;
			swalSetMessage(ra, "success", "게시글 등록", null);
		}else {
			path="redirect:"+ request.getHeader("referer");
			swalSetMessage(ra, "error", "등록 실패", null);
		}
		return path;
	}
	
	
	// SweetAlert를 이용한 메세지 전달용 메소드
		public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {
			// RedirectAttributes : 리다이렉트 시 값을 전달하는 용도의 객체
			
			ra.addFlashAttribute("icon", icon);
			ra.addFlashAttribute("title", title);
			ra.addFlashAttribute("text", text);
			
		}
		

}