package edu.kh.job.chat.websocket;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import edu.kh.job.chat.model.service.ChatService;
import edu.kh.job.chat.model.vo.ChatMessage;
import edu.kh.job.member.model.vo.Member;

public class ChatWebSocketHandler extends TextWebSocketHandler {
	@Autowired
	private ChatService service;
	
	private Set<WebSocketSession> sessions 
	= Collections.synchronizedSet(new HashSet<WebSocketSession>()); 
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessions.add(session);
		

	}
	
	// 클라이언트로 부터 텍스트를 받았을 때 실행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 매개변수 WebSocketSession session : "보내기" 버튼을 누른 사람의 SockJS가 넘어옴
		// 매개변수 TextMessage message : JSON으로 변환된 문자열이 담겨있다.
		
		// 전달 받은 내용 확인
		// System.out.println("전달 받은 내용 : " + message.getPayload());
		
		// JSON 형태의 문자열을 JsonObject로 변경하여 값을 꺼내쓸 수 있는 형태로 변환
		JsonObject convertedObj = new Gson().fromJson(message.getPayload(), JsonObject.class);
		System.out.println(convertedObj);
		// 변경된 JsonObject에서 값 추출
		// JsonObject.get("key") -> (Object)value 반환
		String memberName = convertedObj.get("memberName").toString();
		String chat = convertedObj.get("chat").toString();
		
		memberName = memberName.substring(1, memberName.length()-1);
		chat = chat.substring(1, chat.length()-1);
		

		//System.out.println("채팅 입력자 : " + memberName);
		//System.out.println("채팅 내용 : " + chat);
		
		// 채팅 내용 DB 삽입 구문
		
		// 메세지를 보낸 사람의 채팅방 번호
		int chatRoomNo = Integer.parseInt(convertedObj.get("chatRoomNo").toString().replaceAll("\"", ""));

		// 회원 번호를 얻어오는 방법
		// 1) WebSocketSession -> Session -> loginMember -> memberNo
		// 2) convertedObj에 있는 memberNo 사용
		int memberNo = Integer.parseInt(convertedObj.get("memberNo").toString().replaceAll("\"", ""));
		
		// CHAT_MESSAGE 테이블에 삽입하려는 내용을 하나의 VO에 담기
		ChatMessage cm = new ChatMessage();
		cm.setMemberNo(memberNo);
		cm.setChatRoomNo(chatRoomNo);
		cm.setMessage(chat);
		
		// 채팅 메세지를 DB에 삽입하는 Service 호출
		int result = service.insertMessage(cm);
		
		convertedObj.remove("chat");
		System.out.println("cm.getMessage() : "+ cm.getMessage());
		convertedObj.addProperty("chat", cm.getMessage());
		
		if(result > 0) {
			// 채팅이 이루어진 시간을 만들어서 convertedObj에 추가
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			convertedObj.addProperty("createDate", sdf.format(new Date()));
			
			// 필드에 있는 sessions에는 현재 채팅방에 들어온 모든 회원의 Session이 담겨있다.
			// -> 여기서 채팅방 번호가 일치하는 회원한테만 메세지를 전달
			for(WebSocketSession s : sessions) {
				
				// 각 회원이 가지고 있는 session 값 중 "chatRoomNo"를 얻어오기
				int joinChatRoomNo = ((Integer)s.getAttributes().get("chatRoomNo"));
				
				// 채팅방 페이지에 접속한 회원의 방번호와
				// 메세지를 보낸사람의 방번호가 같을 경우 == 같은 채팅방
				if(chatRoomNo == joinChatRoomNo) {
					
					// 서버 -> 클라이언트로 웹 소켓을 이용해 메세지 전달
					s.sendMessage( new TextMessage( new Gson().toJson(convertedObj) ));
				}
			}
		}
	}

	// 클라이언트 - 서버간 연결이 종료될 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
	
	}
}
