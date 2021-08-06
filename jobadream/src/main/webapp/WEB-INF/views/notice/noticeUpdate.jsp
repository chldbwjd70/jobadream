<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
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

#notice-list-content {
	height: 400px;
}

.btn {
	background-color: #4161c8;
}
</style>
<body>
	<div class="container">
		<h2 class="notice-update-line">공지사항</h2>
		<div class="list-detaiil shadow p-3 mb-5 bg-white rounded p-5">
			 <form action="update" method="POST" role="form" onsubmit="return noticeValidate();">
				<!-- 글 상단 정보 -->
				<div class="row">
					<div class="col-md-2" id="notice-top">제목</div>
					<div class="col-md-10" id="notice-top-co">
					<input type="text" class="form-control" id="noticeTitle" name="noticeTitle" size="70" value="${notice.noticeTitle}">
					</div>
				</div>
				<div class="row">
					<div class="col-md-2" id="notice-top">작성자</div>
					<div class="col-md-10" id="notice-top-co">${notice.mem.memberId }</div>
				</div>
				<div class="row">
					<div class="col-md-2" id="notice-top">작성일</div>
					<div class="col-md-10" id="notice-top-co">
						${notice.createDt}
					</div>
				</div>
				<hr>
				<br>
				<!-- 글 내용 -->
				<div class="row">
					<div>
						<label for="content">내용</label>
					</div>
					<textarea class="form-control" id="noticeContent"
						name="noticecontent" rows="15" style="resize: none;">${notice.noticeContent}</textarea>
				</div>
				<br>
				<hr>
				<div class="row">
					<div class="col-md-12 mt-4 mb-4">
						<a href="noticeList?cp=${param.cp}" class="btn btn-primary  mr-2">목록으로</a>
						<button type="submit" class="btn btn-primary float-right mr-4"
							 id="btn-r">수정</button>
					</div>
					   <input type="hidden" name="cp" value="${param.cp}">
            			<input type="hidden" name="boardNo" value="${notice.noticeNo}">
				</div>
			</form>
		</div>
	</div>
	
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