package edu.kh.job.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.job.board.model.service.BoardService;
import edu.kh.job.board.model.vo.Board;
import edu.kh.job.board.model.vo.Pagination;

@Controller
@RequestMapping("/board/*")
@SessionAttributes({"loginMember"})
public class boardController {
	
	@Autowired
	private BoardService service;
	
	// 특정 게시판 목록 조회
	@RequestMapping("{categoryCode}/list")
	public String boardList(@PathVariable("categoryCode") int categoryCode,
							@RequestParam(value="cpage", required = false, defaultValue = "1") int cpage,
							Model model, Pagination pg) {
		
			pg.setCategoryCode(categoryCode);
			pg.setCurrentPage(cpage);
			
			Pagination  pagination = service.getPagination(pg);
			
			List<Board> boardList = service.selectBoardList(pagination);
			
			System.out.println(pagination);
			model.addAttribute("boardList",boardList);
			model.addAttribute("pagination",pagination);
			
		return "board/boardList";
	}

	// 전체보기 게시판 목록 조회
	@RequestMapping("list")
	public String boardAllList(@RequestParam(value="cpage", required = false, defaultValue = "1") int cpage,
							Model model, Pagination pg)	{
		
		pg.setCurrentPage(cpage);
		
		Pagination  pagination = service.getAllPagination(pg);
		
		List<Board> boardList = service.selectAllBoardList(pagination);
		
		System.out.println(pagination);
		model.addAttribute("boardList",boardList);
		model.addAttribute("pagination",pagination);
		
		
		return "board/boardList";
	}
	
	
}
