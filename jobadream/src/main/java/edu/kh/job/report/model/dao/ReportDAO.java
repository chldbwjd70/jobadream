package edu.kh.job.report.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.job.report.model.vo.Pagination;
import edu.kh.job.report.model.vo.Report;
import edu.kh.job.report.model.vo.ReportCategory;
import edu.kh.job.report.model.vo.ReportFile;
import edu.kh.job.report.model.vo.Search;

@Repository
public class ReportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 게시글수조회
	 * @return selectPg
	 */
	public Pagination getListCount(int memberNo) {
		return sqlSession.selectOne("reportMapper.getListCount",memberNo);
	}
	
	
	/** 게시글수조회(검색)
	 * @return selectPg
	 */
	public Pagination getSearchListCount(Search search) {
		return sqlSession.selectOne("reportMapper.getSearchListCount", search);
	}
	

	/** 목록조회
	 * @param pagination
	 * @return
	 */
	public List<Report> selectReportList(Pagination pagination,int memberNo) {
		
		int offset = (pagination.getCurrentPage() - 1)*pagination.getLimit();
		RowBounds rowBouns = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("reportMapper.selectReportList",memberNo, rowBouns);
	}
	
	/** 게시글목록조회
	 * @param search
	 * @param pagination
	 * @return
	 */
	public List<Report> selectSearchList(Search search, Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1)*pagination.getLimit();
		RowBounds rowBouns = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("reportMapper.selectSearchList", search, rowBouns);
	}

	/** 상세조회
	 * @param reportNo
	 * @return report
	 */
	public Report selectReport(int reportNo) {
		return sqlSession.selectOne("reportMapper.selectReport", reportNo);
	}


	/** 카테고리조회
	 * @return category
	 */
	public List<ReportCategory> selectCategory() {
		return sqlSession.selectList("reportMapper.selectCategory");
	}


	/** 글삽입
	 * @param report
	 * @return
	 */
	public int insertReport(Report report) {
		int result = sqlSession.insert("reportMapper.insertReport", report);
		if(result>0) {
			return report.getReportNo();
		}else {
			return 0;
		}
	}



	/** 파일삽입
	 * @param rfList
	 * @return
	 */
	public int insertFileList(List<ReportFile> rfList) {
		return sqlSession.insert("reportMapper.insertFileList", rfList);
	}


	/** 글삭제
	 * @param reportNo
	 * @return
	 */
	public int deleteReport(int reportNo) {
		return sqlSession.update("reportMapper.deleteReport", reportNo);
	}


	/** 게시글 수정
	 * @param report
	 * @return result
	 */
	public int updateReport(Report report) {
		return sqlSession.update("reportMapper.updateReport", report);
	}


	/** 첨부파일정보삭제
	 * @param map
	 */
	public void deleteFile(Map<String, Object> map) {
		sqlSession.delete("reportMapper.deleteFile", map);
		
	}


	/** 첨부파일 정보수정
	 * @param rf
	 * @return
	 */
	public int updateFile(ReportFile rf) {
		return sqlSession.update("reportMapper.updateFile", rf);
	}


	/** 파일정보삽입
	 * @param rf
	 * @return
	 */
	public int insertFile(ReportFile rf) {
		return sqlSession.insert("reportMapper.insertFile", rf);
	}


	
	


	
}
