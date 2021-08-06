package edu.kh.job.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.job.board.model.service.BoardService;
import edu.kh.job.board.model.vo.Board;
import edu.kh.job.board.model.vo.Category;
import edu.kh.job.board.model.vo.Pagination;
import edu.kh.job.member.model.vo.Member;

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
			
			//System.out.println(pagination);
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
		
		//System.out.println(pagination);
		model.addAttribute("boardList",boardList);
		model.addAttribute("pagination",pagination);
		
		
		return "board/boardList";
	}
	
	// 게시판 상세조회
	@RequestMapping("/{categoryCode}/{boardNo}")
	public String boardDetail(@PathVariable("categoryCode") int categoryCode,
			@PathVariable("boardNo") int boardNo,
			@RequestParam(value = "cp" ,required = false, defaultValue = "1" ) int cp,
			Model model,
			RedirectAttributes ra) {
		
		Board board = service.selectBoard(boardNo);
		//System.out.println(board);
		
		if(board != null) { // 상세 조회 성공 시
			
			model.addAttribute("board", board);
			return "board/boardDetail";
		}else { 
			
			return "redirect:list";
		}
	}
	
	// 게시판 등록 화면 전환 Controller
	@RequestMapping(value = "{categoryCode}/insert", method=RequestMethod.GET)
	public String boardForm(Model model) {
		
		// DB에서 CATEGORY 테이블 내용을 모두 조회해오기
		List<Category> category = service.selectCategory();  
		
		//System.out.println(category);
		model.addAttribute("category",category);
		
		return "board/boardInsert";
		
	}
	
	// 게시판 등록
	@RequestMapping(value = "{categoryCode}/insert", method=RequestMethod.POST)
	public String boardInsert(@ModelAttribute Board board,
								@ModelAttribute("loginMember") Member loginMember,
								HttpServletRequest request,
								RedirectAttributes ra) {
		board.setMemberNo(loginMember.getMemberNo());
		System.out.println(board);
		
		int boardNo = service.boardInsert(board);
		String path = null;
		if(boardNo > 0) {
			
			path = "redirect:" + boardNo;
			ra.addFlashAttribute("icon", "success");
			ra.addFlashAttribute("title", "해주세요 등록 성공");
		}else {
			
	    	path = "rediect:" + request.getHeader("referer"); // 요청 이전 주소
			ra.addFlashAttribute("icon", "error");
			ra.addFlashAttribute("title", "해주세요 등록 실패");
		}
		return path;
	}
	
	
}
