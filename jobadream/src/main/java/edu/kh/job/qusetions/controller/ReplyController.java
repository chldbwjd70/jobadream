package edu.kh.job.qusetions.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import edu.kh.job.qusetions.model.service.ReplyService;
import edu.kh.job.qusetions.model.vo.Reply;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

	@Autowired
	private ReplyService service;

	
	// 댓글목록조회
	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public String selectList(int qusetionsNo) {
		
		List<Reply> rList = service.selectList(qusetionsNo);
		System.out.println(rList);
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm").create();
		return gson.toJson(rList);
	}


}
