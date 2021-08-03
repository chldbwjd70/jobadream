package edu.kh.job.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.job.board.model.service.BoardService;

@Controller
@RequestMapping("/board/*")
@SessionAttributes({"loginMember"})
public class boardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("{categoryCode}/list")
	public String boardList(@PathVariable("categoryCode") int categoryCode,
							Model model) {
		return null;
	}

}
