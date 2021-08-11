<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방 목록</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<link rel="stylesheet" href="${contextPath}/resources/css/chat/chatRoomList.css" type="text/css"/>
    <div class="container">
        <div class="content">
            <div class="page-title">
                <p>채팅 목록</p>
            </div>
            <div class="chat-list">
            	<c:choose>
            		<c:when test="${empty roomList}">
            			<div class="chat">존재하는 채팅방이 없습니다.</div>
            		</c:when>
            	
            		<c:otherwise>
            			<c:forEach var="chatRoom" items="${roomList}">
							<div class="chat">
								<input type="hidden" id="chat-no" name="chat-no">
								<div class="join-person">
									<p>${chatRoom.memberName}</p>
								</div>
								<div class="chat-title">
									<p>${chatRoom.boardTitle}</p>
								</div>
								<div class="join-box">
									<button class="btn join">참여</button>
								</div>
							</div>

						</c:forEach>
            		</c:otherwise>
            	</c:choose>

            </div>
        </div>
    </div>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>