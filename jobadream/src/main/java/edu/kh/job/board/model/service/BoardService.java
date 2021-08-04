package edu.kh.job.board.model.service;

import java.util.List;

import edu.kh.job.board.model.vo.Board;
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



}
