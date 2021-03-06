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
	font-size: 30px;
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
				<div class="col-md-12">
					<br>
					<h1 class="text1" id="title1">아이디/비밀번호 찾기</h1>
					<br>
				</div>
			</div>
			<ul class="nav nav-tabs">
				<li class="nav-item col-md-6"><a
					class="nav-link  text-center text1" href="findId">아이디 찾기</a></li>
				<li class="nav-item col-md-6"><a
					class="nav-link active text-center text1" href="findPw">비밀번호 찾기</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane  show active " id="findId">
					<form method="POST" action="findPw" onsubmit="return findPw();"
						class="form-horizontal" role="form">
						<div class="style1">
							<br> <br> <br>
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-2">
									<label class=" text1 text2"> 이름 </label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" id="name2"
										name="findName2" placeholder="이름을 입력해주세요.">
								</div>
								<div class="col-md-2"></div>
							</div>
							<br> <br>
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-2">
									<label class=" text1 text2"> 아이디 </label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" id="id2" name="findId2"
										placeholder="아이디을 입력해주세요.">
								</div>
								<div class="col-md-2"></div>
							</div>
							<br> <br>
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-2">
									<label class=" text1 text2"> 이메일 </label>
								</div>
								<div class="col-md-6">
									<input type="email" class="form-control" id="email2"
										name="findEamil2" autocomplete="off"
										placeholder="이메일을 입력해주세요.">
								</div>
								<div class="col-md-2">
								</div>
								<div class="col-md-7 offset-md-4">
									<span id="checkEmail">&nbsp;</span>
								</div>
							</div>
							<br> <br> <br>
						</div>
						<br>
						<div class="row">
							<div class="col-md-12">
								<button class="btn float-right" id="btn-color1">비밀번호 찾기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		function findPw() {

			const regExp1 = /^[가-힣]{1,}$/;
			const regExp2 = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
			const regExp3 = /^[a-zA-Z0-9]{1,}$/;

			const inputId = $("#id2").val().trim();
			const inputName = $("#name2").val().trim();
			const inputEmail = $("#email2").val().trim();

			if (!regExp1.test(inputName)) {
				swal({
					"icon" : "error",
					"title" : "올바른 이름을 작성해주세요."
				});

				return false;
			}
			if (!regExp3.test(inputId)) {
				swal({
					"icon" : "error",
					"title" : "올바른 아이디를 작성해주세요."
				});
				return false;
			}
			if (!regExp2.test(inputEmail)) {
				swal({
					"icon" : "error",
					"title" : "올바른 이메일을 작성해주세요."
				});
				return false;
			}
		}
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>