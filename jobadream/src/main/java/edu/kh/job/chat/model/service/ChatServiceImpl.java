package edu.kh.job.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.job.chat.model.dao.ChatDAO;
import edu.kh.job.chat.model.vo.ChatAlarm;
import edu.kh.job.chat.model.vo.ChatRoom;
import edu.kh.job.chat.model.vo.ChatRoomJoin;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired ChatDAO dao;

	// 채팅방 목록 조회
	@Override
	public List<ChatRoom> chardRoomList(int memberNo) {
		return dao.chatRoomList(memberNo);
	}

	// 채팅방 개설
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int openChatRoom(ChatRoom room) {
		return dao.openChatRoom(room);
	}

	// 채팅방 참여자로 추가
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int chatJoin(ChatRoomJoin join, int memberNo) {
		 int result = dao.chatJoin(join);
		 
		 if(result > 0) {
			 
			 join.setMemberNo(memberNo);
			 result = dao.chatJoin(join);
	
		 }else {
			 result = 0;
		 }
		 return result;
	}

	// 채팅방 개설 알림 테이블 삽입
	@Override
	public int alarmInsert(ChatAlarm alarm) {
		return dao.alarmInsert(alarm);
	}

	// 알림 확인 안한 리스트 조회
	@Override
	public List<ChatAlarm> selectAlarm() {
		return dao.selectAlarm();
	}
}
