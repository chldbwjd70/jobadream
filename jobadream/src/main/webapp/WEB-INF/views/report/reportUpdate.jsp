<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고</title>
<style>
.reportMor-line {
	font-family: 'Pretendard-Regular';
	background: linear-gradient(to right top, #4160c8c0, #3eaee6d0);
	color: transparent;
	-webkit-background-clip: text;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 40px;
}

#reportMor-top {
	background-color: #f7f5f8;
	font-weight: bold;
	text-align: left;
	padding-top: 13px;
	height: 60px;
}

#reportMor-top-title {
	background-color: #f7f5f8;
	font-weight: bold;
	text-align: left;
	padding-top: 13px;
	height: 60px;
}

.reportUpCustom-select {
	display:flex;
	width: 300px;
	margin-left: 10px;
}

#reportMor-list-content {
	height: 400px;
}

#reportMorMordifyBtn{
	background-color: #3eafe6;
	border:#3eafe6;
}
#reportMorlistTurn {
	background-color: #3eafe6;
	border:#3eafe6;
}


.reportImg {
	cursor: pointer;
	width: 300px;
	height: 200px;
	border: 1px solid #ced4da;
	position: relative;
}

.oneImage {
	width: 300px;
	height: 300px;
}

.reportImg> #oneImage {
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

/* 이미지 삭제 버튼  */
.deleteImg {
	position: absolute;
	top: 5px;
	right: 5px;
	display: inline-block;
	width: 20px;
	height: 20px;
	text-align: center;
	background-color: rgba(50, 50, 50, 0.2);
	border-radius: 50%;
	line-height: 15px;
	font-weight: bold;
	cursor: pointer;
}

.deleteImg:hover {
	background-color: rgba(50, 50, 50, 0.3);
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<h2 class="reportMor-line">신고</h2>
		<form action="update" method="post" enctype="multipart/form-data" onsubmit="return reportValidate();">
			<div class="list-detaiil shadow p-3 mb-5 bg-white rounded p-5">
				<!-- 글 상단 정보 -->
				<div class="row">
					<div class="col-md-2" id="reportMor-top-title">제목</div>
					<div class="col-md-10" id="reportMor-top-co">
						<input type="text" class="form-control" id="reportTitle" name="reportTitle" size="70" value="${report.reportTitle }">
					</div>
				</div>
				<div class="row">
					<div class="col-md-2" id="reportMor-top-title">카테고리</div>
					<div class="col-md-10" id="reportMor-top-co">
						<c:if test="${!empty category}">
						<select class="form-control reportUpCustom-select" id="reportCategoryCd" name="reportCategoryCd" style="width: 100px;">
							<c:forEach items="${category }" var="c">
								<option value="${c.reportCategoryCd }">${c.reportCategoryTitle  }</option>
							</c:forEach>
						</select>
						</c:if>
					</div>
					
				</div>
				<div class="row">
					<div class="col-md-2" id="reportMor-top">작성자</div>
					<div class="col-md-10" id="reportMor-top-co">${report.mem.memberId }</div>
				</div>
				<div class="row">
					<div class="col-md-2" id="reportMor-top">작성일</div>
					<div class="col-md-10" id="reportMor-top-co">
						<fmt:formatDate value="${report.reportDt }"
							pattern="yyyy년 MM월 dd일" />
					</div>
				</div>
				<hr>
				<br>
				<!-- 이미지 출력 -->
				<c:forEach items="${report.rfList}" var="rf">
					<c:choose>
						<c:when test="${rf.fileLevel == 0 && !empty rf.fileName}">
							<c:set var="img0"
								value="${contextPath}/${rf.filePath}${rf.fileName}" />
						</c:when>
					</c:choose>
				</c:forEach>

				<div class="form-inline mb-2">
					<label class="input-group-addon mr-3 insert-label"></label>
					<div class="reportImage oneImage" id="oneImageArea">

						<!-- img0 변수가 만들어진 경우 -->
						<c:if test="${!empty img0 }">
							<img id="oneImage" src="${img0}">
						</c:if>
						<c:if test="${empty img0 }">
							<img id="oneImage">
						</c:if>

						<span class="deleteImg">x</span>

					</div>
				</div>
				<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="img0" name="images" onchange="LoadImg(this,0)" accept="image/*">
				</div>

				<br>
				<!-- 글 내용 -->
				<div class="row">
					<div class="col-md-12" id="reportMor-list-content">
						<textarea class="form-control" id="reportContent"
							name="reportContent" rows="15" style="resize: none;">${report.reportContent }</textarea>
					</div>
				</div>
				<hr>
				<br> <br>
				<div class="row">
					<div class="col-md-12 mt-4 mb-4">
						<button type="submit" id="reportMorMordifyBtn" class="btn btn-primary float-right mr-2">수정</button>
						<a class="btn btn-primary float-right mr-2" id="reportMorlistTurn" href="list?cp=${param.cp}">목록으로</a>
					</div>
					<input type="hidden" name="cp" value="${param.cp}">
					<input type="hidden" name="reportNo" value="${report.reportNo}">
					
					<input type="hidden" name="deleteImages" value="">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
		// 유효성 검사 
		function reportValidate() {
			if ($("#reportTitle").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#report-top-title").focus();
				return false;
			}
			if ($("#reportContent").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#report-list-content").focus();
				return false;
			}
			
			$("input[name='deleteImages']").val(deleteImages);
			

		}

		// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function() {
			$(".reportImage").on("click", function() {
				var index = $(".reportImage").index(this);
				$("#img" + index).click();
			});
		});

		// 미리 보기
		function LoadImg(value, num) {
			if (value.files && value.files[0]) { 
				
				var reader = new FileReader();
				reader.readAsDataURL(value.files[0]);
				reader.onload = function(e) {
					$(".reportImage").eq(num).children("img").attr("src", e.target.result);
					const index = deleteImages.indexOf(num);

					if (index != -1) { 

						deleteImages.splice(index, 1);
					}
				}
			}

		}


		const categoryTitle = "${report.rcategory.reportCategoryTitle }";

		$("#reportCategoryCd > option").each(function(index, item) {

			if ($(item).text() == categoryTitle) {

				$(item).prop("selected", true);
			}
		});
		
		
		// 이미지 x 버튼을 눌렀을 때의 동작
		// 1) x버튼이 눌러진 이미지 레벨을 저장할 배열 생성
		let deleteImages = [];
		
		// 2) x버튼이 클릭 되었을 때 라는 이벤트
		$(".deleteImg").on("click", function(event){

			if(   $(this).prev().attr("src")  != undefined  ){ 
				const index = $(this).index(".deleteImg");

				deleteImages.push(index);
				   
				$(this).prev().removeAttr("src"); 
	
				$("input[name='images']").eq(index).val("");
				
			}
		});
	</script>
</body>
</html>