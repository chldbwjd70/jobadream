package edu.kh.job.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.job.notice.model.vo.Notice;
import edu.kh.job.notice.model.vo.Pagination;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 게시글수 조회
	 * @return selectPg
	 */
	public Pagination getListCount() {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}

	/** 게시글목록조회
	 * @param pagination
	 * @return noticeList
	 */
	public List<Notice> selectNoticeList(Pagination pagination) {
		
		// RowBounds사용
		int offset = (pagination.getCurrentPage() - 1)*pagination.getLimit();
		RowBounds rowBouns = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("noticeMapper.selectNoticeList", pagination, rowBouns);
	}

}
