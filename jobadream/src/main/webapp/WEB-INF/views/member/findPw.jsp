<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<form role="form" method="POST" action="findPw">
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
				<input type="text" class="form-control" id="memberName"
					name="memberName" placeholder="이름을 입력해주세요." required>
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
				<input type="text" class="form-control" name="memberId"
					id="memberId" maxlength="12" placeholder="아이디를 입력하세요"
					autocomplete="off" required>
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
				<input type="email" class="form-control" id="memberEmail"
					name="memberEmail" autocomplete="off" placeholder="이메일을 입력해주세요."
					required>
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
					name="EmailNum" autocomplete="off" placeholder="인증번호" required>
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