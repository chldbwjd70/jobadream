<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
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
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>
</head>
<body>
	<div class="container">
	
	<c:set var="phone"  
			   value="${fn:split( loginMember.memberPhone, '-' ) }"/>
		
		
		<c:set var="addr" 
			   value="${fn:split( loginMember.memberAddress, ',' ) }"/>
	
	
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<br>
					<h1 class="text1" id="title1">내 정보</h1>
					<br>
				</div>
			</div>
			<ul class="nav nav-tabs">
				<li class="nav-item col-md-3"><a
					class="nav-link active text-center text1 text2" href="myInformation">내 정보</a></li>
				<li class="nav-item col-md-3"><a
					class="nav-link text-center text1 text2" href="myIntroduce">내 소개</a></li>
				<li class="nav-item col-md-3"><a
					class="nav-link  text-center text1 text2" href="changPwd">비밀번호 변경</a></li>
				<li class="nav-item col-md-3"><a
					class="nav-link text-center text1 text2" href="secession">탈퇴</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="myInformation"> 
					<form method="POST" action="update"  name="updateForm"  onsubmit="return memberUpdateValidate();" class="form-horizontal" role="form">
						<div class="style1">
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
									<label class=" text1 text2"> ${loginMember.memberName} </label>
								</div>
								<div class="col-md-2"></div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-2">
									<label class=" text1 text2"> 아이디 </label>
								</div>
								<div class="col-md-6">
									<label class=" text1 text2">${loginMember.memberId}</label>
								</div>
								<div class="col-md-2"></div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-2">
									<label class=" text1 text2"> 이메일 </label>
								</div>
								<div class="col-md-6">
									<input type="email" class="form-control" id="email"
										name="inputEmail" autocomplete="off" value="${loginMember.memberEmail }"  required>
								</div>
								<div class="col-md-2"></div>

								<div class="col-md-7 offset-md-4">
									<span id="checkEmail">&nbsp;</span>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-2">
									<label class=" text1 text2"> 전화번호 </label>
								</div>
								<div class="col-md-2">
									<select class="custom-select" id="phone1" name="phone" required>
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>019</option>
									</select>
								</div>
								<!-- number타입의 input태그에는 maxlength를 설정할 수 없음 -->
								<!-- 전화번호2 -->
								<div class="col-md-2">
									<input type="number" class="form-control phone" id="phone2"
										name="phone" value="${phone[1]}" required>
								</div>

								<!-- 전화번호3 -->
								<div class="col-md-2">
									<input type="number" class="form-control phone" id="phone3"
										name="phone" value="${phone[2]}" required>
								</div>
								<div class="col-md-2"></div>

								<div class="col-md-7 offset-md-4">
									<span id="checkPhone">&nbsp;</span>
								</div>
							</div>
							<br>
							<div class="row mb-3 form-row">
								<div class="col-md-2"></div>
								<div class="col-md-2">
									<label class=" text1 text2"> 주소 </label>
								</div>
								<div class="col-md-3">
									<input type="text" name="address"
										class="form-control postcodify_postcode5"  value="${addr[0]}">
								</div>
								<div class="col-md-3">
									<button type="button" class="btn btn-color2"
										id="postcodify_search_button">검색</button>
								</div>
								<div class="col-md-2"></div>
							</div>
							<div class="row mb-3 form-row">
								<div class="col-md-4"></div>
								<div class="col-md-6">
									<input type="text" class="form-control postcodify_address"
										name="address" id="address1" value="${addr[1]}">
								</div>
								<div class="col-md-2"></div>
							</div>
							<div class="row mb-3 form-row">
								<div class="col-md-4"></div>
								<div class="col-md-6">
									<input type="text" class="form-control postcodify_details"
										name="address" id="address2" value="${addr[2]}">
								</div>
								<div class="col-md-2"></div>
							</div>
							<br>
							<br>
							<br>
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-2">
									<label class=" text1 text2"> 평점 </label>
								</div>
								<div class="col-md-6">
									<label class=" text1 text2"> 0.0 </label>
								</div>
								<div class="col-md-2"></div>
							</div>
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
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script src="../js/singUp.js"></script>
	<script>
		// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>
	<script>
	
		//  (function(){  })()
		// 즉시 실행 함수 : 함수가 정의 되자 마자 실행되는 함수.
		// 변수명 중복 해결 + 속도적 측면에서 우위를 가짐.
		
		// 전화번호 첫 번째 자리 지정하기
		(function(){
			// 전화번호 앞자리가 적힌 option 요소를 배열로 얻어옴
			// each( function(index, item){ }  : 배열을 반복 접근하는 jQuery 메소드
			// index : 현재 접근한 인덱스 번호
			// item : 현재 접근한 요소
			$("#phone1 > option").each( function(index, item){ 
				//console.log( $(item).text()  );
				
				// 요소에 작성된 내용이 phone[0]의 값과 같다면
				if( $(item).text() == "${phone[0]}"){
					
					// 현재 요소에 seleted 속성을 추가
					$(item).prop("selected", true);
				}
				
			});
			//console.log("${phone[0]}");
		})();
	
	
			
		// 회원 정보 수정 시 유효성 검사
		function memberUpdateValidate(){
		    const regExp1 = /^[0-9]{3,4}$/; // 숫자 3~4글자
		    const regExp2 = /^[0-9]{4}$/; // 숫자 4글자

		    const ph2 = $("#phone2").val();
		    const ph3 = $("#phone3").val();

		    if( !regExp1.test(ph2)  || !regExp2.test(ph3)  ){
		    	swal({ "icon"  : "warning",
		    		   "title" : "전화번호가 유효하지 않습니다."  ,
		    		   "text"  : "중간 자리는 3~4, 마지막 자리는 4글자로 작성해주세요." });
		    	
		    	return false;
		    }
		    
		    // 이메일 유효성 검사
		    const regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;

		    const inputEmail = $("#email").val().trim();

		    if( !regExp.test(inputEmail) ){
		    	swal({ "icon"  : "warning",
		    		   "title" : "이메일이 유효하지 않습니다."  ,
		    		   "text"  : "아이디 4글자 이상의 이메일 형식으로 작성해주세요." });
		    	
		    	return false;
		    }
		   
			const phone = $("[name='phone']");
			const address = $("[name='address']");
	
	
			// 입력된 전화번호, 주소 조합하여 form태그에 hidden으로 추가 하기
			// 왜? ->  파라미터를 쉽게 받게 하기 위하여
			const memberPhone = $("<input>", {
				type: "hidden", name: "inputPhone",
				value: $(phone[0]).val() + "-" + $(phone[1]).val() + "-" + $(phone[2]).val()
			});
	
			const memberAddress = $("<input>", {
				type: "hidden", name: "inputAddress",
				value: $(address[0]).val() + "," + $(address[1]).val() + "," + $(address[2]).val()
			});
	
			$("form[name='updateForm']").append(memberPhone).append(memberAddress);
		    
		}
			
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>