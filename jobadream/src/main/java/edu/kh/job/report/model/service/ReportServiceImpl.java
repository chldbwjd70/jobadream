package edu.kh.job.report.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.job.report.model.dao.ReportDAO;
import edu.kh.job.report.model.vo.Pagination;
import edu.kh.job.report.model.vo.Report;
import edu.kh.job.report.model.vo.ReportCategory;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private ReportDAO dao;

	// 게시글수조회
	@Override
	public Pagination getPagination(Pagination pg) {
		
		Pagination selectPg = dao.getListCount();
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount());
	}

	// 목록조회
	@Override
	public List<Report> getReportList(Pagination pagination) {
		return dao.selectReportList(pagination);
	}

	// 상세조회
	@Override
	public Report selectReport(int reportNo) {
		return dao.selectReport(reportNo);
	}

	// 카테고리 조회
	@Override
	public List<ReportCategory> selectCategory() {
		return dao.selectCategory();
	}
	
	
	
	
	
	

	
	
	
	
	
	
}
