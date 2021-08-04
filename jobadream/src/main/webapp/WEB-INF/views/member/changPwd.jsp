<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<jsp:include page="../common/header.jsp" />
<style>
#title1 { color: #3eafe6; }
.text1 { font-weight: bold; }
.text2 { font-size: 20px; }
.text3 { color: white; }

.text3:hover {
	color: white;
	text-decoration: none;
}

.btn-color1 {
	background-color: #4161c8;
	color: white;
	font-weight: bold;
}

.btn-color2 {
	background-color: #354686;
	color: white;
	font-weight: bold;
}

.style1 {
	border-bottom: 1px solid gray;
	border-right: 1px solid gray;
	border-left: 1px solid gray;
	box-shadow: 3px 3px 3px 3px gray;
}

.nav-item a {
	color: black !important;
}

.nav-item .active {
	color: #4161c8 !important;
}
</style>
</head>
<body>
	<div class="container">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<br>
					<h1 class="text1" id="title1">비밀번호 변경</h1>
					<br>
				</div>
			</div>
			<ul class="nav nav-tabs">
				<li class="nav-item col-md-3"><a
					class="nav-link  text-center text1 text2" href="myInformation">내 정보</a></li>
				<li class="nav-item col-md-3"><a
					class="nav-link text-center text1 text2" href="myIntroduce">내 소개</a></li>
				<li class="nav-item col-md-3"><a
					class="nav-link active text-center text1 text2" href="changPwd">비밀번호 변경</a></li>
				<li class="nav-item col-md-3"><a
					class="nav-link text-center text1 text2" href="secession">탈퇴</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active ">
					<form method="POST" action="changPwd" onsubmit="return pwdValidate();" class="form-horizontal" role="form">
						<div class="style1">
							<br>
							<br>
							<br>
							<br>
							<br>
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-2">
									<label class=" text1 text2"> 기존 비밀번호 </label>
								</div>
								<div class="col-md-6">
									<input type="password" class="form-control" id="currentPwd" name="currentPwd" placeholder="기존 비밀번호를 입력해주세요.">
								</div>
								<div class="col-md-2"></div>
							</div>
							<br>
							<br>
							<br>
							<br>
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-2">
									<label class=" text1 text2"> 새 비밀번호 </label>
								</div>
								<div class="col-md-6">
									<input type="password" class="form-control" id="newPwd1" name="newPwd1" placeholder="새 비밀번호를 입력해주세요.">
								</div>
								<div class="col-md-2"></div>
							</div>
							<br>
							<br>
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-2">
									<label class=" text1 text2">새 비밀번호 확인</label>
								</div>
								<div class="col-md-6">
									<input type="password" class="form-control" id="newPwd2" name="newPwd2" placeholder="새 비밀번호를 입력해주세요.">
								</div>
								<div class="col-md-2"></div>
							</div>
							<br>
							<br>
							<br>
							<br>
							<br>
						</div>
						<br>
						<div class="row">
							<div class="col-md-10">
								<a href="myPage">
									<button type="button" class="btn float-left btn-lg btn-color2">
										<label class="text3">< 목록으로</label>
									</button>
								</a>
							</div>
							<div class="col-md-2">
								<button type="submit" class="btn float-right btn-lg btn-color1" >수정</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 비밀번호 유효성 검사
		function pwdValidate(){
			const regExp = /^[a-zA-Z0-9\#\-\_]{6,20}$/;
			
			const newPwd1 = $("#newPwd1").val().trim();
			const newPwd2 = $("#newPwd2").val().trim();
			
			// 새비밀번호가 유효하지 않거나
			// 새비밀번호, 새비밀번호 확인이 같지 않은 경우
			if( !regExp.test(newPwd1) ){
				swal({ 
					"icon" : "error",
					"title" : "비밀번호가 올바르지 않습니다"
				});
				
				return false;
			}
			if(newPwd1 != newPwd2){
				swal({ 
					"icon" : "error",
					"title" : "비밀번호가 일치 하지 않습니다."
				});
				
				return false;
			}
		}
	
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>