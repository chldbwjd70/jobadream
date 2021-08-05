package edu.kh.job.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.job.board.model.vo.Board;
import edu.kh.job.board.model.vo.Pagination;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 특정 게시판 게시글 조회
	 * @param categoryCode
	 * @return pagination
	 */
	public Pagination getListCount(int categoryCode) {
		return sqlSession.selectOne("boardMapper.getListCount", categoryCode);
	}

	/** 특정 게시판 목록 조회
	 * @param pagination
	 * @return boardList
	 */
	public List<Board> selectBoardList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("boardMapper.selectBoardList", pagination.getCategoryCode(), rowBounds);
	}

	/** 전체 게시글 수
	 * @return
	 */
	public int getAllListCount() {
		return sqlSession.selectOne("boardMapper.getAllListCount");
	}

	/** 전제 게시판 목록 조회
	 * @param pagination
	 * @return
	 */
	public List<Board> selectAllBoardList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("boardMapper.selectAllBoardList", pagination, rowBounds);
		//return sqlSession.selectList("boardMapper.selectAllBoardList", pagination);
	}

	/** 게시글 상세조회
	 * @param boardNo
	 * @return
	 */
	public Board selectBoard(int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard",boardNo);
	}

}
