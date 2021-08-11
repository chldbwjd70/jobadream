package edu.kh.job.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import edu.kh.job.board.model.service.BoardService;
import edu.kh.job.board.model.vo.Board;

@RestController 

@RequestMapping("/real/*")
public class boardRealTimeController {
	
	@Autowired
	private BoardService service;
	
	// 실시간 게시글 TOP5 조회
	@RequestMapping(value ="realList", method=RequestMethod.POST)
	public String realTimeSelect() {
		
		List<Board> rList = service.realTimeSelect();
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(rList);
	}
	
	

}
