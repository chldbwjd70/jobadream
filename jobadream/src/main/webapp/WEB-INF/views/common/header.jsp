<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<!--부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<!-- 제이쿼리주소 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>

<!-- 나눔스퀘어 폰트적용 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<link rel="stylesheet" href="${contextPath}/resources/css/common/header.css" type="text/css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
/* 로그인 모달  */
.text1 {
	font-weight: bold;
}
.text2 {
	font-size: 20px;
}

#btn-color1 {
	background-color: #4161c8;
	color: white;
	font-weight: bold;
}
a, a:hover{
text-decoration: none; 
}

input[type=password]{ font-family:"굴림"; }
/* 로그인 모달 */
</style>

</head>
<body>
	<div class="container">
		<div class="header">
			<!-- 로그인,회원가입 박스 -->
			<div class="hd-1">
				<!-- 로그인,회원가입 글 -->
				<c:choose>
					<c:when test="${ empty loginMember }">
						<a href="${contextPath}/member/terms">회원가입</a>
						<a href="#jobLogin" data-toggle="modal">로그인</a>
					</c:when>
					<c:otherwise>
						<a href="#">마이페이지</a>
						<a href="${contextPath}/member/logout">로그아웃</a>
					</c:otherwise>
				</c:choose>

			</div>
			<div class="row hd-2">
				<div class="col-sm-4" id="logo">
					<a href="${contextPath}"><img
						src="${contextPath}/resources/images/main/logo.png"></a>
				</div>
				<div class="col-sm-5 sc">
					<div id="sc-2">
						<input type="text" id="search" size="40"
							style="border: 0 solid black">
						<div class="icon">
							<a href="#"><img
								src="${contextPath}/resources/images/main/sc.png"></a>
						</div>
					</div>
				</div>
				<div class="col-sm-3 btn-box">
                    <c:if test="${ !empty loginMember }">
                    	<button type="button" class="btn-location" id="btd-2"><strong>1:1채팅</strong></button>
                    </c:if>
                    <button type="button" class="btn-location" id="btd-2"><strong>내주변 job</strong></button>
                </div>
			</div>

			<!-- 로그인 모달 -->
			<div class="modal fade" id="jobLogin" role="dialog"aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog " role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								<img src="${contextPath}/resources/images/main/logo.png">
							</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<br>
						<div class="modal-body">
							<form class="form-signin" method="POST" action="${contextPath}/member/login" onsubmit="return loginValidate();">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-4">
										<label class=" text1 text2"> 아이디 </label>
									</div>
									<div class="col-md-6">
										<input type="text" class="form-control" id="memberId"
											name="memberId" maxlength="12" placeholder="아이디를 입력하세요" value="${cookie.saveId.value}">
									</div>
								</div>
								<br>
								<br>
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-4">
										<label class=" text1 text2"> 비밀번호 </label>
									</div>
									<div class="col-md-6">
										<input type="password" class="form-control" id="memberPw"
											name="memberPw" maxlength="20" placeholder="비밀번호를 입력하세요">
									</div>
								</div>
								<br>
								<div class="modal-footer">
									<div class="container-fluid">
										<div class="row">
											<div class="col-md-12">
												<button type="submit" class="btn btn-block" id="btn-color1"> 로그인</button>
											</div>
										</div>
										<br>
										<div class="row">
											<c:if test="${ !empty cookie.saveId.value }">
												<c:set var="ch" value="checked" />
											</c:if>
											<div class="col-md-4">
												<label> 
													<input type="checkbox" name="save" id="save" ${ch}> 아이디 저장
												</label>
											</div>
											<div class="col-md-2"></div>
											<div class="col-md-6 text-right">
												<label> <a href="${contextPath}/member/findIdPw">아이디/비밀번호 찾기</a> </label>
											</div>
										</div>
										<br>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 로그인 모달 -->
		</div>
	</div>
	<c:if test="${!empty title }">
		<script>
			swal({
				"icon" : "${icon}",
				"title" : "${title}",
				"text" : "${text}"
			});
		</script>

	</c:if>
	
	<script>
		// 로그인 수행 시 아이디/비밀번호가 작성 되었는지 확인하는 유효성 검사
		function loginValidate(){
			
			if(  $("#memberId").val().trim().length == 0  ){
				swal({
					"icon" : "warning",
					"title" : "아이디를 입력해주세요"
				}).then(function(){
					$("#memberId").focus();
				});
				return false;  
			}
			
			if(  $("#memberPw").val().trim().length == 0  ){
				
				swal({
					"icon" : "warning",
					"title" : "비밀번호를 입력해주세요"
				}).then(function(){
					$("#memberPw").focus();
				});
				
				return false;  
			}
		}
	</script>
</body>
</html>