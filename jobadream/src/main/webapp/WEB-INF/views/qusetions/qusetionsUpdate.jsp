<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<style>
.request-line {
	color: #3eafe6;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 40px;
}

#request-top {
	background-color: #f7f5f8;
	font-weight: bold;
	text-align: left;
	padding-top: 13px;
	height: 60px;
}

#request-top-co {
	text-align: left;
	padding-top: 13px;
	height: 60px;
}

#request-list-content {
	height: 400px;
}

.reply-Date {
	display: inline-block;
	font-size: 10px;
}

.reply-Content {
	height: 100%;
	width: 100%;
}

.reply-row {
	list-style: none;
}

.btn {
	background-color: #4161c8;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<h2 class="request-line">1:1 문의</h2>
		<div class="list-detaiil shadow p-3 mb-5 bg-white rounded p-5">
			<form>
				<!-- 글 상단 정보 -->
				<div class="row">
					<div class="col-md-2" id="request-top">제목</div>
					<div class="col-md-10" id="request-top-co">${qusetions.qusetionsTitle }</div>
				</div>
				<div class="row">
					<div class="col-md-2" id="request-top">작성자</div>
					<div class="col-md-10" id="request-top-co">${qusetions.mem.memberId }</div>
				</div>
				<div class="row">
					<div class="col-md-2" id="request-top">작성일</div>
					<div class="col-md-10" id="request-top-co">
						<fmt:formatDate value="${qusetions.qusetionsDt }"
							pattern="yyyy년 MM월 dd일" />
					</div>
				</div>
				<hr>
				<br> <br>
				<!-- 글 내용 -->
				<div class="row">
					<div class="col-md-12" id="request-list-content">
						${qusetions.qusetionsContent }</div>
				</div>
				<hr>
				<br> <br>
				<div class="row">
					<div class="col-md-12 mt-4 mb-4">

						<a href="#" class="btn btn-primary  mr-2">목록으로</a>

						<%-- 글 작성자일 경우에만--%>
						<c:if test="${loginMember.memberNo == qusetions.memberNo }">
							<button type="button" class="btn btn-primary float-right mr-4"
								id="btn-r">수정</button>
							<button type="button" class="btn btn-primary float-right mr-4"
								id="btn-r">삭제</button>
						</c:if>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>