package edu.kh.job.qusetions.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.job.qusetions.model.vo.Pagination;
import edu.kh.job.qusetions.model.vo.Qusetions;

@Repository
public class QusetionsDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 게시글수 조회
	 * @return selectPg
	 */
	public Pagination getListCount() {
		return sqlSession.selectOne("qusetionsMapper.getListCount");
	}

	
	/** 게시글목록조회
	 * @param pagination
	 * @return qusetionsList
	 */
	public List<Qusetions> selectQusetionList(Pagination pagination) {
		
		// RowBounds사용
		int offset = (pagination.getCurrentPage() - 1)*pagination.getLimit();
		RowBounds rowBouns = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("qusetionsMapper.selectQusetionList", pagination, rowBouns);
	}
}