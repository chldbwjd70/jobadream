package edu.kh.job.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.job.report.model.service.ReportService;
import edu.kh.job.report.model.vo.Pagination;
import edu.kh.job.report.model.vo.Report;

@Controller
@RequestMapping("/report/*")
@SessionAttributes({"loginMember"})
public class ReportController {

	@Autowired
	private ReportService service;
	
	// 목록조회
	@RequestMapping("list")
	public String reportList(Model model, Pagination pg, 
				@RequestParam(value="cp", required =false, defaultValue = "1") int cp) {
		
		pg.setCurrentPage(cp);
		
		Pagination pagination = service.getPagination(pg);
		List<Report> reportList = service.getReportList(pagination);		
		
		System.out.println(reportList);
		model.addAttribute("pagination", pagination);
		model.addAttribute("reportList", reportList);
		return "report/reportList";
	}
	

	
}
