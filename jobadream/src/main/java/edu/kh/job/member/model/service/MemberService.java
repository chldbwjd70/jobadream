package edu.kh.job.member.model.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import edu.kh.job.chat.model.vo.ChatAlarm;
import edu.kh.job.member.model.vo.Board;
import edu.kh.job.member.model.vo.Member;
import edu.kh.job.member.model.vo.Pagination;
import edu.kh.job.member.model.vo.Pagination2;

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
	
	// 이메일 전송
	int sendEmail(Member findMemberPw);

	// 핸드폰 전송
	void certifiedPhoneNumber(String memberPhone, String numStr);

	/** 알람 리스트 조회
	 * @param memberNo
	 * @return
	 */
	List<ChatAlarm> selectAlarm(int memberNo);

	// 잡아줌 조회
	Pagination getPagination(Pagination pg, int memberNo);

	// 잡아줌 목록조회
	List<Board> selectajumList(Pagination pagination, int memberNo, int memberNo2);

	// 잡아감 조회
	Pagination2 getPagination2(Pagination2 pg2, int memberNo);

	// 잡아감 목록 조회
	List<Board> selectagamList(Pagination2 pagination2, int memberNo, int memberNo2);

	// 점수 등록
	int avgPoint(int rating, int boardNo, Member countMember);

	// 포인트 감소
	Member changPoint(int memberNo);

	// 상대 포인트 추가
	int plusPoint(Member changePoint);



}
