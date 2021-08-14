package edu.kh.job.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.job.member.model.service.MemberService;
import edu.kh.job.member.model.vo.Import;
import edu.kh.job.member.model.vo.Member;

@RestController
@SessionAttributes({ "loginMember" })
public class PointUpdateController {

	@Autowired
	private MemberService service;

	// 이용내역
	@RequestMapping(value = "pointUpdate", method = RequestMethod.POST)
	public int pointUpdate(@RequestParam("inputPoint") int inputPoint, Import PointMember,
			@ModelAttribute("loginMember") Member loginMember, Member AddPoint) {

		PointMember.setMemberNo(loginMember.getMemberNo());
		PointMember.setImportMoney(inputPoint);

		int result = service.pointUpdate(PointMember);

		AddPoint.setMemberPoint(loginMember.getMemberPoint());
		AddPoint.setMemberNo(loginMember.getMemberNo());
		AddPoint.setInputPoint(inputPoint);

		int result2 = service.pointadd(AddPoint);

		
		Member checkPoint = service.checkPoint(loginMember.getMemberNo());
		
		if(result2 > 0) { loginMember.setMemberPoint(checkPoint.getMemberPoint()); }

		return result;
	}

}
