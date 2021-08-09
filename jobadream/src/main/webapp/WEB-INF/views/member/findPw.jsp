<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form method="POST" action="findPw" onsubmit="return findPw();" class="form-horizontal" role="form">
	<div class="style1">
		<br>
		<br>
		<br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-2">
				<label class=" text1 text2"> 이름 </label>
			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" id="name2" name="findName2" placeholder="이름을 입력해주세요." >
			</div>
			<div class="col-md-2"></div>
		</div>
		<br>
		<br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-2">
				<label class=" text1 text2"> 아이디 </label>
			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" id="id2" name="findId2" placeholder="아이디을 입력해주세요." >
			</div>
			<div class="col-md-2"></div>
		</div>
		<br>
		<br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-2">
				<label class=" text1 text2"> 이메일 </label>
			</div>
			<div class="col-md-6">
				<input type="email" class="form-control" id="email2"
				name="findEamil2" autocomplete="off" placeholder="이메일을 입력해주세요." >
			</div>
			<div class="col-md-2">
				<button type="submit" class="btn btn-color2">인증</button>
			</div>
			<div class="col-md-7 offset-md-4">
				<span id="checkEmail">&nbsp;</span>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-3"></div>
			<div class="col-md-3">
				<input type="text" class="form-control" id="emailNum"
					name="emailNum" autocomplete="off" placeholder="인증번호" required>
			</div>
			<div class="col-md-5"></div>

			<div class="col-md-7 offset-md-4">
				<span id="checkEmail">&nbsp;</span>
			</div>
		</div>
		<br>
		<br>
		<br>
	</div>
	<br>
	<div class="row">
		<div class="col-md-12">
			<button class="btn float-right" id="btn-color1"
				onclick="button2_click();">비밀번호 찾기</button>
		</div>
	</div>
</form>
<script>
function findPw(){
	
	const regExp1 = /^[가-힣]{1,}$/;
	const regExp2 = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
	const regExp3 = /^[a-zA-Z0-9]{1,}$/;
	
	const inputId = $("#id2").val().trim();
	const inputName = $("#name2").val().trim();
    const inputEmail = $("#email2").val().trim();
	
	if( !regExp1.test(inputName) ){
		swal({ 
			"icon" : "error",
			"title" : "올바른 이름을 작성해주세요."
		});
		
		return false;
	}
	if( !regExp3.test(inputId) ){
		swal({ 
			"icon" : "error",
			"title" : "올바른 아이디를 작성해주세요."
		});
		return false;
	}
	if( !regExp2.test(inputEmail) ){
		swal({ 
			"icon" : "error",
			"title" : "올바른 이메일을 작성해주세요."
		});
		return false;
	}
}
</script>