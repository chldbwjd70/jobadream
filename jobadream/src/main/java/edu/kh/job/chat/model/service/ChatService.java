package edu.kh.job.chat.model.service;

import java.util.List;

import edu.kh.job.chat.model.vo.ChatAlarm;
import edu.kh.job.chat.model.vo.ChatMessage;
import edu.kh.job.chat.model.vo.ChatRoom;
import edu.kh.job.chat.model.vo.ChatRoomJoin;

public interface ChatService {

	/** 채팅방 목록 조회
	 * @param i 
	 * @return
	 */
	List<ChatRoom> chardRoomList(int i);

	/** 채팅방 개설
	 * @param room
	 * @return chatRoomNo
	 */
	int openChatRoom(ChatRoom room);

	/** 개설된 채팅방에 게시글 등록자 참여자로 삽입
	 * @param join
	 * @param i 
	 * @return  result
	 */
	int chatJoin(ChatRoomJoin join, int i);

	/** 채팅방 개설 알림 테이블 삽입
	 * @param alarm
	 * @return result
	 */
	int alarmInsert(ChatAlarm alarm);

	/** 알림 확인 안한 리스트 조회
	 * @return
	 */
	List<ChatAlarm> selectAlarm();

	/** 해당 채팅방 참여 시 채팅 메세지 조회
	 * @param chatRoomNo
	 * @return mList
	 */
	List<ChatMessage> joinChatRoom(int chatRoomNo);

	/** 채팅 상대 이름 조회
	 * @param join
	 * @return memberName
	 */
	String selectChatWith(ChatRoomJoin join);

	/** 채팅 메세지 삽입
	 * @param cm
	 * @return
	 */
	int insertMessage(ChatMessage cm);

}
