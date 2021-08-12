package edu.kh.job.member.model.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import edu.kh.job.chat.model.vo.ChatAlarm;
import edu.kh.job.member.model.vo.Member;

public interface MemberService {

	// 로그인 
	Member login(Member inputMember);

	// 회원가입
	int signUp(Member inputMember);

	// 아이디 중복 검사
	int idDupCheck(String id);

	// 회원 정보 수정
	int updateMember(Member inputMember);

	// 비밀 번호 수정
	int changPwd(String currentPwd, String newPwd, Member loginMember);

	// 회원 탈퇴
	int secession(String currentPwd, int memberNo);

	// 아이디 찾기
	String findId(Member findMemberId);

	// 비밀번호 찾기-조회
	int findPw(Member findMemberPw);
	
	int sendEmail(Member findMemberPw);

	void certifiedPhoneNumber(String memberPhone, String numStr);

	/** 알람 리스트 조회
	 * @param memberNo
	 * @return
	 */
	List<ChatAlarm> selectAlarm(int memberNo);








	



}
