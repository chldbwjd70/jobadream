package edu.kh.job.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import edu.kh.job.chat.model.service.ChatService;
import edu.kh.job.chat.model.vo.ChatAlarm;
import edu.kh.job.chat.model.vo.ChatRoom;
import edu.kh.job.chat.model.vo.ChatRoomJoin;
import edu.kh.job.member.controller.MemberController;
import edu.kh.job.member.model.vo.Member;

@RestController
@SessionAttributes( {"alarmList", "loginMember"} )
public class ChatAlarmController {
	
	@Autowired 
	private ChatService service;
	
	@RequestMapping(value="/chat/alarmOk", method=RequestMethod.GET)
	public int updateAlarmStatus(@RequestParam("chatRoomNo") int chatRoomNo,
						@ModelAttribute("alarmList") List<ChatAlarm> alarmList) {
		
		int result =service.updateAlarmStatus(chatRoomNo);
		//System.out.println(alarmList);
	
		if(result > 0) {
			for(int i=0; i<alarmList.size();i++) {
				if(alarmList.get(i).getChatRoomNo() == chatRoomNo) {
					alarmList.remove(i);
				
				}
			}
			
		}
		return result;
				
	}
	
	// 채팅방 개설 + 게시글 등록자 참여자로 추가 + 알림테이블 리스트 (추가+조회) 
	@RequestMapping(value="/chat/openChatRoom", method= RequestMethod.POST)
	public int openChatRoom(ChatRoom room,
						@ModelAttribute("loginMember") Member loginMember,
						@RequestParam("boardMemberNo") int boardMemberNo,
						RedirectAttributes ra) {
		
		// 1. 채팅방 개설
		
		room.setMemberNo(loginMember.getMemberNo());
		System.out.println(room);
		int chatRoomNo = service.openChatRoom(room);
		
		
		
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
				alarm.setChatRoomNo(chatRoomNo);
				
				result = service.alarmInsert(alarm);
				
				if(result > 0) { // 알림 테이블 삽입 성공
					
					// 알림 테이블에 STATUS='N'인것만 SESSION에 올리기
					//List<ChatAlarm> alarmList = service.selectAlarm();
					
					//System.out.println(alarmList);
					System.out.println(chatRoomNo);
					
					//model.addAttribute("alarmList", alarmList);
					
						return chatRoomNo;
				}else { // 알림 테이블 삽입 실패
					MemberController.swalSetMessage(ra, "error", "채팅방 개설 실패", "알림테이블 삽입 실패");
					return 0;
				}
				
			}else { // 참여자로 추가 실패
				MemberController.swalSetMessage(ra, "error", "채팅방 개설 실패", "참여자로 추가 실패");
				return 0;
			}
		}else { // 채팅방 개설 실패
			MemberController.swalSetMessage(ra, "error", "채팅방 개설 실패", "채팅방 개설 실패");
			return 0;
		}
		
		
	}
	@RequestMapping(value="/chat/selectAlarmList", method=RequestMethod.POST)
	public String selectAlarmList(@RequestParam("memberNo") int memberNo,
								@ModelAttribute("alarmList") List<ChatAlarm> alarmList,
									Model model) {
		
		List<ChatAlarm> newAlarmList = service.selectAlarm(memberNo);
		
		System.out.println(newAlarmList);
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(newAlarmList);
	}
	

}
