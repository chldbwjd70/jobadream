package edu.kh.job.member.controller;

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
	
	//이용내역
	@RequestMapping(value="avgPoint",method=RequestMethod.POST)
	public int avgPoint(@RequestParam("rating") int rating, @RequestParam(value="boardNo",required=false)int boardNo,
						@RequestParam(value="memberNo2",required=false)int memberNo2, @RequestParam(value="memberPoint2",required=false)int memberPoint2,
						@ModelAttribute("loginMember") Member loginMember, Member countMember, Member PulsePoint ) {
		
		System.out.println("입력한 점수 : "+ rating);
		System.out.println("게시글 번호 : "+ boardNo);
		System.out.println("지원한 회원 번호 : " + memberNo2);
		System.out.println("지원한 회원 포인트 : " + memberPoint2);
		
		
		
		countMember.setMemberNo(loginMember.getMemberNo());
		countMember.setMemberPoint(loginMember.getMemberPoint());
		countMember.setBoardNo(boardNo);
		
		System.out.println("ddddsf : " + countMember );
	
		// 상대 점수 
		int result = service.avgPoint(rating, boardNo, countMember);
		
		// 조회용
		Member changePoint = service.changPoint(loginMember.getMemberNo());
		
		// 세션 반환
		if(result > 0) {
			loginMember.setMemberPoint(changePoint.getMemberPoint());
		}
		
		// -----------------------------------------------------------------------------
		
		PulsePoint.setMemberNo(memberNo2);
		PulsePoint.setMemberPoint(memberPoint2);
		PulsePoint.setBoardNo(boardNo);
		
		// 상대 포인트 추가
		int result2 = service.plusPoint(PulsePoint);
		
	
       return result;
    }
	

}
