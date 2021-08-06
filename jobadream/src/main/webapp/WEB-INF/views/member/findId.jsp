<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form role="form" method="POST" action="findId">
	<div class="style1">
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-2">
				<label class=" text1 text2"> 이름 </label>
			</div>
			<div class="col-md-6">
				<input type="text" class="form-control" id="name" name="memberName"
					placeholder="이름을 입력해주세요." required>
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
				<label class=" text1 text2"> 이메일</label>
			</div>
			<div class="col-md-6">
				<input type="email" class="form-control" id="email"
					name="memberEmail" autocomplete="off" placeholder="이메일을 입력해주세요."
					required>
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
				type="submit" onclick="findId">아이디 찾기</button>
		</div>
	</div>
</form>
