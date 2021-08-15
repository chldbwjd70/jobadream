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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import edu.kh.job.board.model.service.BoardService;
import edu.kh.job.board.model.vo.Board;
import edu.kh.job.board.model.vo.BoardProgress;
import edu.kh.job.board.model.vo.Category;
import edu.kh.job.board.model.vo.Pagination;
import edu.kh.job.member.controller.MemberController;
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
	@RequestMapping("{categoryCode}/{boardNo}")
	public String boardDetail(@PathVariable("categoryCode") int categoryCode,
			@PathVariable("boardNo") int boardNo,
			@RequestParam(value = "cpage" ,required = false, defaultValue = "1" ) int cpage,
			Model model,
			RedirectAttributes ra) {
		
		Board board = service.selectBoard(boardNo);
		
		// 평점 조회
		double memberScore = service.selectMemberScore(board.getMemberNo());
		
		board.setMemberScore(memberScore);
		
		if(board != null) { // 상세 조회 성공 시
			
			model.addAttribute("board", board);
			return "board/boardDetail";
			
		}else{ 
			return "redirect:list";
		}
		
	}
	
	// 게시판 등록 화면 전환 Controller
	@RequestMapping(value = "/insert", method=RequestMethod.GET)
	public String boardForm(Model model) {
		
		// DB에서 CATEGORY 테이블 내용을 모두 조회해오기
		List<Category> category = service.selectCategory();  
		
		//System.out.println(category);
		model.addAttribute("category",category);
		
		return "board/boardInsert";
		
	}
	
	// 게시판 등록
	@RequestMapping(value = "/insert", method=RequestMethod.POST)
	public String boardInsert(@ModelAttribute Board board,
								@ModelAttribute("loginMember") Member loginMember,
								HttpServletRequest request,
								RedirectAttributes ra) {
		board.setMemberNo(loginMember.getMemberNo());
		System.out.println(board);
		
		int boardNo = service.boardInsert(board);
		String path = null;
		if(boardNo > 0) {
			
			path = "redirect:" + board.getCategoryCode() + "/" + boardNo;
			ra.addFlashAttribute("icon", "success");
			ra.addFlashAttribute("title", "해주세요 등록 성공");
		}else {
			
	    	path = "redirect:" + request.getHeader("referer"); // 요청 이전 주소
			ra.addFlashAttribute("icon", "error");
			ra.addFlashAttribute("title", "해주세요 등록 실패");
		}
		return path;
	}
	
	// 게시판 삭제
	@RequestMapping(value = "{categoryCode}/deleteFaq/{boardNo}", method=RequestMethod.GET)
	public String boardDelete(@PathVariable("boardNo") int boardNo,
								@PathVariable("categoryCode") int categoryCode,
								@RequestParam(value = "cpage" ,required = false, defaultValue = "1" ) int cpage,
							HttpServletRequest request, RedirectAttributes ra) {
		
		int result = service.boardDelete(boardNo);
		
	   String path = null;
       if(result > 0) { // 삽입 성공
    	  path = "redirect:../list";
    	  MemberController.swalSetMessage(ra, "success", "해주세요 삭제 성공", null);
    	  
       }else { // 삽입 실패
    	  
    	  path = "redirect:" + request.getHeader("referer"); 
    	  MemberController.swalSetMessage(ra, "error", "해주세요 삭제 실패", null);
       }
		return path;
	}
	
	// 게시판 수정 화면전환
	@RequestMapping(value="{categoryCode}/updateForm/{boardNo}", method=RequestMethod.GET)
	public String updateForm(@PathVariable("boardNo") int boardNo,
						@PathVariable("categoryCode") int categoryCode,
						Model model) {
		
		List<Category> category = service.selectCategory();
		
		Board board = service.selectUpdateBoard(boardNo);
		
		model.addAttribute("category",category);
		model.addAttribute("board",board);
		
		return "board/boardUpdate";
		
	}
	
	// 게시판 수정
	@RequestMapping(value="{categoryCode}/update/{boardNo}", method=RequestMethod.POST)
	public String boardUpdate(@ModelAttribute Board board,
							HttpServletRequest request, RedirectAttributes ra) {
		
		
		int categoryCode = service.boardUpdate(board);
		System.out.println(categoryCode);
		
		String path = null;
		if(categoryCode > 0) {
			path = "redirect:../../" + categoryCode + "/" +board.getBoardNo();
			MemberController.swalSetMessage(ra, "success", "해주세요 수정 성공", null);
			
		}else {
	    	  path = "redirect:" + request.getHeader("referer"); 
	    	  MemberController.swalSetMessage(ra, "error", "해주세요 수정 실패", null);
			
		}
		
		return path;
	}
	
	// 지원하기 
	@RequestMapping(value = "{categoryCode}/progress/{boardNo}", method = RequestMethod.GET)
	public String boardProgress(@PathVariable("boardNo") int boardNo,
								@ModelAttribute("loginMember") Member loginMember,
								@ModelAttribute BoardProgress boardProgress,
								RedirectAttributes ra, HttpServletRequest request
								) {
		
		// 지원하기 클릭 시 게시판 status 변경
		int result = service.boardUpdateStatus(boardNo);
		
		boardProgress.setBoardNo(boardNo);
		boardProgress.setMemberNo(loginMember.getMemberNo());
		
		String path = null;
		
		if(result > 0) { // status 변경 성공 시
			// progress 테이블에 진행 삽입
			result = service.boardProgress(boardProgress);
			if(result > 0) {
			  	  path = "redirect:../list";
		    	  MemberController.swalSetMessage(ra, "success", "지원 완료", "자세한 진행상황은 마이페이지[이용내역]에서 확인해주세요");
			}else {
		    	  path = "redirect:" + request.getHeader("referer"); 
		    	  MemberController.swalSetMessage(ra, "error", "지원 중 오류 발생", null);
			}
			
		}else {
	    	  path = "redirect:" + request.getHeader("referer"); 
	    	  MemberController.swalSetMessage(ra, "error", "지원 중 오류 발생", null);
			
		}
		
		return path;
	}
	

	
}
