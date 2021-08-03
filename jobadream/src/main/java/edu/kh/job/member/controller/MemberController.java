package edu.kh.job.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	// 로그인 
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Member inputMember, Model model,
						HttpServletRequest request, HttpServletResponse response,
						RedirectAttributes ra, @RequestParam(value="save", required=false) String save) {
		
		Member loginMember =  service.login(inputMember);
		
		if(loginMember != null) { 
			
			model.addAttribute("loginMember", loginMember); 

			Cookie cookie = new Cookie("saveId", loginMember.getMemberId());
			
			if(save != null) { 
				cookie.setMaxAge(60 * 60 * 24 * 30); 
			}else {  
				cookie.setMaxAge(0);
			}
			cookie.setPath( request.getContextPath() ); 
			response.addCookie(cookie);
		
		}else { 
			ra.addFlashAttribute("icon", "error");
			ra.addFlashAttribute("title", "로그인 실패");
			ra.addFlashAttribute("text", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
		}
		return "redirect:/";
	}
	
	// 로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(SessionStatus status, @RequestHeader("referer") String referer,
						RedirectAttributes ra) {
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
	
	// 회원 가입 Controller
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
	@RequestMapping(value="findIdPw", method=RequestMethod.GET)  
	public String findIdPw() { 
		return "member/findIdPw"; 
	}
	
	// 아이디 찾기 
	@RequestMapping(value="findIdPw", method=RequestMethod.POST)  
	public String findId(Member member, RedirectAttributes ra) {
		
		return  "redirect:/"; 
	}
	
	
	// 마이페이지 전환
	@RequestMapping(value="myPage", method=RequestMethod.GET)  
	public String myPage() { 
		return "member/myPage"; 
	}
	
	// 회원 정보 수정 전환
	@RequestMapping(value="myInformation", method=RequestMethod.GET)
	public String myInformation() {
		return "member/myInformation";
	}
	
	// 회원 정보 수정 Controller
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateMember( @ModelAttribute("loginMember") Member loginMember,
								String inputEmail, String inputPhone, String inputAddress,
								Member inputMember, RedirectAttributes ra) {
		
		inputMember.setMemberNo(loginMember.getMemberNo());
		inputMember.setMemberEmail(inputEmail);
		inputMember.setMemberPhone(inputPhone);
		inputMember.setMemberAddress(inputAddress);
		
		// 회원 정보 수정 Service
		int result = service.updateMember(inputMember);
		
		if( result > 0 ) { 
			swalSetMessage(ra, "success", "회원 정보 수정 성공", null);
			
			loginMember.setMemberEmail(inputEmail);
			loginMember.setMemberPhone(inputPhone);
			loginMember.setMemberAddress(inputAddress);
			
		}else { 
			swalSetMessage(ra, "error", "회원 정보 수정 실패", null);
		}
		return "redirect:/member/myInformation";
	}
	
	// 내소개 전환
	@RequestMapping(value="myIntroduce", method=RequestMethod.GET)
	public String myIntroduce() {
		return "member/myIntroduce";
	}
	// SweetAlert를 이용한 메세지 전달용 메소드
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {

		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);
	}
}
