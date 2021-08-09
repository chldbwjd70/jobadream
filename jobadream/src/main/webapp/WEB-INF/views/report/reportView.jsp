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

.image{
		width: 300px;
		height: 300px;
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
		<h2 class="report-line">신고하기</h2>
		<div class="list-detaiil shadow p-3 mb-5 bg-white rounded p-5">
				<!-- 글 상단 정보 -->
				<div class="row">
					<div class="col-md-2" id="report-top">제목</div>
					<div class="col-md-10" id="report-top-co">${report.reportTitle }</div>
				</div>
				<div class="row">
					<div class="col-md-2" id="report-top">카테고리</div>
					<div class="col-md-10" id="report-top-co">${report.reportTitle }</div>
				</div>
				<div class="row">
					<div class="col-md-2" id="report-top">작성자</div>
					<div class="col-md-10" id="report-top-co">${report.mem.memberId }</div>
				</div>
				<div class="row">
					<div class="col-md-2" id="report-top">작성일</div>
					<div class="col-md-10" id="report-top-co">
						<fmt:formatDate value="${report.reportDt }"
							pattern="yyyy년 MM월 dd일" />
					</div>
				</div>
				<hr>
				<br> <br>
				<!-- 이미지 출력 -->
				<div class="row">
					<c:when test="${!empty at.fileName}">
								<c:set var="img" value="${contextPath}/${at.filePath}${at.fileName}"/>
					</c:when>
					<div class="form-inline mb-2">
						<label class="input-group-addon mr-3 insert-label">이미지</label>
						<div class="boardImg image" id="ImgArea">
							
							<!-- img0 변수가 만들어진 경우 -->
							<c:if test="${!empty img }"> 
								<img id="Img" src="${img}">
							</c:if>
								
						</div>
					</div>
				</div>
				<!-- 글 내용 -->
				<div class="row">
					<div class="col-md-12" id="report-list-content">
						${report.reportContent }</div>
				</div>
				<hr>
				<br> <br>
				<div class="row">
					<div class="col-md-12 mt-4 mb-4">

						<%-- 글 작성자일 경우에만--%>
						<c:if test="${loginMember.memberNo == report.memberNo }">
						<button id="deleteBtn" class="btn btn-primary float-right mr-2">삭제</button> 
						<button id="updateBtn" class="btn btn-primary float-right mr-2" onclick="fnRequest('updateForm');">수정</button> 
					</c:if>
						<%-- 검색 상태 유지를 위한 쿼리스트링용 변수 선언 --%>
					<c:if test="${!empty param.sk && !empty param.sv }">
						
						<c:set var="searchStr" 
							value="&sk=${param.sk}&sv=${param.sv}"  />
					</c:if>
					
					
					<a href="list?type=${param.type}&cp=${param.cp}${searchStr}" class="btn btn-primary float-right mr-2">목록으로</a>
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
			
			// 현재 문서 내부에 name속성 값이 requestForm인 요소의 action 속성 값을 변경
			document.requestForm.action =  addr;
			
			// 현재 문서 내부에 name속성 값이 requestForm인 요소를 제출해라
			document.requestForm.submit();
			
		}
		
	</script>
</body>
</html>