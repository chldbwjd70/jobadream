<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<style>
.report-insert-line {
	font-family: 'Pretendard-Regular';
	background: linear-gradient(to right top, #4160c8c0, #3eaee6d0);
	color: transparent;
	-webkit-background-clip: text;
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

#report_insertBtn {
	background-color: #3eafe6;
	border:#3eafe6;
}

.boardImg {
	cursor: pointer;
	width: 200px;
	height: 200px;
	border: 1px solid #ced4da;
	position: relative;
}

.thubnail {
	width: 300px;
	height: 300px;
}

.boardImg>img {
	max-width: 100%;
	max-height: 100%;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
}

#fileArea {
	display: none;
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
						<input type="text" name="reportTitle" id="reportTitle"
							class="form-control" placeholder="제목을 입력하세요">
						<c:if test="${!empty category}">
							<select class="custom-select" id="reportCategoryCd"
								name="reportCategoryCd" style="width: 100px;">
								<c:forEach items="${category }" var="c">
									<option value="${c.reportCategoryCd }">${c.reportCategoryTitle  }</option>
								</c:forEach>
							</select>
						</c:if>
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
				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label">이미지</label>
					<div class="boardImg thubnail" id="titleImgArea">
						<img id="titleImg">
					</div>
				</div>
				<!-- ***** 파일 업로드 하는 부분 ***** -->
				<div id="fileArea">
					<input type="file" id="img0" name="images"
						onchange="LoadImg(this,0)" accept="image/*">
				</div>
				<br>
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

		// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function() {
			$(".boardImg").on("click", function() {
				var index = $(".boardImg").index(this);
				// this : 이벤트가 발생한 요소 == 클릭된 .boardImg 요소
				// 배열.index("요소") : 매개변수로 작성된 요소가 배열의 몇 번째 index 요소인지 반환

				$("#img" + index).click();
			});
		});

		// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		function LoadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				// 자바스크립트 FileReader
				// 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체
				reader.readAsDataURL(value.files[0]);
				// FileReader.readAsDataURL()
				// 지정된의 내용을 읽기 시작합니다. Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.
				// FileReader.onload
				// load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.
				reader.onload = function(e) {
					// e.target.result
					// -> 파일 읽기 동작을 성공한 객체에(fileTag) 올라간 결과(이미지 또는 파일)
					$(".boardImg").eq(num).children("img").attr("src",
							e.target.result);
				}
			}
		}
	</script>


</body>
</html>