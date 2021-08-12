package edu.kh.job.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.job.board.model.dao.BoardDAO;
import edu.kh.job.board.model.vo.Board;
import edu.kh.job.board.model.vo.BoardProgress;
import edu.kh.job.board.model.vo.Category;
import edu.kh.job.board.model.vo.Pagination;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO dao;

	// 카테고리별 게시글 수
	@Override
	public Pagination getPagination(Pagination pg) {
		
		Pagination selectPg = dao.getListCount(pg.getCategoryCode());
		
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount(), pg.getCategoryCode(), selectPg.getCategoryTitle());
	}

	// 전체 게시글 수
	@Override
	public Pagination getAllPagination(Pagination pg) {
		
		int listCount = dao.getAllListCount();
		
		return new Pagination(pg.getCurrentPage(), listCount);
	}

	// 특정 게시판 목록 조회
	@Override
	public List<Board> selectBoardList(Pagination pagination) {
		return dao.selectBoardList(pagination);
	}

	// 전제 게시판 목록 조회
	@Override
	public List<Board> selectAllBoardList(Pagination pagination) {
		return dao.selectAllBoardList(pagination);
	}

	// 게시글 상세조회
	@Override
	public Board selectBoard(int boardNo) {
		return dao.selectBoard(boardNo);
	}

	// 모든 카테고리 조회
	@Override
	public List<Category> selectCategory() {
		return dao.selectCategory();
	}

	// 게시판 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int boardInsert(Board board) {
		
		board.setBoardTitle(replaceParameter(board.getBoardTitle()));
		board.setBoardContent(replaceParameter(board.getBoardContent()));
		board.setBoardContent(  board.getBoardContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>")  );
		
		int boardNo = dao.boardInsert(board);
		
		
		return boardNo;
	}
	
	// 게시판 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int boardDelete(int boardNo) {
		return dao.boardDelete(boardNo);
	}
	
	// 크로스 사이트 스크립트 방지 처리 메소드
	public static String replaceParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		
		return result;
	}

	// 게시글 수정 화면 전환
	@Override
	public Board selectUpdateBoard(int boardNo) {
		
		Board board = dao.selectBoard(boardNo);
		
		board.setBoardContent(board.getBoardContent().replaceAll("<br>","\r\n"));
		
		return board;
	}

	// 게시글 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int boardUpdate(Board board) {
		
		board.setBoardTitle(replaceParameter(board.getBoardTitle()));
		board.setBoardContent(replaceParameter(board.getBoardContent()));
		board.setBoardContent(  board.getBoardContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>")  );
		
		return dao.boardUpdate(board);
	}

	// 지원하기 클릭 시 게시판 상태 변경
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int boardUpdateStatus(int boardNo) {
		return dao.boardUpdateStatus(boardNo);
	}

	// 진행 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int boardProgress(BoardProgress boardProgress) {
		return dao.boardProgress(boardProgress);
	}

	// 실시간 게시글 TOP3 조회
	@Override
	public List<Board> realTimeSelect() {
		return dao.realTimeSelect();
	}


}
