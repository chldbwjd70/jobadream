package edu.kh.job.member.controller;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.job.member.model.service.MemberService;
import edu.kh.job.member.model.vo.Member;

@RestController
@SessionAttributes({"loginMember"})
public class PointController {
	
	@Autowired
	private MemberService service;
	
	//휴대폰 인증
	@RequestMapping(value="avgPoint",method=RequestMethod.POST)
	public int avgPoint(@RequestParam("rating") int rating, @RequestParam(value="boardNo",required=false)int boardNo,
						@ModelAttribute("loginMember") Member loginMember, Member countMember, Model model ) {
		
		countMember.setMemberNo(loginMember.getMemberNo());
		countMember.setMemberPoint(loginMember.getMemberPoint());
		
		countMember.setBoardNo(boardNo);
		
	 	int ponit =  service.updatePoint(countMember);
	 	
	 	System.out.println(countMember);
		
		System.out.println("입력한 점수 : "+ rating);
		System.out.println("게시글 번호 : "+ boardNo);
	
		int result = service.avgPoint(rating, boardNo);
		
       return result;
    }
	

}
