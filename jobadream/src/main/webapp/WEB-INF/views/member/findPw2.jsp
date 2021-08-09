<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>job아드림</title>
<jsp:include page="../common/header.jsp" />
</head>
<style>
#title1 {
	font-family: 'Pretendard-Regular';
	background: linear-gradient(to right top, #4160c8c0, #3eaee6d0);
	color: transparent;
	-webkit-background-clip: text;
}

.text1 {
	font-weight: bold;
}

.text2 {
	font-size: 25px;
}

#btn-color1 {
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
<body>
	<div class="container">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<br>
					<h1 class="text1" id="title1">비밀번호 변경</h1>
					<br>
				</div>
			</div>
			<ul class="nav nav-tabs">
				<li class="nav-item col-md-6"></li>
				<li class="nav-item col-md-6"><a
					class="nav-link active text-center text1" data-toggle="tab"
					href="#findPw2">비밀번호 변경</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active " id="findPw2">
					<form method="POST" action="findPw2" onsubmit="return findPw2();" class="form-horizontal" role="form">
						<div class="style1">
							<br>
							<br>
							<br>
							<br>
							<br>
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-2">
									<label class=" text1 text2"> 신규 비밀번호 </label>
								</div>
								<div class="col-md-6">
									<input type="password" class="form-control" id="newPwd1"
										name="chPwd" maxlength="20" placeholder="새로운 비밀번호를 입력하세요"
										required>
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
									<label class=" text1 text2"> 비밀번호 확인</label>
								</div>
								<div class="col-md-6">
									<input type="password" class="form-control" id="newPwd2"
										maxlength="20" placeholder="비밀번호 확인" required>
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
							<div class="col-md-12">
								<button type="submit" class="btn float-right" id="btn-color1"
									type="submit">비밀번호 변경</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 비밀번호 유효성 검사
		function findPw2(){
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