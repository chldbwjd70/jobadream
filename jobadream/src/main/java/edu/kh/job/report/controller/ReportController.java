package edu.kh.job.report.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.job.member.model.vo.Member;
import edu.kh.job.notice.model.vo.Notice;
import edu.kh.job.report.model.service.ReportService;
import edu.kh.job.report.model.vo.Pagination;
import edu.kh.job.report.model.vo.Report;
import edu.kh.job.report.model.vo.ReportCategory;
import edu.kh.job.report.model.vo.Search;

@Controller
@RequestMapping("/report/*")
@SessionAttributes({ "loginMember" })
public class ReportController {

	@Autowired
	private ReportService service;

	// 목록조회
	@RequestMapping("list")
	public String reportList(Model model, Pagination pg,
							@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
							@ModelAttribute("loginMember") Member loginMember,Search search) {

		pg.setCurrentPage(cp);
		int memberNo = loginMember.getMemberNo();
		
		Pagination pagination = null;
		List<Report> reportList = null;
		
		if(search.getSk() == null) {
			pagination = service.getPagination(pg,memberNo);
			reportList = service.getReportList(pagination,memberNo);
		}else {
			pagination = service.getPagination(search,pg);
			reportList = service.getReportList(search,pagination);
		}


		//System.out.println(reportList);
		model.addAttribute("pagination", pagination);
		model.addAttribute("reportList", reportList);
		return "report/reportList";
	}

	// 상세조회
	@RequestMapping("{reportNo}")
	public String reportView(Model model, @PathVariable("reportNo") int reportNo,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {

		Report report = service.selectReport(reportNo);
		//System.out.println(report);
		model.addAttribute("report", report);
		return "report/reportView";

	}
	
	// 게시글 삽입화면
	@RequestMapping(value = "insert", method =RequestMethod.GET)
	public String insertView(Model model) {
		
		List<ReportCategory> category = service.selectCategory();
		//System.out.println(category);
		
		model.addAttribute("category", category);
		
		return "report/reportInsert";
		
	}
	
	//게시글 삽입
	@RequestMapping(value = "insert", method =RequestMethod.POST)
	public String reportInsert(Report report, Model model,
								@ModelAttribute("loginMember") Member loginMember,
								@RequestParam("images") List<MultipartFile> images,
								HttpServletRequest request, RedirectAttributes ra){
		
		report.setMemberNo(loginMember.getMemberNo());
		
		String webPath = "resources/images/report/";
		String savePath = request.getSession().getServletContext().getRealPath(webPath);
		
		// 글삽입 
		int reportNo = service.insertReport(report, images, webPath, savePath);
		
		String path = null;
		if(reportNo>0) {
			path = "redirect:" + reportNo;
			swalSetMessage(ra, "success", "게시글 작성 완료",  null);
			
		}else {
			path = "redirect" + request.getHeader("referer");
			swalSetMessage(ra, "success", "게시글 작성 실패",  null);
		}
		
		return path;
	}
	
	// 게시글 삭제
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String deleteForm(int reportNo,Model model,HttpServletRequest request,RedirectAttributes ra) {
		
		int result = service.delete(reportNo);
		//System.out.println(reportNo);
		
		String path = null;
		if(result > 0) { //
			path = "redirect:/report/list" ;
			swalSetMessage(ra, "success", "삭제 완료",  null);
			
		} else { 
			path = "redirect:" + request.getHeader("referer"); 
			swalSetMessage(ra, "error", "삭제 실패",  null);
		}
		
		
		return path;
	}
	
	// 게시글 수정화면전환
	@RequestMapping(value ="updateForm", method = RequestMethod.POST)
	public String updateForm(int reportNo, Model model) {
		
		List<ReportCategory> category = service.selectCategory();
		Report report = service.updateForm(reportNo);
		model.addAttribute("report", report);
		model.addAttribute("category", category);
		return "report/reportUpdate";
	}
	
	// 게시글 수정
	@RequestMapping(value = "update", method=RequestMethod.POST)
	public String updateReport(Report report, Model model,HttpServletRequest request,RedirectAttributes ra,
								@RequestParam("images") List<MultipartFile> images,
								 @RequestParam("deleteImages") String deleteImages) {
		String webPath = "resources/images/report/";
		String savePath = request.getSession().getServletContext().getRealPath(webPath);
		
		int result = service.updateReport(report,webPath,savePath, images,deleteImages);
		
		String path = null;
		if(result > 0) { //
			path = "redirect:"+ report.getReportNo();
			swalSetMessage(ra, "success", "수정 완료",  null);
			
		} else { 
			path = "redirect:" + request.getHeader("referer"); 
			swalSetMessage(ra, "error", "수정 실패",  null);
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
