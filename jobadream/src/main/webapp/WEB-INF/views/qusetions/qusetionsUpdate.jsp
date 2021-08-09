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
		<form action="update" method="post" role="form" onsubmit="return boardValidate();">
		<div class="list-detaiil shadow p-3 mb-5 bg-white rounded p-5">
				<!-- 글 상단 정보 -->
				<div class="row">
					<div class="col-md-2" id="request-top">제목</div>
					<div class="col-md-10" id="request-top-co">
					<input type="text" class="form-control" id="qusetionsTitle" name="qusetionsTitle" size="70" value="${qusetions.qusetionsTitle }">
					</div>
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
					<textarea class="form-control" id="qusetionsContent" name="qusetionsContent" rows="15" style="resize: none;">${qusetions.qusetionsContent }</textarea>
				</div>
				</div>
				<hr>
				<br> <br>
				<div class="row">
					<div class="col-md-12 mt-4 mb-4">
						<button type="submit" class="btn btn-primary">수정</button>
						<a class="btn btn-primary" href="qusetionsList?cp=${param.cp}">목록으로</a>
					</div>
					<input type="hidden" name="cp" value="${param.cp}">
					<input type="hidden" name="qusetionsNo" value="${qusetions.qusetionsNo}">
				</div>
				</div>
			</form>
		</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
		// 유효성 검사 
		function boardValidate() {
			if ($("#qusetionsTitle").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return false;
			}
			if ($("#qusetionsContent").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#content").focus();
				return false;
			}
			
			
		}
	</script>
</body>
</html>