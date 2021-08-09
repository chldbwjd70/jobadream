package edu.kh.job.qusetions.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.job.qusetions.model.vo.Pagination;
import edu.kh.job.qusetions.model.vo.Qusetions;
import edu.kh.job.qusetions.model.vo.Search;

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
	
	
	/** 검색 게시글수조회
	 * @param search
	 * @return pagination
	 */
	public Pagination getSearchListCount(Search search) {
		return sqlSession.selectOne("qusetionsMapper.getSearchListCount", search);
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
	
	/** 검색한 게시글목록조회
	 * @param search
	 * @param pagination
	 * @return qusetionsList
	 */
	public List<Qusetions> selectSearchList(Search search, Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1)*pagination.getLimit();
		RowBounds rowBouns = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("qusetionsMapper.selectSearchList", search , rowBouns);
	}


	/** 게시글 상세조회
	 * @param qusetionsNo
	 * @return qusetions
	 */
	public Qusetions selectQusetions(int qusetionsNo) {
		return sqlSession.selectOne("qusetionsMapper.selectQusetions", qusetionsNo);
	}


	/** 게시글 삽입
	 * @param qusetions
	 * @return qusetionsNo
	 */
	public int insertQu(Qusetions qusetions) {
		int result = sqlSession.insert("qusetionsMapper.insertQu", qusetions);
		
		if(result>0) {
			return qusetions.getQusetionsNo();
		}else {
			return 0;
		}
	}


	public int updateQusetions(Qusetions qusetions) {
		return sqlSession.update("qusetionsMapper.updateQusetions", qusetions);
	}


	public int deleteForm(int qusetionsNo) {
		return sqlSession.update("qusetionsMapper.deleteForm", qusetionsNo);
	}




	
}