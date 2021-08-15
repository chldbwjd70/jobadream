package edu.kh.job.board.model.service;

import java.util.List;

import edu.kh.job.board.model.vo.Board;
import edu.kh.job.board.model.vo.BoardProgress;
import edu.kh.job.board.model.vo.Category;
import edu.kh.job.board.model.vo.Pagination;

public interface BoardService {

	
	/** 특정 게시판 pagination  객체 생성
	 * @param pg
	 * @return pagination
	 */
	Pagination getPagination(Pagination pg);

	
	/** 전체 게시판 글 pagination 객체 생성
	 * @return pagination
	 */
	Pagination getAllPagination(Pagination pg);


	/** 특정 게시판 목록 조회
	 * @param pagination
	 * @return boardList
	 */
	List<Board> selectBoardList(Pagination pagination);


	/** 전제 게시글 목록 조회
	 * @param pagination
	 * @return boardList
	 */
	List<Board> selectAllBoardList(Pagination pagination);


	/** 게시글 상세조회
	 * @param boardNo
	 * @return
	 */
	Board selectBoard(int boardNo);


	/** 모든 카테고리 조회
	 * @return
	 */
	List<Category> selectCategory();


	/** 게시판 삽입
	 * @param board
	 * @return boardNo
	 */
	int boardInsert(Board board);


	/** 게시판 삭제
	 * @param boardNo
	 * @return result
	 */
	int boardDelete(int boardNo);


	/** 게시판 수정 화면 전환
	 * @param boardNo
	 * @return
	 */
	Board selectUpdateBoard(int boardNo);


	/** 게시판 수정
	 * @param board
	 * @return
	 */
	int boardUpdate(Board board);


	/** 지원하기 클릭 시 게시글 상태 변경
	 * @param boardNo
	 * @return
	 */
	int boardUpdateStatus(int boardNo);


	/** 진행 삽입
	 * @param boardProgress
	 * @return result
	 */ 
	int boardProgress(BoardProgress boardProgress);


	/** 실시간 게시글 TOP3 조회
	 * @return rList
	 */
	List<Board> realTimeSelect();


	/** 평점 조회
	 * @param memberNo
	 * @return
	 */
	double selectMemberScore(int memberNo);



}
