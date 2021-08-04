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

	// 회원 정보 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateMember(Member inputMember) {
		return dao.updateMember(inputMember);
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int changPwd(String currentPwd, String newPwd, Member loginMember) {
		
		// DB에 저장되어 있는 현재 회원의 비밀번호 조회
		String savePwd = dao.selectPassword(loginMember.getMemberNo());
		
		int result = 0; 
		
		// 조회한 비밀번호와 입력 받은 현재 비밀번호가 일치하는지 확인
		if( bCryptPasswordEncoder.matches(currentPwd, savePwd)  ) {

			String encPwd = bCryptPasswordEncoder.encode(newPwd);
			
			loginMember.setMemberPw(encPwd);
			
			result = dao.changPwd(loginMember);
			
			loginMember.setMemberPw(null);
		}
		
		return result;
	}

	// 회원 탈퇴
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int secession(String currentPwd, int memberNo) {
		
		// 저장된 비밀번호를 얻어와 비교
		String savePwd = dao.selectPassword(memberNo);
		
		int result = 0;
		if( bCryptPasswordEncoder.matches(currentPwd, savePwd)  ) {
			
			result = dao.secession(memberNo);
		}
		return result;
	}
	
	// 크로스 사이트 스크립트 방지 처리 메소드
	public static String replaceParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		
		return result;
	}

	

}
