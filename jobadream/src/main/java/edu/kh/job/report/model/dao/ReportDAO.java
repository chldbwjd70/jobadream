package edu.kh.job.report.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.job.report.model.vo.Pagination;
import edu.kh.job.report.model.vo.Report;

@Repository
public class ReportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 게시글수조회
	 * @return selectPg
	 */
	public Pagination getListCount() {
		return sqlSession.selectOne("reportMapper.getListCount");
	}

	public List<Report> selectReportList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1)*pagination.getLimit();
		RowBounds rowBouns = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("reportMapper.selectReportList", pagination, rowBouns);
	}
}
