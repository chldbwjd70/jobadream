package edu.kh.job.qusetions.controller;

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
import edu.kh.job.qusetions.model.service.QusetionsService;
import edu.kh.job.qusetions.model.vo.Pagination;
import edu.kh.job.qusetions.model.vo.Qusetions;
import edu.kh.job.qusetions.model.vo.Search;

@Controller
@SessionAttributes({ "loginMember" })
public class QusetionsController {

	@Autowired
	private QusetionsService service;
	

	// 게시글목록조회
	@RequestMapping(value = "/qusetions/qusetionsList", method = RequestMethod.GET)
	public String QusetionsList(Model model, Pagination pg, /* 페이징처리 */@ModelAttribute("loginMember") Member loginMember
			,@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Search search) {

		pg.setCurrentPage(cp);
		// System.out.println(search);
		
		int memberNo = loginMember.getMemberNo();

		List<Qusetions> qusetionsList = null;
		Pagination pagination = null;

		if (search.getSk() == null) { // 검색 x

			// pagination을 이용하여 현재 목록페이지 조회
			pagination = service.getPagination(pg,memberNo);
			qusetionsList = service.selectQusetionsList(pagination, memberNo);
		} else { // 검색 : 검색목록조회
			pagination = service.getPagination(search, pg);
			qusetionsList = service.selectQusetionsList(search, pagination);

		}

		System.out.println(qusetionsList);
		model.addAttribute("qusetionsList", qusetionsList);
		model.addAttribute("pagination", pagination);

		return "qusetions/qusetionsList";
	}

	// 게시글 상세조회
	@RequestMapping("/qusetions/{qusetionsNo}")
	public String QusetionsView(Model model, @PathVariable("qusetionsNo") int qusetionsNo,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {

		Qusetions qusetions = service.selectQusetions(qusetionsNo);
		//System.out.println("확인 : " + qusetions);
	
		model.addAttribute("qusetions", qusetions);

		return "qusetions/qusetionsView";
	}

	// insert 화면전환
	@RequestMapping(value = "/qusetions/insert", method = RequestMethod.GET)
	public String insertView(Model model) {
		return "qusetions/qusetionsInsert";
	}

	// 게시글 등록
	@RequestMapping(value = "/qusetions/insert", method = RequestMethod.POST)
	public String noticeInsert(@ModelAttribute Qusetions qusetions, @ModelAttribute("loginMember") Member loginMember,
			RedirectAttributes ra, HttpServletRequest request) {
		qusetions.setMemberNo(loginMember.getMemberNo());

		int qusetionsNo = service.insertQu(qusetions);
		String path = null;

		if (qusetionsNo > 0) { // 성공
			path = "redirect:" + qusetionsNo;
			swalSetMessage(ra, "success", "게시글 등록", null);
		} else {
			path = "redirect:" + request.getHeader("referer");
			swalSetMessage(ra, "error", "등록 실패", null);
		}
		return path;
	}

	// 수정 화면 전환
	@RequestMapping(value = "/qusetions/updateForm", method = RequestMethod.POST)
	public String updateForm(int qusetionsNo, Model model) {

		Qusetions qusetions = service.selectUpdateQusetions(qusetionsNo);

		model.addAttribute("qusetions", qusetions);

		return "qusetions/qusetionsUpdate";
	}
	
	// 게시글 수정
		@RequestMapping(value="/qusetions/update", method=RequestMethod.POST)
		public String updateQusetions(Qusetions qusetions,
					  HttpServletRequest request, Model model, RedirectAttributes ra ) {
			
			
			// 2) 게시글 수정 Service 호출
			int result = service.updateQusetions(qusetions);
			
			String path = null;
			if(result > 0) { // 수정 성공
				path = "redirect:" + qusetions.getQusetionsNo();
				swalSetMessage(ra, "success", "게시글 수정 성공",  null);
				
			} else { // 삽입 실패
				path = "redirect:" + request.getHeader("referer"); 
				swalSetMessage(ra, "error", "게시글 수정 실패",  null);
			}
			
			
			return path;
		}
		
		
		// 게시글 삭제 
		@RequestMapping(value = "/qusetions/delete", method = RequestMethod.POST)
		public String deleteForm(int qusetionsNo, Model model, HttpServletRequest request,RedirectAttributes ra  ) {
			
			int result = service.deleteForm(qusetionsNo);
			String path = null;
			if(result > 0) { //
				path = "redirect:/qusetions/qusetionsList" ;
				swalSetMessage(ra, "success", "삭제 완료",  null);
				
			} else { 
				path = "redirect:" + request.getHeader("referer"); 
				swalSetMessage(ra, "error", "삭제 실패",  null);
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