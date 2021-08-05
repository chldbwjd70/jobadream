package edu.kh.job.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@RequestMapping("/{categoryCode}/{boardNo}")
	public String boardDetail(@PathVariable("categoryCode") int categoryCode,
			@PathVariable("boardNo") int boardNo,
			@RequestParam(value = "cp" ,required = false, defaultValue = "1" ) int cp,
			Model model,
			RedirectAttributes ra) {
		
		Board board = service.selectBoard(boardNo);
		System.out.println(board);
		
		if(board != null) { // 상세 조회 성공 시
			
			model.addAttribute("board", board);
			return "board/boardDetail";
		}else { 
			
			return "redirect:list";
		}
	}
	
	
}
