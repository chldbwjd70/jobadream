package edu.kh.job.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.job.chat.model.vo.ChatAlarm;
import edu.kh.job.member.model.dao.MemberDAO;
import edu.kh.job.member.model.vo.Board;
import edu.kh.job.member.model.vo.Import;
import edu.kh.job.member.model.vo.Member;
import edu.kh.job.member.model.vo.Pagination;
import edu.kh.job.member.model.vo.Pagination2;
import edu.kh.job.member.model.vo.Pagination3;
import edu.kh.job.member.model.vo.Progress;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired  
	private JavaMailSender mailSender; 

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

	// 아이디 찾기
	@Override
	public String findId(Member findMemberId) {
		return dao.findId(findMemberId);

	}

	// 비밀번호 찾기 - 조회
	@Override
	public int findPw(Member findMemberPw) {
		return dao.findPw(findMemberPw);
	}

	// 이메일 보내기
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int sendEmail(Member inputMember) {
		
		
		int leftLimit = 65; // letter 'a'
		int rightLimit = 122; // letter 'z'
		int targetStringLength = 10;
		Random random = new Random();
		StringBuilder buffer = new StringBuilder(targetStringLength);
		for (int i = 0; i < targetStringLength; i++) {
		    int randomLimitedInt = leftLimit + (int)
		            (random.nextFloat() * (rightLimit - leftLimit + 1));
		    buffer.append((char) randomLimitedInt);
		}
		String garbagePassword = buffer.toString();
		String encPwd = bCryptPasswordEncoder.encode(garbagePassword.toString());
		
		inputMember.setMemberPw(encPwd);
		
		int result = dao.changePwd2(inputMember);
		
		if (result > 0) {
			
			String setfrom = "khjobadream@gmail.com"; // 보내는 서버 이메일
			String tomail = inputMember.getMemberEmail(); // 받는 사람 이메일
			String title = "job아드림 임시 비밀번호입니다."; // 제목
			
			String  content="";
			content += "<h3> job아드림 임시 비밀번호 입니다.";
			content += "<div font-family: 'Pretendard-Regular';>";
			content += "</h3> <h2> "+ garbagePassword + "</h2>"; // 내용
			content +=  "<h3 style='color:red;'>로그인 후 비밀번호를 변경해주시기 바랍니다.</h3></div>";
			
			try {
				
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content, true); // 메일 내용
				
				mailSender.send(message);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			result = -1;
		}
		
		return result;
	}
	
	// ------------------------------------------------------------------------------------------------------------- 마이페이지
	
	// 회원 정보 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateMember(Member inputMember) {
		
		inputMember.setMemberIntroduce(replaceParameter(inputMember.getMemberIntroduce()));
		
		return dao.updateMember(inputMember);
	}
	
	// 평균
	@Override
	public Import memberScore( int memberNo) {
		
		System.out.println("memberNos" + memberNo);
		return dao.memberScore(memberNo);
	}

	// 비밀번호 변경
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

	
	
	// 휴대폰 인증
	@Override
    public void certifiedPhoneNumber(String memberPhone, String numStr) {

        String api_key = "NCSLWLUNEAYBTBGN";
        String api_secret = "ODGJKFE1RMX385GST2IRCKNDF1XHUMJG";
        Message coolsms = new Message(api_key, api_secret);
        
        System.out.println("서비스 인증 번호 : " + numStr);
        System.out.println("서비스 멤버 번호 : " + memberPhone);
        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", memberPhone);    // 수신전화번호
        params.put("from", "010-5624-3195");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "job아드림 인증번호는" + "["+numStr+"]" + "입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }

    }

	// 알람 리스트 조회
	@Override
	public List<ChatAlarm> selectAlarm(int memberNo) {
		return dao.selectAlarm(memberNo);
	}


	// --------------------------------------------------------------------------------------------------------------------- 결제
	
	
	// 아줌게시글수
	@Override
	public Pagination getPagination(Pagination pg, int memberNo) {

		Pagination selectajumPg = dao.getajumListCount(memberNo);
		return new Pagination(pg.getCurrentPage(), selectajumPg.getListCount());
	}

	// 잡아줌 목록 조회
	@Override
	public List<Board> selectajumList(Pagination pagination, int memberNo, int memberNo2) {
		return dao.selectajumList(pagination, memberNo, memberNo2);
	}

	// 아감게시글수
	@Override
	public Pagination2 getPagination2(Pagination2 pg2, int memberNo) {
		
		Pagination2 selectajumPg = dao.getagamListCount(memberNo);
		return new Pagination2(pg2.getCurrentPage(), selectajumPg.getListCount());
	}

	// 잡아감 목록 조회
	@Override
	public List<Board> selectagamList(Pagination2 pagination2, int memberNo, int memberNo2) {
		return dao.selectagamList(pagination2, memberNo, memberNo2);
	}

	// 진행완료 버튼
	@Override
	public int avgPoint(int rating, int boardNo, Member countMember) {
		
		Progress progress = new Progress();
		
		progress.setMemberScore(rating);
		progress.setBoardNo(boardNo);
		
		int teste =  dao.avgPoint(progress);
		
		return dao.updatePoint(countMember, teste);
	}

	// 포인트 감소
	@Override
	public Member changPoint(int memberNo) {
		return dao.changPoint(memberNo);
	}

	// 포인트 추가
	@Override
	public int plusPoint(Member changePoint) {
		return dao.plusPoint(changePoint);
	}

	// 결제 내역 수
	@Override
	public Pagination3 getPagination3(Pagination pg, int memberNo) {

		Pagination3 selectpoint = dao.getpointListCount(memberNo);
		return new Pagination3(pg.getCurrentPage(), selectpoint.getListCount());
	}

	// 결제 목록 조회
	@Override
	public List<Import> sellHistory(Pagination3 pagination3, int memberNo) {
		return dao.sellHistory(pagination3, memberNo);
	}

	// 포인트 충전 -1
	@Override
	public int pointUpdate(Import pointMember) {
		return dao.pointUpdate(pointMember);
	}

	// 포인트 충전 -2
	@Override
	public int pointadd(Member addPoint) {
		return dao.pointadd(addPoint);
	}

	// 새로고침
	@Override public Member checkPoint(int memberNo) 
	{ return dao.plusPoint(memberNo); }
	
	

}
