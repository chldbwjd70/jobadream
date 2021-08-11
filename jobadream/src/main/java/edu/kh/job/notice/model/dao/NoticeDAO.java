package edu.kh.job.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.job.notice.model.vo.Notice;
import edu.kh.job.notice.model.vo.Pagination;
import edu.kh.job.qusetions.model.vo.Search;

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
	
	
	/** 검색한 게시글수 조회
	 * @param search
	 * @return selectPg
	 */
	public Pagination getSearchListCount(Search search) {
		return sqlSession.selectOne("noticeMapper.getSearchListCount", search);
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
	
	/** 게시글 검색목록조회
	 * @param search
	 * @param pagination
	 * @return noticeList
	 */
	public List<Notice> selectSearchList(Search search, Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1)*pagination.getLimit();
		RowBounds rowBouns = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("noticeMapper.selectSearchList", search, rowBouns);
	}


	/** 게시글 상세조회
	 * @param noticeNo
	 * @return notice
	 */
	public Notice selectNotice(int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}

	/** 게시글 삽입
	 * @param notice
	 * @return noticeNo
	 */
	public int insertNotice(Notice notice) {
		int result = sqlSession.insert("noticeMapper.insertNotice", notice);
		
		if(result>0) {
			return notice.getNoticeNo();
		}else {
			return 0;
		}
		
		
	}
	

	/** 게시글 수정
	 * @param notice
	 * @return
	 */
	public int updateNotice(Notice notice) {
		return sqlSession.update("noticeMapper.updateNotice", notice);
	}


	/** 게시글 삭제
	 * @param noticeNo
	 * @return
	 */
	public int delete(int noticeNo) {
		return sqlSession.update("noticeMapper.delete", noticeNo);
	}


	

	
}