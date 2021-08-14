package edu.kh.job.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.job.chat.model.service.ChatService;
import edu.kh.job.chat.model.vo.ChatAlarm;
import edu.kh.job.chat.model.vo.ChatMessage;
import edu.kh.job.chat.model.vo.ChatRoom;
import edu.kh.job.chat.model.vo.ChatRoomJoin;
import edu.kh.job.member.controller.MemberController;
import edu.kh.job.member.model.vo.Member;

@Controller
@SessionAttributes( {"loginMember", "chatRoomNo", "alarmList"} )
public class ChatController {
	
	@Autowired ChatService service;
	
	// 채팅방 목록 전환 Controller
	@RequestMapping(value="/chat/roomList", method= RequestMethod.GET)
	public String chardRoomList(Model model,
				@ModelAttribute("loginMember") Member loginMember) {
		
		List<ChatRoom> roomList = service.chardRoomList(loginMember.getMemberNo());
		
		//System.out.println(roomList);
		model.addAttribute("roomList",roomList);
		return "chat/chatRoomList";
		
	}
	
	
	// 해당 채팅방 참여 시 채팅 메세지 조회
	@RequestMapping("/chat/room/{chatRoomNo}")
	public String joinChatRoom(@PathVariable("chatRoomNo") int chatRoomNo,
							@ModelAttribute("loginMember") Member loginMember,
							ChatRoomJoin join,
								Model model) {
		
		List<ChatMessage> mList = service.joinChatRoom(chatRoomNo);
		
		
		// 채팅 상대 이름 조회
		join.setChatRoomNo(chatRoomNo);
		join.setMemberNo(loginMember.getMemberNo());
		String chatWithName = service.selectChatWith(join);
		
		model.addAttribute("chatRoomNo", chatRoomNo);
		
		//System.out.println(mList);
		model.addAttribute("chatWithName", chatWithName);
		model.addAttribute("mList", mList);
		
		
		return "chat/chatRoom";
	}
	
}
