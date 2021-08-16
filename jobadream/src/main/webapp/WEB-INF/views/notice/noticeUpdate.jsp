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
.notice-update-line {
	font-family: 'Pretendard-Regular';
	background: linear-gradient(to right top, #4160c8c0, #3eaee6d0);
	color: transparent;
	-webkit-background-clip: text;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 40px;
}

#notice-update-top {
	background-color: #f7f5f8;
	font-weight: bold;
	text-align: left;
	padding-top: 6px;
	height: 60px;
}

#notice-update-con {
	text-align: left;
	padding-top: 2px;
	height: 60px;
}

#notice-update-content {
	height: 400px;
}

#noUpdateBtn {
	background-color: #3eafe6;
	border:#3eafe6;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<h2 class="notice-update-line">공지사항</h2>
		<form action="update" method="post" role="form" onsubmit="return noticeValidate();">
		<div class="list-detaiil shadow p-3 mb-5 bg-white rounded p-5">
				<!-- 글 상단 정보 -->
				<div class="row">
					<div class="col-md-2" id="notice-update-top ">제목</div>
					<div class="col-md-10" id="notice-update-con">
					<input type="text" class="form-control" id="noticeTitle" name="noticeTitle" size="70" value="${notice.noticeTitle }">
					</div>
				</div>
				<div class="row">
					<div class="col-md-2" id="notice-update-top ">작성자</div>
					<div class="col-md-10" id="notice-update-con">${notice.mem.memberId }</div>
				</div>
				<div class="row">
					<div class="col-md-2" id="notice-update-top ">작성일</div>
					<div class="col-md-10" id="notice-update-con">
						<fmt:formatDate value="${notice.createDt}"
							pattern="yyyy년 MM월 dd일" />
					</div>
				</div>
				<hr>
				<br>
				<!-- 글 내용 -->
				<div class="row">
					<div class="col-md-12" id="notice-update-content">
					<textarea class="form-control" id="noticeContent" name="noticeContent" rows="15" style="resize: none;">${notice.noticeContent }</textarea>
				</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-12 mt-4 mb-4">
						<button type="submit" id="noUpdateBtn" class="btn btn-primary float-right">수정</button>
						<a class="btn btn-primary" id="noUpdateBtn" href="noticeList?cp=${param.cp}">목록으로</a>
					</div>
					<input type="hidden" name="cp" value="${param.cp}">
					<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
				</div>
				</div>
			</form>
		</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
		// 유효성 검사 
		function noticeValidate() {
			if ($("#noticeTitle").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return false;
			}
			if ($("#noticeContent").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#content").focus();
				return false;
			}
			
			
		}
	</script>
</body>
</html>