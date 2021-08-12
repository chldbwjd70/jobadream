<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<link rel="stylesheet" href="${contextPath}/resources/css/chat/chatRoom.css" type="text/css"/>
    <div class="container">
        <div class="chatting-area">
      
            <div class="chat-name">
                <p id="ch-title">${chatWithName}님과 대화</p>
            </div>
            <ul class="display-chatting">
	        	<c:forEach items="${mList}" var="msg">
	     		    <fmt:formatDate var="chatDate" value="${msg.createDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>
		            	<c:if test="${msg.memberNo == loginMember.memberNo}">
			                <li class="myChat">
			                    <span class="chatDate">${chatDate}</span>
			                    <p class="chat">${msg.message}</p>
			                </li>
		                </c:if>
		                
		                <c:if test="${msg.memberNo != loginMember.memberNo}">
		                <li>
		                    <b>${msg.memberName}</b>	<br>
		                    <p class="chat">${msg.message}</p>
		                    <span class="chatDate">${chatDate}</span>
		                </li>
		                </c:if>
	        	</c:forEach>
            </ul>
        		

            <div class="input-area">
                <textarea id="inputChatting" rows="3"></textarea>
                <button id="send">보내기</button>
            </div>
        </div>
        <div class="button-box">
            <a class="btn" id="prev" href="${contextPath}/chat/roomList">목록으로</a>
        </div>   
    </div> 
	<jsp:include page="../common/footer.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script>
		let chattingSock = new SockJS("<c:url value='/chat' />");
		
		const memberNo = "${loginMember.memberNo}"; // 회원 번호
		const memberId = "${loginMember.memberId}"; // 회원 아이디
		const memberName = "${loginMember.memberName}"; // 회원 이름
		const chatRoomNo = "${chatRoomNo}"; // 채팅방 번호
		
		$("#send").on("click", function(){
			const chat = $("#inputChatting").val(); 
			
			if(chat.trim().length == 0){
				alert("채팅을 입력해주세요.");
			}else{
				
				var obj = { "memberNo" : memberNo,  
										"memberId" : memberId,
										"memberName" : memberName,
										"chat" : chat,
										"chatRoomNo" : chatRoomNo};
				
				
				chattingSock.send(JSON.stringify(obj));
				
				$("#inputChatting").val("");
			}
			
		});
		
		chattingSock.onmessage = function(event){
			// 메소드를 통해 전달받은 객체값을 JSON객체로 변환해서 obj 변수에 저장.
			const obj = JSON.parse(event.data);
			console.log(obj);
			
			
			const li = $("<li>");
			const p = $("<p class='chat'>");
			const span = $("<span class='chatDate'>");
			span.html(obj.createDate);
			
			const chat = obj.chat.replace(/\n/g, "<br>");	
			p.html(chat);
			
			
			if(obj.memberNo == memberNo){
				li.addClass("myChat");
				li.append(span);								
				li.append(p);
			}else{
				li.html("<b>" + obj.memberName + "</b><br>");
				li.append(p);
				li.append(span);								
			}
			
			$(".display-chatting").append(li);
			
			// 채팅 입력 시 스크롤을 가장 아래로 내리기
			$(".display-chatting").scrollTop($(".display-chatting")[0].scrollHeight);

		}	
	</script>
</body>
</html>