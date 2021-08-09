package edu.kh.job.report.model.service;

import java.util.List;

import edu.kh.job.report.model.vo.Pagination;
import edu.kh.job.report.model.vo.Report;

public interface ReportService {

	/** 게시글수조회
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Pagination pg);

	/** 목록조회
	 * @param pagination
	 * @return pagination
	 */
	List<Report> getReportList(Pagination pagination);

	



}
