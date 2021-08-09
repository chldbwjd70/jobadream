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
.notice-line-view {
	color: #3eafe6;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 40px;
}

#notice-top-view {
	background-color: #f7f5f8;
	font-weight: bold;
	text-align: left;
	padding-top: 13px;
	height: 60px;
}

#notice-top-con {
	text-align: left;
	padding-top: 13px;
	height: 60px;
}

#notice-view-content {
	height: 400px;
}

#notice-deleteBtn {
	background-color: #4161c8;
}

#notice-updateBtn {
	background-color: #4161c8;
}

#notice-listBtn {
	background-color: #4161c8;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<h2 class="notice-line-view">공지사항</h2>
		<div class="list-detaiil shadow p-3 mb-5 bg-white rounded p-5">
			<!-- 글 상단 정보 -->
			<div class="row">
				<div class="col-md-2" id="notice-top-view">제목</div>
				<div class="col-md-10" id="notice-top-con">${notice.noticeTitle }</div>
			</div>
			<div class="row">
				<div class="col-md-2" id="notice-top-view">작성자</div>
				<div class="col-md-10" id="notice-top-con">${notice.mem.memberId }</div>
			</div>
			<div class="row">
				<div class="col-md-2" id="notice-top-view">작성일</div>
				<div class="col-md-10" id="notice-top-con">
					<fmt:formatDate value="${notice.createDt }" pattern="yyyy년 MM월 dd일" />
				</div>
			</div>
			<hr>
			<br> <br>
			<!-- 글 내용 -->
			<div class="row">
				<div class="col-md-12" id="notice-view-content">${notice.noticeContent }</div>
			</div>
			<hr>
			<br> <br>
			<div class="row">
				<div class="col-md-12 mt-4 mb-4">

					<%-- 글 작성자일 경우에만--%>
					<c:if test="${loginMember.memberNo == notice.memberNo }">
						<button id="notice-deleteBtn"
							class="btn btn-primary float-right mr-2 noticeDelete" 
							>삭제</button>
						<button id="notice-updateBtn"
							class="btn btn-primary float-right mr-2 noticeUpdate"
							onclick="fnRequest('updateForm');">수정</button>
					</c:if>
					<%-- 검색 상태 유지를 위한 쿼리스트링용 변수 선언 --%>
					<c:if test="${!empty param.sk && !empty param.sv }">

						<c:set var="searchStr" value="&sk=${param.sk}&sv=${param.sv}" />
					</c:if>
					<a href="noticeList?&cp=${param.cp}${searchStr}"
						id="notice-listBtn"
						class="btn btn-primary float-left mr-2 noticelist">목록으로</a>
				</div>

			</div>
		</div>

	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<form action="#" method="POST" name="requestForm">
		<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
		<input type="hidden" name="cp" value="${param.cp}">
	</form>


	
</body>
<script>
		function fnRequest(addr) {

			document.requestForm.action = addr;

			document.requestForm.submit();
		}
		
	
	</script>

</html>