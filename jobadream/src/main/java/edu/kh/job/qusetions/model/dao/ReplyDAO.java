package edu.kh.job.qusetions.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.job.qusetions.model.vo.Reply;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 댓글목록조회
	 * @param qusetionsNo
	 * @return rList
	 */
	public List<Reply> selectList(int qusetionsNo) {
		return sqlSession.selectList("replyMapper.selectList", qusetionsNo);
	}

	


	
}