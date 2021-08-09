package edu.kh.job.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.job.report.model.service.ReportService;
import edu.kh.job.report.model.vo.Pagination;
import edu.kh.job.report.model.vo.Report;
import edu.kh.job.report.model.vo.ReportCategory;

@Controller
@RequestMapping("/report/*")
@SessionAttributes({ "loginMember" })
public class ReportController {

	@Autowired
	private ReportService service;

	// 목록조회
	@RequestMapping("list")
	public String reportList(Model model, Pagination pg,
			@RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {

		pg.setCurrentPage(cp);

		Pagination pagination = service.getPagination(pg);
		List<Report> reportList = service.getReportList(pagination);

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

}
