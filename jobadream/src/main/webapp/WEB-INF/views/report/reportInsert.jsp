<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
.report-insert-line {
	color: #3eafe6;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 40px;
}

#report-title {
	width: 80%;
	border: 1px solid #F2EEEB;
}

#report-insertTop-all {
	margin-left: 10px;
	margin-bottom: 10px;
	font-weight: bold;
	text-align: left;
	padding-top: 13px;
	height: 60px;
}

#top-area {
	display: flex;
	margin-top: 10px;
	margin-left: 20px;
}

.title-area {
	width: 600px;
}

.custom-select {
	width: 300px;
	margin-left: 10px;
}

.reportInsert-textarea-custom {
	width: 96%;
	height: 100%;
	resize: none;
	overflow-y: hidden;
	padding: 11px;
	padding-bottom: 2px;
	line-height: 16px;
	border: 1px solid #F0F0F2;
	border-radius: 5px;
}

#reportContent {
	height: 500px;
}

.input-file-button {
	margin-left: 5px;
	padding: 6px 25px;
	background-color: #354686;;
	border-radius: 4px;
	color: white;
	cursor: pointer;
}

#report_insertBtn {
	background-color: #4161c8;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<h2 class="report-insert-line">신고하기</h2>
		<form action="insert" method="post" enctype="multipart/form-data"
			role="form" onsubmit="return reportValidate();">
			<div class="shadow p-3 mb-5 bg-white rounded p-5">
				<div class="row">
					<div class="col col-md-12" id="top-area">
						<input type="text" id="report-title" class="form-control"
							placeholder="제목을 입력하세요"> <select class="custom-select"
							id="report-box" style="width: 100px;">
							<option selected>게시판</option>
							<option value="1">채팅</option>
							<option value="2">이용내역</option>
						</select>
					</div>
				</div>
				<div class="row" id="report-insertTop-all">
					<div class="col-md-2 " id="report-top-wri">작성자</div>
					<div class="col-md-10" id="report-top-insert">${loginMember.memberId }</div>
				</div>
				<div class="row" id="report-insertTop-all">
					<div class="col-md-2" id="report-top-date">작성일</div>
					<div class="col-md-10" id="report-top-insert">
						<h5 class="my-0" id="today"></h5>
					</div>
				</div>

				<div class="row">
					<div class="col col-md-12 mb-3 m-3" id="noInsert-text-area">
						<div>
							<label for="content">내용</label>
						</div>
						<textarea class="reportInsert-textarea-custom"
							placeholder="내용을 입력해주세요" name="reportContent" id="reportContent"></textarea>
					</div>
				</div>
				<br>
				<div class="row">
					<div
						class="col col-md-12 mb-3 d-flex flex-row-reverse bd-highlight">
						<button class="btn btn-primary mr-5" id="report_insertBtn">등록</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>

	<script>
		(function printToday() {
			var today = new Date();
			var month = (today.getMonth() + 1);
			var date = today.getDate();
			var str = today.getFullYear() + "-"
					+ (month < 10 ? "0" + month : month) + "-"
					+ (date < 10 ? "0" + date : date);
			$("#today").html(str);
		})();
		function reportValidate() {
			if ($("#reportTitle").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return false;
			}
			if ($("#reportContent").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#content").focus();
				return false;
			}
		}

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#image_section').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		// 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
		$("#imgInput").change(function() {
			readURL(this);
		});
	</script>


</body>
</html>