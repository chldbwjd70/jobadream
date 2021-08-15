package edu.kh.job.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.job.board.model.vo.Board;
import edu.kh.job.board.model.vo.BoardProgress;
import edu.kh.job.board.model.vo.Category;
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

	/** 모든 카테고리 조회
	 * @return categoryList
	 */
	public List<Category> selectCategory() {
		return sqlSession.selectList("boardMapper.selectCategory");
	}

	/** 게시판 삽입
	 * @param board
	 * @return
	 */
	public int boardInsert(Board board) {
		int result = sqlSession.insert("boardMapper.boardInsert", board);
		
		if(result > 0) {
			return board.getBoardNo();
		}else {
			return 0;
		}
	}

	/** 게시판 삭제
	 * @param boardNo
	 * @return result
	 */
	public int boardDelete(int boardNo) {
		return sqlSession.update("boardMapper.boardDelete", boardNo);
	}

	/** 게시판 수정
	 * @param board
	 * @return result
	 */
	public int boardUpdate(Board board) {
		
		int result = sqlSession.update("boardMapper.boardUpdate",board);
		if(result > 0) {
			return board.getCategoryCode();
		}else {
			return 0;
		}
	}

	/** 진행 삽입
	 * @param boardProgress
	 * @return result
	 */
	public int boardProgress(BoardProgress boardProgress) {
		return sqlSession.insert("boardMapper.boardProgress", boardProgress);
	}

	/** realTimeSelect
	 * @return rList
	 */
	public List<Board> realTimeSelect() {
		
		
		return sqlSession.selectList("boardMapper.realTimeSelect");
		

	}

	/** 지원하기 클릭 시 게시판 상태 변경
	 * @param boardNo
	 * @return
	 */
	public int boardUpdateStatus(int boardNo) {
		return sqlSession.update("boardMapper.boardUpdateStatus", boardNo);
	}

	/** 평점 조회
	 * @param memberNo
	 * @return memberScore
	 */
	public double selectMemberScore(int memberNo) {
		return sqlSession.selectOne("boardMapper.selectMemberScore", memberNo);
		
		
	}

}
