package edu.kh.job.member.model.service;

import edu.kh.job.member.model.vo.Member;

public interface MemberService {

	// 로그인 
	Member login(Member inputMember);

	// 회원가입
	int signUp(Member inputMember);

	// 아이디 중복 검사
	int idDupCheck(String id);

}