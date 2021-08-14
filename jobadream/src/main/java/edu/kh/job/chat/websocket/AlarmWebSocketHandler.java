package edu.kh.job.chat.websocket;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import edu.kh.job.chat.model.service.ChatService;
import edu.kh.job.chat.model.vo.ChatAlarm;
import edu.kh.job.chat.model.vo.ChatMessage;
import edu.kh.job.member.model.vo.Member;

public class AlarmWebSocketHandler extends TextWebSocketHandler{
	@Autowired
	private ChatService service;
	
	private Set<WebSocketSession> sessions 
	= Collections.synchronizedSet(new HashSet<WebSocketSession>()); 
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessions.add(session);
		System.out.println(session.getId() + "연결됨");
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		System.out.println("message" + message.getPayload());
		
		JsonObject convertedObj = new Gson().fromJson(message.getPayload(), JsonObject.class);
		
		int memberNo = Integer.parseInt(convertedObj.get("memberNo").toString().replaceAll("\"", ""));
		
			
		// 필드에 있는 sessions에는 현재 채팅방에 들어온 모든 회원의 Session이 담겨있다.
		// -> 여기서 채팅방 번호가 일치하는 회원한테만 메세지를 전달
		for(WebSocketSession s : sessions) {
			
			// 각 회원이 가지고 있는 session 값 중 "chatRoomNo"를 얻어오기
			int sessionMemberNo = ( (Member)s.getAttributes().get("loginMember") ).getMemberNo();
			
			System.out.println("세션: " +sessionMemberNo);
			System.out.println("그냥" + memberNo);
			System.out.println("==========================");
			
			// 채팅방 페이지에 접속한 회원의 방번호와
			// 메세지를 보낸사람의 방번호가 같을 경우 == 같은 채팅방
			if(memberNo == sessionMemberNo) {
				// 서버 -> 클라이언트로 웹 소켓을 이용해 메세지 전달
				s.sendMessage( new TextMessage( new Gson().toJson(convertedObj) ));
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
	
	}

}
