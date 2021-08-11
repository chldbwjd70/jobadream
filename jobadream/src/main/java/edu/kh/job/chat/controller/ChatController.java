package edu.kh.job.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.job.chat.model.service.ChatService;
import edu.kh.job.chat.model.vo.ChatAlarm;
import edu.kh.job.chat.model.vo.ChatRoom;
import edu.kh.job.chat.model.vo.ChatRoomJoin;
import edu.kh.job.member.controller.MemberController;
import edu.kh.job.member.model.vo.Member;

@Controller
@RequestMapping("/chat/*")
@SessionAttributes( {"loginMember", "chatRoomNo", "alarmList"} )
public class ChatController {
	
	@Autowired ChatService service;
	
	// 채팅방 목록 전환 Controller
	@RequestMapping(value="roomList", method= RequestMethod.GET)
	public String chardRoomList(Model model,
				@ModelAttribute("loginMember") Member loginMember) {
		
		List<ChatRoom> roomList = service.chardRoomList(loginMember.getMemberNo());
		
		System.out.println(roomList);
		model.addAttribute("roomList",roomList);
		return "chat/chatRoomList";
		
	}
	
	// 채팅방 개설 + 게시글 등록자 참여자로 추가 + 알림테이블 리스트 (추가+조회)
	@RequestMapping(value="openChatRoom", method= RequestMethod.POST)
	public String openChatRoom(ChatRoom room,
						@ModelAttribute("loginMember") Member loginMember,
						@RequestParam("boardMemberNo") int boardMemberNo,
						RedirectAttributes ra,
						Model model) {
		
		// 1. 채팅방 개설
		room.setMemberNo(loginMember.getMemberNo());
		int chatRoomNo = service.openChatRoom(room);
		
		String path = "redirect:/chat/";
		
		if(chatRoomNo > 0) { // 채팅방 개설 성공
			
			// 2. 게시글 등록한 사람을 방금 만든 채팅에 참여자로 추가
			ChatRoomJoin join = new ChatRoomJoin();
			join.setChatRoomNo(chatRoomNo);
			join.setMemberNo(boardMemberNo);
			
			
			int result = service.chatJoin(join, loginMember.getMemberNo());
			
			if(result > 0) { // 참여자로 추가 성공
				
				// 3. 채팅방 개설 알림 테이블에 삽입
				ChatAlarm alarm = new ChatAlarm();
				String message = loginMember.getMemberName() + "님이 " + room.getBoardTitle() + "지원 관련 채팅방을 개설하였습니다.";
				alarm.setAlarmMessage(message);
				alarm.setMemberNo(boardMemberNo);
				
				result = service.alarmInsert(alarm);
				
				if(result > 0) { // 알림 테이블 삽입 성공
					
					// 알림 테이블에 STATUS='N'인것만 SESSION에 올리기
					List<ChatAlarm> alarmList = service.selectAlarm();
					model.addAttribute("alarmList",alarmList);
					model.addAttribute("chatRoomNo", chatRoomNo);
					path += "room/" + chatRoomNo;
					
				}else { // 알림 테이블 삽입 실패
					path += "roomList";
					MemberController.swalSetMessage(ra, "error", "채팅방 개설 실패", "알림테이블 삽입 실패");
				}
				
			}else { // 참여자로 추가 실패
				path += "roomList";
				MemberController.swalSetMessage(ra, "error", "채팅방 개설 실패", "참여자로 추가 실패");
				
			}
		}else { // 채팅방 개설 실패
			path += "roomList";
			MemberController.swalSetMessage(ra, "error", "채팅방 개설 실패", "채팅방 개설 실패");
		}
		
		return path;
	}
	
	// 채팅방 참여 + 채팅 메세지 조회
	@RequestMapping("room/{chatRoomNo}")
	public String joinChatRoom() {
		
		
		return "chat/chatRoom";
	}
	
}
