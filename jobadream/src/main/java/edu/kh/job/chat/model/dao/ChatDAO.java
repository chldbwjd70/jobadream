package edu.kh.job.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.job.chat.model.vo.ChatAlarm;
import edu.kh.job.chat.model.vo.ChatMessage;
import edu.kh.job.chat.model.vo.ChatRoom;
import edu.kh.job.chat.model.vo.ChatRoomJoin;

@Repository
public class ChatDAO {
	
	@Autowired SqlSession sqlSession;

	/** 채팅방 목록 조회 
	 * @return roomList
	 */
	public List<ChatRoom> chatRoomList(int memberNo) {
		return sqlSession.selectList("chatMapper.chatRoomList", memberNo);
	}

	public int openChatRoom(ChatRoom room) {
		 int result = sqlSession.insert("chatMapper.openChatRoom", room);
		
		 if(result > 0) {
			 return room.getChatRoomNo();
		 }else {
			 return 0;
		 }
	}

	/** 개설된 채팅방에 게시글 등록자 참여자로 추가
	 * @param join
	 * @return result
	 */
	public int chatJoin(ChatRoomJoin join) {
		return sqlSession.insert("chatMapper.chatJoin",join);
	}

	/** 채팅방 개설 알림 테이블 삽입
	 * @param alarm
	 * @return result
	 */
	public int alarmInsert(ChatAlarm alarm) {
		return sqlSession.insert("chatMapper.alarmInsert",alarm);
	}

	/** 알림 확인 안한 리스트 조회
	 * @return alarmList
	 */
	public List<ChatAlarm> selectAlarm() {
		return sqlSession.selectList("chatMapper.selectAlarm");
	}

	/** 해당 채팅방 참여 시 채팅 메세지 조회
	 * @param chatRoomNo
	 * @return
	 */
	public List<ChatMessage> joinChatRoom(int chatRoomNo) {
		return sqlSession.selectList("chatMapper.joinChatRoom", chatRoomNo);
	}

	/** 채팅 상대 조회
	 * @param join
	 * @return
	 */
	public String selectChatWith(ChatRoomJoin join) {
		return sqlSession.selectOne("chatMapper.selectChatWith",join);
	}

	/** 채팅 메세지 삽입
	 * @param cm
	 * @return
	 */
	public int insertMessage(ChatMessage cm) {
		return sqlSession.insert("chatMapper.insertMessage", cm);
	}

	/** 알림 확인 상태로 변경
	 * @param chatRoomNo
	 * @return
	 */
	public int updateAlarmStatus(int chatRoomNo) {
		return sqlSession.update("chatMapper.updateAlarmStatus",chatRoomNo);
	}

}
