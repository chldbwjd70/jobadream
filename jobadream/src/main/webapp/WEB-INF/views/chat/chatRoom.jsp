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
                <p id="ch-title">최유정님과 대화</p>
            </div>
            <ul class="display-chatting">
                <li class="myChat">
                    <span class="chatDate">${chatDate}</span>
                    <p class="chat">${msg.message }</p>
                </li>
                <li>
                    <b>${msg.memberName }</b>	<br>
                    <p class="chat">${msg.message }</p>
                    <span class="chatDate">${chatDate}</span>
                </li>
            </ul>	
            <div class="input-area">
                <textarea id="inputChatting" rows="3"></textarea>
                <button id="send">보내기</button>
            </div>
        </div>
        <div class="button-box">
            <a class="btn" id="prev">목록으로</a>
        </div>   
    </div> 
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>