package edu.kh.job.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.job.board.model.service.BoardServiceImpl;
import edu.kh.job.chat.model.dao.ChatDAO;
import edu.kh.job.chat.model.vo.ChatAlarm;
import edu.kh.job.chat.model.vo.ChatMessage;
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
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int alarmInsert(ChatAlarm alarm) {
		return dao.alarmInsert(alarm);
	}

	// 알림 확인 안한 리스트 조회
	@Override
	public List<ChatAlarm> selectAlarm(int memberNo) {
		return dao.selectAlarm(memberNo);
	}

	// 해당 채팅방 참여 시 채팅 메세지 조회
	@Override
	public List<ChatMessage> joinChatRoom(int chatRoomNo) {
		return dao.joinChatRoom(chatRoomNo);
	}
	
	// 채팅 상대 이름 얻어오기
	@Override
	public String selectChatWith(ChatRoomJoin join) {
		// TODO Auto-generated method stub
		return dao.selectChatWith(join);
	}

	// 채팅 메세지 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertMessage(ChatMessage cm) {
		
		cm.setMessage(BoardServiceImpl.replaceParameter(cm.getMessage()));
		
		cm.setMessage(cm.getMessage().replace("\\n","<br>"));
		
		System.out.println("서비스에서 개행문자 처리 메세지 :" + cm.getMessage());

		return dao.insertMessage(cm);
	}

	// 알람 확인 상태로 변경
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateAlarmStatus(int chatRoomNo) {
		return dao.updateAlarmStatus(chatRoomNo);
	}
}
