<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
.notice-insert-t{
   font-family: 'Pretendard-Regular';
   background: linear-gradient(to right top, #4160c8c0, #3eaee6d0);
   color: transparent;
   -webkit-background-clip: text;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 40px;
}

#noticeTitle {
	width: 10%;
	border: 1px solid #F2EEEB;
}

#notice-insertTop-all{
	margin-left:10px;
	margin-bottom: 10px;
	font-weight: bold;
	text-align: left;
	padding-top: 13px;
	height: 60px;
}

.noticeInsert-textarea-custom {
	width: 96%;
	height: 100%;
	resize: none;
	padding: 11px;
	overflow-y: hidden;
	padding-bottom: 2px;
	line-height: 16px;
	border: 1px solid #F0F0F2;
	border-radius: 5px;
}

#noInsert-text-area{
	height: 500px;
}

.noticeInsert-textarea-custom:focus {
    outline: none;
}

#noticeInsert-btn {
	background-color: #3eafe6;
	border:#3eafe6;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<h2 class="notice-insert-t">공지사항</h2>
		<form action="insert" method="post" role="form" onsubmit="return noticeValidate();">
		<div class="list-detaiil shadow p-3 mb-5 bg-white rounded">
			<div class="row">
				<div class="col col-md-12" id="title">
					<div class="input-group mb-3 m-3" id="notice-insert-t">
						<input type="text" class="form-control"
							aria-label="Sizing example input"
							aria-describedby="inputGroup-sizing-default" placeholder="게시글 제목" id="noticeTitle" name="noticeTitle">
					</div>
				</div>
			</div>
			
				<div class="row" id="notice-insertTop-all">
					<div class="col-md-2 " id="notice-top-wri">작성자</div>
					<div class="col-md-10" id="notice-top-insert">${loginMember.memberId }</div>
				</div>
			<div class="row" id="notice-insertTop-all">
					<div class="col-md-2" id="notice-top-date">작성일</div>
					<div class="col-md-10" id="notice-top-insert"><h5 class="my-0" id="today"></h5></div>
				</div>
			<div class="row">
				<div class="col col-md-12 mb-3 m-3" id="noInsert-text-area">
					<div>
						<label for="content">내용</label>
					</div>
					<textarea class="noticeInsert-textarea-custom" placeholder="내용을 입력해주세요" name="noticeContent" id="noticeContent"></textarea>
				</div>
			</div>
			<br><br>
			<div class="row">
				<div class="col col-md-12 mb-3 d-flex flex-row-reverse bd-highlight">
					<button type="submit" class="btn btn-primary mr-5" id="noticeInsert-btn">등록</button>
				</div>
			</div>
			</div>
		</form>
		</div>
		
<jsp:include page="../common/footer.jsp"></jsp:include>


<script>
		
		(function printToday() {
			// 오늘 날짜 출력 
			var today = new Date();
			var month = (today.getMonth() + 1);
			var date = today.getDate();

			var str = today.getFullYear() + "-"
					+ (month < 10 ? "0" + month : month) + "-"
					+ (date < 10 ? "0" + date : date);
			$("#today").html(str);
		})();

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