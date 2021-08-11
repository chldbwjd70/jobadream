package edu.kh.job.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.job.member.model.service.MemberService;
import edu.kh.job.member.model.vo.Member;

@Controller
@RequestMapping("/member/*")
@SessionAttributes({"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 오류화면
	@RequestMapping(value="error", method=RequestMethod.GET)  
	public String error() { 
		return "common/errorpage"; 
	}
	// 오류화면404
	@RequestMapping(value="error404", method=RequestMethod.GET)  
	public String error404() { 
		return "common/error404"; 
	}
	
	
	// 로그인 
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Member inputMember, Model model,
						HttpServletRequest request, HttpServletResponse response,
						RedirectAttributes ra, @RequestParam(value="save", required=false) String save) {
		
		Member loginMember =  service.login(inputMember);
		
		if(loginMember != null) { 
			if(loginMember.getMemberStatus().equals("Y")) {
				model.addAttribute("loginMember", loginMember); 
				
				Cookie cookie = new Cookie("saveId", loginMember.getMemberId());
				
				if(save != null) { 
					cookie.setMaxAge(60 * 60 * 24 * 30); 
				}else {  
					cookie.setMaxAge(0);
				}
				cookie.setPath( request.getContextPath() ); 
				response.addCookie(cookie);
				ra.addFlashAttribute("title", "job아드림");
				ra.addFlashAttribute("text", loginMember.getMemberId()+"님 환영합니다.");
				
				
			}else {
				ra.addFlashAttribute("icon", "error");
				ra.addFlashAttribute("title", "로그인 실패");
				ra.addFlashAttribute("text", "관리자로 인해 정지된 회원입니다.");
			}
		
		}else { 
			ra.addFlashAttribute("icon", "error");
			ra.addFlashAttribute("title", "로그인 실패");
			ra.addFlashAttribute("text", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
		}
		return "redirect:/";
	}
	
	// 로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(SessionStatus status, RedirectAttributes ra) {
		status.setComplete();
		
		ra.addFlashAttribute("title", "로그아웃");
		ra.addFlashAttribute("text", "이용해주셔서 갑사합니다.");
		
		return "redirect:/";
	}
	
	// 약관 화면 전환
	@RequestMapping(value="terms", method=RequestMethod.GET)  
	public String terms() { 
		return "member/terms"; 
	}
	
	// 회원가입 화면 전환
	@RequestMapping(value="signUp", method=RequestMethod.GET)  
	public String signUp() { 
		return "member/signUp"; 
	}
	
	// 회원 가입 
	@RequestMapping(value="signUp", method=RequestMethod.POST )
	public String signUp( @ModelAttribute Member inputMember , RedirectAttributes ra   ) {

		System.out.println(inputMember);
		
		int result = service.signUp(inputMember);
		
		if( result > 0 ) {
			swalSetMessage(ra, "success", "회원 가입 성공",  inputMember.getMemberName() + "님 환영합니다.");
		}else {
			swalSetMessage(ra, "error", "회원 가입 실패",  "고객센터로 문의해주세요.");
		}
		return "redirect:/"; 
	}
	
	// 아이디 중복 검사 
	@ResponseBody
	@RequestMapping(value="idDupCheck", method=RequestMethod.POST)
	public int idDupCheck(@RequestParam("id") String id) {
		
		// 아이디 중복 검사 Service 호출
		int result = service.idDupCheck(id);
		return result;
		
	}
	
	// 아아디,비밀번호 찾기 화면 전환
	@RequestMapping(value="findId", method=RequestMethod.GET)  
	public String findId() { 
		return "member/findId"; 
	}
	
	// 아이디 찾기
	@RequestMapping(value="findId", method=RequestMethod.POST)  
	public String findId(@RequestParam("findEamil") String findEamil, @RequestParam("findName") String findName,
						@ModelAttribute Member findMemberId,  RedirectAttributes ra, Model model, @RequestHeader("referer") String referer ) { 
		
		findMemberId.setMemberEmail(findEamil);
		findMemberId.setMemberName(findName);
		
		String memberId = service.findId(findMemberId);
		findMemberId.setMemberId(memberId);
		
		if(memberId != null) {
			
			model.addAttribute("findMemberId", findMemberId); 
			
			ra.addFlashAttribute("icon", "success");
			ra.addFlashAttribute("text", findMemberId.getMemberName()+"님의 아이디는 다음과 같습니다.");
			ra.addFlashAttribute("title",  findMemberId.getMemberId());
		}else { // 실패
			ra.addFlashAttribute("icon", "error");
			ra.addFlashAttribute("title",  "일치하는 회원 정보가 없습니다.");
		}
		return "redirect:" + referer;
	}
	
	// 아아디,비밀번호 찾기 화면 전환
	@RequestMapping(value="findPw", method=RequestMethod.GET)  
	public String findPw() { 
		return "member/findPw"; 
	}
	
	// 비밀번호 찾기(회원 정보 확인)
	@RequestMapping(value="findPw", method =RequestMethod.POST)  
	public String findPw( @RequestParam("findName2") String findName,  @RequestParam("findEamil2") String findEamil,
						@RequestParam("findId2") String findId, 
						@ModelAttribute Member findMemberPw, RedirectAttributes ra, Model model, 
						@RequestHeader("referer") String referer ) { 
		
		findMemberPw.setMemberEmail(findEamil);
		findMemberPw.setMemberName(findName);
		findMemberPw.setMemberId(findId);
		
		int result = service.findPw(findMemberPw);
		
		String path = null;
		
		if (result > 0) {
			
			model.addAttribute("findMemberPw", findMemberPw); 
			
			result = service.sendEmail(findMemberPw);
			
			ra.addFlashAttribute("icon", "success");
			ra.addFlashAttribute("title",  "임시 비밀번호 발송");
			ra.addFlashAttribute("text",  findMemberPw.getMemberName()+"님의 메일로 임시 비밀번호가 발송되었습니다.");
			
			path = "redirect:/"; 
			
		}else { // 실패
			
			ra.addFlashAttribute("icon", "error");
			ra.addFlashAttribute("title",  "일치하는 회원 정보가 없습니다.");
			path = "redirect:" + referer;
		}
		return path;
	}
	
	
	
	// 마이페이지 전환
	@RequestMapping(value="myPage", method=RequestMethod.GET)  
	public String myPage() { 
		return "member/myPage"; 
	}
	
	// 마이페이지 - 내정보 -------------------------------------------------------------------------------
	
	@RequestMapping(value="myInformation", method=RequestMethod.GET)
	public String myInformation() {
		return "member/information/myInformation";
	}
	
	// 회원 정보 수정 Controller
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateMember( @ModelAttribute("loginMember") Member loginMember,
								String inputEmail, String inputPhone, String inputAddress, String inputIntroduce,
								Member inputMember,  RedirectAttributes ra) {
		
		inputMember.setMemberNo(loginMember.getMemberNo());
		
		inputMember.setMemberEmail(inputEmail);
		inputMember.setMemberIntroduce(inputIntroduce);
		inputMember.setMemberPhone(inputPhone);
		inputMember.setMemberAddress(inputAddress);
		
		// 회원 정보 수정 Service
		int result = service.updateMember(inputMember);
		
		if( result > 0 ) { 
			swalSetMessage(ra, "success", "회원 정보 수정 성공", null);
			
			loginMember.setMemberEmail(inputEmail);
			loginMember.setMemberIntroduce(inputIntroduce);
			loginMember.setMemberPhone(inputPhone);
			loginMember.setMemberAddress(inputAddress);
			
		}else { 
			swalSetMessage(ra, "error", "회원 정보 수정 실패", null);
		}
		return "redirect:/member/myInformation";
	}
	
	// 비밀번호 수정 전환
	@RequestMapping(value="changPwd", method=RequestMethod.GET)
	public String changPwd() {
		return "member/information/changPwd";
	}
	
	// 비밀번호 수정
	@RequestMapping(value="changPwd", method=RequestMethod.POST)
	public String changPwd(@RequestParam("currentPwd") String currentPwd,
						   @RequestParam("newPwd1") String newPwd,
						   @ModelAttribute("loginMember") Member loginMember,
						   RedirectAttributes ra) {
		
		int result = service.changPwd(currentPwd, newPwd, loginMember);
		
		String path = "redirect:";
		
		if(result > 0) { // 비밀번호 변경 성공
			swalSetMessage(ra, "success", "비밀번호 변경이 완료되었습니다.", null);
			path += "myPage";
			
		}else { // 실패
			swalSetMessage(ra, "error", "기존 비밀번호가 일치 하지 않습니다.", null);
			path += "information/changPwd";
			
		}
		return path;
	}
	
	// 탈퇴 전환
	@RequestMapping(value="secession", method=RequestMethod.GET)
	public String secession() {
		return "member/information/secession";
	}
	
	// 탈퇴 
	@RequestMapping(value="secession", method=RequestMethod.POST)
	public String secession(@RequestParam("currentPwd") String currentPwd, 
							@ModelAttribute("loginMember") Member loginMember, 
							RedirectAttributes ra,  
							SessionStatus status) { 
		
		int result = service.secession(currentPwd, loginMember.getMemberNo());
		
		String path = "redirect:";
		
		if(result > 0) {
			path += "/"; 
			swalSetMessage(ra, "success", "회원 탈퇴 성공", "이용해 주셔서 감사합니다.");
			status.setComplete(); 
			
		}else {
			path += "information/secession"; 
			swalSetMessage(ra, "error", "회원 탈퇴 실패", "비밀번호가 일치하지 않습니다.");
		}
		return path;
	}
	
	// 마이페이지 -- 결제 ---------------------------------------------------------------------------------------------------
	
	// 탈퇴 전환
	@RequestMapping(value="pointSell", method=RequestMethod.GET)
	public String pointSell() {
		return "member/sell/pointSell";
	}
	
	// 이용 내역 전환
	@RequestMapping(value="usageHistory", method=RequestMethod.GET)
	public String usageHistory() {
		return "member/sell/usageHistory";
	}
	
	// 결제 내역전환
	@RequestMapping(value="sellHistory", method=RequestMethod.GET)
	public String sellHistory() {
		return "member/sell/sellHistory";
	}
	
	// SweetAlert를 이용한 메세지 전달용 메소드
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {

		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);
	}
}
