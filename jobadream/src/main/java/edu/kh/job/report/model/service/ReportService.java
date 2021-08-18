package edu.kh.job.report.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.kh.job.report.model.vo.Pagination;
import edu.kh.job.report.model.vo.Report;
import edu.kh.job.report.model.vo.ReportCategory;
import edu.kh.job.report.model.vo.Search;

public interface ReportService {

	/** 게시글수조회
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Pagination pg, int memberNo);
	
	/** 게시글수조회(검색)
	 * @param search
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Search search, Pagination pg);


	/** 목록조회
	 * @param pagination
	 * @return pagination
	 */
	List<Report> getReportList(Pagination pagination, int memberNo);
	
	
	/** 목록조회 (검색)
	 * @param search
	 * @param pagination
	 * @return
	 */
	List<Report> getReportList(Search search, Pagination pagination);
	

	/** 상세조회
	 * @param reportNo
	 * @return report
	 */
	Report selectReport(int reportNo);

	/** 삽입화면 카테고리 조회
	 * @return category
	 */
	List<ReportCategory> selectCategory();

	/** 게시글 삭제
	 * @param reportNo
	 * @return result
	 */
	int delete(int reportNo);


	/** 게시글삽입
	 * @param report
	 * @param images
	 * @param webPath
	 * @param savePath
	 * @return reportNo
	 */
	int insertReport(Report report, List<MultipartFile> images, String webPath, String savePath);

	/** 게시글 수정화면
	 * @param reportNo
	 * @return report
	 */
	Report updateForm(int reportNo);

	/** 게시글 수정
	 * @param report
	 * @param webPath
	 * @param savePath
	 * @param images
	 * @param deleteImage 
	 * @return result
	 */
	int updateReport(Report report, String webPath, String savePath, List<MultipartFile> images, String deleteImages);

	
	
	
	



}
