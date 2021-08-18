package edu.kh.job.report.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.job.report.exception.InsertFileException;
import edu.kh.job.report.exception.SaveFileException;
import edu.kh.job.report.model.dao.ReportDAO;
import edu.kh.job.report.model.vo.Pagination;
import edu.kh.job.report.model.vo.Report;
import edu.kh.job.report.model.vo.ReportCategory;
import edu.kh.job.report.model.vo.ReportFile;
import edu.kh.job.report.model.vo.Search;

/**
 * @author ㅇ
 *
 */
@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDAO dao;

	// 게시글수조회
	@Override
	public Pagination getPagination(Pagination pg, int memberNo) {

		Pagination selectPg = dao.getListCount(memberNo);
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount());
	}

	// 게시글수조회 (검색)
	@Override
	public Pagination getPagination(Search search, Pagination pg) {
		Pagination selectPg = dao.getSearchListCount(search);
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount());
	}

	// 목록조회
	@Override
	public List<Report> getReportList(Pagination pagination, int memberNo) {
		return dao.selectReportList(pagination,memberNo);
	}

	// 목록조회(검색)
	@Override
	public List<Report> getReportList(Search search, Pagination pagination) {
		return dao.selectSearchList(search, pagination);
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

	// 게시글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReport(Report report, List<MultipartFile> images, String webPath, String savePath) {
		report.setReportTitle(replaceParameter(report.getReportTitle()));
		report.setReportContent(replaceParameter(report.getReportContent()));

		report.setReportContent(report.getReportContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));

		int reportNo = dao.insertReport(report);

		if (reportNo > 0) {
			List<ReportFile> rfList = new ArrayList<ReportFile>();

			for (int i = 0; i < images.size(); i++) {
				if (!images.get(i).getOriginalFilename().equals("")) {
					String fileName = rename(images.get(i).getOriginalFilename());

					ReportFile rf = new ReportFile();
					rf.setFileName(fileName);
					rf.setFilePath(webPath);
					rf.setReportNo(reportNo);
					rf.setFileLevel(i);

					rfList.add(rf);

				}
			}

			if (!rfList.isEmpty()) {
				int result = dao.insertFileList(rfList);
				if (rfList.size() == result) {
					for (int i = 0; i < rfList.size(); i++) {

						try {
							images.get(rfList.get(i).getFileLevel())
									.transferTo(new File(savePath + "/" + rfList.get(i).getFileName()));
						} catch (Exception e) {
							e.printStackTrace();
							throw new SaveFileException();

						}
					}
				} else {
					throw new SaveFileException();
				}
			}

		}
		return reportNo;
	}

	// 게시글삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int delete(int reportNo) {

		return dao.deleteReport(reportNo);
	}

	// 게시글 수정화면
	@Override
	public Report updateForm(int reportNo) {
		Report report = dao.selectReport(reportNo);
		report.setReportContent(report.getReportContent().replaceAll("<br>", "\r\n"));
		return report;
	}
	
	
	// 게시글 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReport(Report report, String webPath, String savePath, List<MultipartFile> images,  String deleteImages) {
		report.setReportTitle(replaceParameter(report.getReportTitle()));
		report.setReportContent(replaceParameter(report.getReportContent()));

		report.setReportContent(report.getReportContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		
		int result = dao.updateReport(report);
		if(result>0) {
			if(!deleteImages.equals("")) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("reportNo", report.getReportNo());
				map.put("deleteImage", deleteImages);
				
				dao.deleteFile(map);
			}
			List<ReportFile> rfList = new ArrayList<ReportFile>();

			for (int i = 0; i < images.size(); i++) {
				if (!images.get(i).getOriginalFilename().equals("")) {
					String fileName = rename(images.get(i).getOriginalFilename());

					ReportFile rf = new ReportFile();
					rf.setFileName(fileName);
					rf.setFilePath(webPath);
					rf.setReportNo(report.getReportNo());
					rf.setFileLevel(i);

					rfList.add(rf);

				}
			}

			for(ReportFile rf : rfList) {
				result  = dao.updateFile(rf);
				if(result ==0) {
					result = dao.insertFile(rf);
					if(result==0) {
						throw new InsertFileException();
					}
				}
			}
			for (int i = 0; i < rfList.size(); i++) {

				try {
					images.get(rfList.get(i).getFileLevel())
							.transferTo(new File(savePath + "/" + rfList.get(i).getFileName()));
				} catch (Exception e) {
					e.printStackTrace();
					throw new SaveFileException();

				}
			}
		}
		return result;
	}

	// 크로스 사이트 스크립트 방지 처리 메소드
	public static String replaceParameter(String param) {
		String result = param;
		if (param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}

		return result;
	}

	// 파일명 변경 메소드
	private String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

		int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성

		String str = "_" + String.format("%05d", ranNum);

		String ext = originFileName.substring(originFileName.lastIndexOf("."));

		return date + str + ext;
	}

}
