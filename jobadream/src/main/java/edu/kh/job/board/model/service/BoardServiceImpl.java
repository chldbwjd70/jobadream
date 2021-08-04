package edu.kh.job.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.job.board.model.dao.BoardDAO;
import edu.kh.job.board.model.vo.Board;
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

}
