package edu.kh.job.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.job.chat.model.service.ChatService;
import edu.kh.job.chat.model.vo.ChatAlarm;
import edu.kh.job.member.model.vo.Member;

@RestController
@SessionAttributes( {"alarmList"} )
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
//		
		return result;
				
	}

}
