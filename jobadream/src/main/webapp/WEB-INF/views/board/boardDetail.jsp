<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<link rel="stylesheet" href="${contextPath}/resources/css/board/boardDetail.css" type="text/css"/>
    <div class="container">
        <div class="workCategory">
            ${board.categoryTitle}
        </div>
        <div class="workForm">
            <div class="workForm-1">
                <div id="title">${board.boardTitle}</div>
                <div id="writer">작성자 : ${board.memberName}</div>
                <div id="writergood">작성자 평점 : </div>
            </div>
            <div class="workForm-2">
                <div class="form-control" id="requestContent">${board.boardContent}</div>
            </div>
            <div class="workForm-3">
                <label for="writer-introduce">작성자 소개</label>
                <div class="form-control" id="writer-introduce">${board.memberIntroduce}</div>
            </div>
            <div class="workForm-4">
                <div class="row" id="lead-time-box">
                    <label class="col-md-3" for="lead-time">예상시간</label>
                    <span class="col-md-4"  id="lead-time">${board.boardTime}</span>
                </div>
                <div class="row" id="place-box">
                    <label class="col-md-3" for="place">장소</label>
                    <span class="col-md-4" id="place">${board.boardPlace}</span>
                </div>
                <div class="row" id="pay-box">
                    <label class="col-md-3" for="pay">페이</label>
                    <span class="col-md-4" id="pay">${board.boardPay}</span>
                </div>
            </div>
            <c:if test="${loginMember.memberNo != board.memberNo}">
            <div class="workForm-5">
                <a class="btn" id="chat">채팅하기</a>
                <a class="btn" id="support" href="progress/${board.boardNo}">지원하기</a>
            	<a href="list?cpage=${param.cpage}${searchStr}" class="btn" id="prv">이전으로</a>
            </div>
            </c:if>
            <c:if test="${loginMember.memberNo == board.memberNo}">
	           <div class="workForm-5">
	                <a class="btn" id="update" href="updateForm/${board.boardNo}">수정하기</a>
	                <a class="btn" id="delete" href="${contextPath}/board/${board.categoryCode}/deleteFaq/${board.boardNo}" >삭제하기</a>
	             	<a href="${contextPath}/board/${board.categoryCode}/list?cpage=${param.cpage}${searchStr}" class="btn" id="prv">이전으로</a>
	            </div>
            </c:if>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>