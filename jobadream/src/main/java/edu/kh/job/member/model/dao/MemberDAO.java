package edu.kh.job.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.job.chat.model.vo.ChatAlarm;
import edu.kh.job.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 로그인 
	public Member login(String memberId) {
		return sqlSession.selectOne("memberMapper.login", memberId);
	}

	// 회원 가입
	public int signUp(Member inputMember) {
		return sqlSession.insert("memberMapper.signUp", inputMember);
	}

	// 아이디 중복 검사
	public int idDupCheck(String id) {
		return sqlSession.selectOne("memberMapper.idDupCheck", id);
	}

	// 회원 정보 수정
	public int updateMember(Member inputMember) {
		return sqlSession.update("memberMapper.updateMember", inputMember);
	}
	
	// 회원 비밀번호 조회
	public String selectPassword(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectPassword", memberNo);
	}

	// 회원 비밀번호 수정
	public int changPwd(Member loginMember) {
		return sqlSession.update("memberMapper.changPwd", loginMember);
	}

	// 회원 탈퇴
	public int secession(int memberNo) {
		return sqlSession.update("memberMapper.secession", memberNo);
	}

	// 아이디 찾기
	public String findId(Member findMemberId) {
		return sqlSession.selectOne("memberMapper.findId", findMemberId);
	}

	// 비밀번호 찾기 - 조회
	public int findPw(Member findMemberPw) {
		return sqlSession.selectOne("memberMapper.findPw", findMemberPw);
	}

	// 임시 비밀번호로 회원 정보 변경
	public int changePwd2(Member findMemberPw) {
		return sqlSession.update("memberMapper.changePwd2",findMemberPw);
	}

	// 알람 리스트 조회
	public List<ChatAlarm> selectAlarm(int memberNo) {
		return sqlSession.selectList("memberMapper.selectAlarm", memberNo);
	}

}
