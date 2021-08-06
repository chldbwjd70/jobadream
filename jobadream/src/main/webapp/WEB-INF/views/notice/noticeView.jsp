<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
.notice-line {
	color: #3eafe6;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 40px;
}

#notice-top {
	background-color: #f7f5f8;
	font-weight: bold;
	text-align: left;
	padding-top: 13px;
	height: 60px;
}

#notice-top-co {
	text-align: left;
	padding-top: 13px;
	height: 60px;
}

#notice-list-content {
	height: 400px;
}

#updateBtn {
	background-color: #4161c8;
}
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<h2 class="notice-line">공지사항</h2>
		<div class="list-detaiil shadow p-3 mb-5 bg-white rounded p-5">
			<form>
				<!-- 글 상단 정보 -->
				<div class="row">
					<div class="col-md-2" id="notice-top">제목</div>
					<div class="col-md-10" id="notice-top-co">${notice.noticeTitle }</div>
				</div>
				<div class="row">
					<div class="col-md-2" id="notice-top">작성자</div>
					<div class="col-md-10" id="notice-top-co">${notice.mem.memberId }</div>
				</div>
				<div class="row">
					<div class="col-md-2" id="notice-top">작성일</div>
					<div class="col-md-10" id="notice-top-co">
						<fmt:formatDate value="${notice.createDt }"
							pattern="yyyy년 MM월 dd일 HH:mm:ss" />
					</div>
				</div>
				<hr>
				<br> <br>
				<!-- 글 내용 -->
				<div class="row">
					<div class="col-md-12" id="notice-list-content">
						${notice.noticeContent }</div>
				</div>
				<br>
				<hr>
				<div class="row">
					<div class="col-md-12 mt-4 mb-4">

						<a href="#" class="btn btn-primary  mr-2">목록으로</a>

						<%-- 글 작성자일 경우에만--%>
						<c:if test="${loginMember.memberNo == notice.memberNo }">
							<button class="btn btn-primary float-right mr-4" id="updateBtn" onclick="fnRequest('updateForm');">수정</button>
							<button class="btn btn-primary float-right mr-4" id="deleteBtn" onclick="deleteRequest();">삭제</button>
						</c:if>
						<%-- 검색 상태 유지를 위한 쿼리스트링용 변수 선언 --%>
						<c:if test="${!empty param.sk && !empty param.sv }">

							<c:set var="searchStr" value="&sk=${param.sk}&sv=${param.sv}" />
						</c:if>
					</div>
				</div>
			</form>
		</div>
		<form action="#" method="post" name="requestForm">
			<input type="hidden" value="${notice}" name="notice" >
			<input type="hidden" value="${param.cp}" name="cp" >
		</form>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
<script>
	function fnRequest(addr){
			document.requestForm.action = addr;
			document.requestForm.submit();
		}
		
		
</script>


	



</body>
</html>