package edu.kh.job.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.job.member.model.dao.MemberDAO;
import edu.kh.job.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MemberDAO dao;

	// 로그인 
	@Override
	public Member login(Member inputMember) {

		String encPw = bCryptPasswordEncoder.encode( inputMember.getMemberPw() );
		System.out.println("암호화된 비밀번호 : " + encPw);
		
		Member loginMember = dao.login(inputMember.getMemberId());
		
		if(loginMember != null) {
			
			// 입력 받은 비밀번호와 DB 저장 암호화 비밀번호를 비교하여 일치하지 않는 경우
			if( !bCryptPasswordEncoder.matches(inputMember.getMemberPw(), loginMember.getMemberPw()) ) {
											// 입력 받은 비밀번호     ,   DB 저장된 암호화 비밀번호
				loginMember = null;
			
			}else {
				loginMember.setMemberPw(null); 
			}
		}
		
		return loginMember;
	}

	// 회원 가입 
	@Transactional (rollbackFor = Exception.class) 
	@Override
	public int signUp(Member inputMember) {
		
		String encPwd = bCryptPasswordEncoder.encode( inputMember.getMemberPw() );
		
		inputMember.setMemberPw(encPwd);
		
		return dao.signUp(inputMember);
	}

	// 아이디 중복 검사
	@Override
	public int idDupCheck(String id) {
		return dao.idDupCheck(id);
	}

}
