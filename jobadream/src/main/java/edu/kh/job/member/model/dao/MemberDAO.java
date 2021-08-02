package edu.kh.job.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
