<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<style>
.reportUpdate-line {
	font-family: 'Pretendard-Regular';
	background: linear-gradient(to right top, #4160c8c0, #3eaee6d0);
	color: transparent;
	-webkit-background-clip: text;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 40px;
}

#reportUpdate-top {
	background-color: #f7f5f8;
	font-weight: bold;
	text-align: left;
	padding-top: 13px;
	height: 60px;
}

#reportUpdate-top-co {
	text-align: left;
	padding-top: 13px;
	height: 60px;
}

#report-update-content {
	height: 400px;
}

/* 이미지 */

.oneImage {
	position: relative;
	width: 300px;
	height: 300px;
}

#oneUpImage {
	max-width: 100%;
	max-height: 100%;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
}


/* 이미지 */
/* 버튼 */
#reportUpdate_deleteBtn {
	background-color: #4161c8;
}

#reportUpdate_updateBtn {
	background-color: #4161c8;
}

#returnlist {
	background-color: #4161c8;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<h2 class="reportUpdate-line">신고하기</h2>
		<div class="list-detaiil shadow p-3 mb-5 bg-white rounded p-5">
			<!-- 글 상단 정보 -->
			<div class="row">
				<div class="col-md-2" id="reportUpdate-top">제목</div>
				<div class="col-md-10" id="reportUpdate-top-co">${report.reportTitle }</div>
			</div>
			<div class="row">
				<div class="col-md-2" id="reportUpdate-top">카테고리</div>
				<div class="col-md-10" id="reportUpdate-top-co">${report.rcategory.reportCategoryTitle }</div>
			</div>
			<div class="row">
				<div class="col-md-2" id="reportUpdate-top">작성자</div>
				<div class="col-md-10" id="reportUpdate-top-co">${report.mem.memberId }</div>
			</div>
			<div class="row">
				<div class="col-md-2" id="reportUpdate-top">작성일</div>
				<div class="col-md-10" id="reportUpdate-top-co">
					<fmt:formatDate value="${report.reportDt }" pattern="yyyy년 MM월 dd일" />
				</div>
			</div>
			<hr>
			<!-- 이미지 출력 -->
			<c:forEach items="${report.rfList}" var="rf">
				<c:choose>
					<c:when test="${rf.fileLevel == 0 && !empty rf.fileName}">
						<c:set var="img0"
							value="${contextPath}/${rf.filePath}${rf.fileName}" />
					</c:when>
				</c:choose>
			</c:forEach>

		<div class="row">
			<div class="form-inline mb-2">
				<label class="input-group-addon mr-3 insert-label"></label>
				<div class="reportUpdateImage oneImage" id="oneImageArea">
					<!-- img0 변수가 만들어진 경우 -->
					<c:if test="${!empty img0 }">
						<img id="oneUpImage" src="${img0}">
					</c:if>
				</div>
			</div>
		</div>
		<br>
		<!-- 글 내용 -->
		<div class="row">
			<div class="col-md-12" id="report-update-content">
				${report.reportContent }</div>
		</div>
		<hr>
		<br> <br>
		<div class="row">
			<div class="col-md-12 mt-4 mb-4">

				<%-- 글 작성자일 경우에만--%>
				<c:if test="${loginMember.memberNo == report.memberNo }">
					<button id="reportUpdate_deleteBtn" class="btn btn-primary float-right mr-2"
						onclick="deleteRequest('delete');">삭제</button>
					<button id="reportUpdate_updateBtn" class="btn btn-primary float-right mr-2"
						onclick="fnRequest('updateForm');">수정</button>
				</c:if>
				<%-- 검색 상태 유지를 위한 쿼리스트링용 변수 선언 --%>
				<c:if test="${!empty param.sk && !empty param.sv }">
					<c:set var="searchStr" value="&sk=${param.sk}&sv=${param.sv}" />
				</c:if>


				<a href="list?type=${param.type}&cp=${param.cp}${searchStr}" id="returnlist"
					class="btn btn-primary float-right mr-2">목록으로</a>
			</div>

		</div>
	</div>
</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
	<form action="#" method="POST" name="requestForm">
		<input type="hidden" name="reportNo" value="${report.reportNo}">
		<input type="hidden" name="cp" value="${param.cp}">
	</form>


	<script>
		function fnRequest(addr){
			
			document.requestForm.action =  addr;
			
			document.requestForm.submit();
			
		}
		
		function deleteRequest(addr){
			swal({
				  title: "삭제하시겠습니까?",
				  text: "삭제하시면 복구가 불가능합니다",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
					  	document.requestForm.action =  addr;
						document.requestForm.submit();
				  
				  } else {
				    swal("삭제가 취소되었습니다");
				  }
				});
		}
		
	</script>
</body>
</html>