<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<jsp:include page="../..//common/header.jsp" />
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
	font-size: 20px;
}

.text3 {
	color: white;
}

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

input, select {
	font-family: 'Pretendard-Regular';
}
</style>
</head>
<body>
	<div class="container">

		<c:set var="phone"
			value="${fn:split( loginMember.memberPhone, '-' ) }" />


		<c:set var="addr"
			value="${fn:split( loginMember.memberAddress, ',' ) }" />


		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<br>
					<h1 class="text1" id="title1">내 정보</h1>
					<br>
				</div>
			</div>
			<ul class="nav nav-tabs">
				<li class="nav-item col-md-4"><a
					class="nav-link active text-center text1 text2"
					href="myInformation">내 정보</a></li>
				<li class="nav-item col-md-4"><a
					class="nav-link  text-center text1 text2" href="changPwd">비밀번호
						변경</a></li>
				<li class="nav-item col-md-4"><a
					class="nav-link text-center text1 text2" href="secession">탈퇴</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="myInformation">
					<form method="POST" action="update" name="updateForm"
						onsubmit="return memberUpdateValidate();" class="form-horizontal"
						role="form">
						<div class="style1">
							<br> <br> <br> <br>
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-2">
									<label class=" text1 text2"> 이름 </label>
								</div>
								<div class="col-md-6">
									<label class=" text1 text2"> ${loginMember.memberName}
									</label>
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
									<br> <label class=" text1 text2"> 한줄 소개 </label>
								</div>
								<div class="col-md-6">
									<h5>
										<p>
											<!-- 길이 구하기 -->
											(<span id="introduce">
												${fn:length(loginMember.memberIntroduce)}</span> / 30)
										</p>
									</h5>
									<input type="text" class="form-control" name="inputIntroduce"
										id="inputIntroduce" autocomplete="off"
										value="${loginMember.memberIntroduce }">
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
									<label class=" text1 text2"> 이메일 </label>
								</div>
								<div class="col-md-6">
									<input type="email" class="form-control" id="email"
										name="inputEmail" autocomplete="off"
										value="${loginMember.memberEmail }" required>
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
								<div class="col-md-2">
									<button type="button" id="sendPhoneNumber"
										name="sendPhoneNumber" class="btn btn-color2">전송</button>
								</div>
								<div class="col-md-7 offset-md-4"></div>
							</div>
							<br>
							<div class="row  form-row">
								<div class="col-md-4"></div>
								<div class="col-md-4">
									<input type="text" class="form-control"
										id="inputCertifiedNumber" name="inputCertifiedNumber"
										autocomplete="off" placeholder="인증번호">
								</div>
								<div class="col-md-3">
									<button type="button" id="checkBtn" name="checkBtn"
										class="btn btn-color2">인증</button>
								</div>
								<div class="col-md-1"></div>

								<div class="col-md-7 offset-md-4">
									<span id="checkEmail">&nbsp;</span>
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
										class="form-control postcodify_postcode5" value="${addr[0]}">
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
							<br> <br> <br>
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-2">
									<label class=" text1 text2"> 평점 </label>
								</div>
								<div class="col-md-6">
									<c:choose>
										<c:when test="${empty scoreMember }">
											<label class=" text1 text2"> 조회할 평점이 없습니다. </label>
										</c:when>
										<c:otherwise>
											<label class=" text1 text2"> ${scoreMember.pointAVG} / (${countMember.countMember}번 참여) </label>
										</c:otherwise>
									</c:choose>
								
								</div>
								<div class="col-md-2"></div>
							</div>
							<br> <br> <br>
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
								<button type="submit" class="btn float-right btn-lg btn-color1">수정</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>
	<script>
		// 전화번호 첫 번째 자리 지정하기
		(function() {

			$("#phone1 > option").each(function(index, item) {

				if ($(item).text() == "${phone[0]}") {

					$(item).prop("selected", true);
				}

			});
		})();

		// 회원 정보 수정 시 유효성 검사
		function memberUpdateValidate() {
			const regExp1 = /^[0-9]{4}$/;
			const regExp2 = /^[0-9]{4}$/;
			const ph2 = $("#phone2").val();
			const ph3 = $("#phone3").val();
			if (!regExp1.test(ph2) || !regExp2.test(ph3)) {
				swal({
					"icon" : "warning",
					"title" : "전화번호가 올바르지 않습니다.",
					"text" : "올바른 전화번호를 작성해주세요."
				});

				return false;
			}
			
		    const address1 = $("#address1").val();
		    const address2 = $("#address2").val();
		    if( address1.trim() == ""  && address2.trim() == ""){ 
		    	swal({
					"icon" : "warning",
					"title" : "주소를 입력해수세요",
					"text" : "주소를 작성해주세요."
				});
		    	return false;
		    }
		    const ckeckNum = $("#inputCertifiedNumber").val();
		    
		    if( ckeckNum.trim() == ""){ 
		    	swal({
					"icon" : "warning",
					"title" : "인증 실패",
					"text" : "인증번호를 입력해주세요."
				});
		    	return false;
		    }
			// 이메일 유효성 검사
			const regExp = /^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/;
			const inputEmail = $("#email").val().trim();
			if (!regExp.test(inputEmail)) {
				swal({
					"icon" : "warning",
					"title" : "이메일이 올바르지 않습니다.",
					"text" : "아이디 4글자 이상의 이메일 형식으로 작성해주세요."
				});

				return false;
			}

			const phone = $("[name='phone']");
			const address = $("[name='address']");

			const memberPhone = $("<input>", {
				type : "hidden",
				name : "inputPhone",
				value : $(phone[0]).val() + "-" + $(phone[1]).val() + "-"
						+ $(phone[2]).val()
			});

			const memberAddress = $("<input>", {
				type : "hidden",
				name : "inputAddress",
				value : $(address[0]).val() + "," + $(address[1]).val() + ","
						+ $(address[2]).val()
			});

			$("form[name='updateForm']").append(memberPhone).append(
					memberAddress);

		}
	</script>
	<script>
		$('#inputIntroduce').on('input', function() {

			if ($(this).val().length <= 29) {
				$('#introduce').css('color', 'black');
			} else {
				$('#introduce').css('color', 'red');
				const str = $(this).val();
				swal({
					"icon" : "warning",
					"text" : "30자 이하로 작성해주세요."
				});
				$(this).val(str.substr(0, 30))
			}
			$('#introduce').text($(this).val().length); // 글자 수 세기
		});
	</script>
	<script>
	$("#sendPhoneNumber").click(function() {
		
    	const phone = $("[name='phone']");
    	let memberPhone =  $(phone[0]).val() + "-" + $(phone[1]).val() + "-" + $(phone[2]).val();
    	swal({
    		title: "인증번호가 전송되었습니다.",
    		icon: "warning",
    	})
    	$.ajax({
    		type: "POST",
    		url: "${contextPath}/sendSMS",
    		data: {
    			"memberPhone": memberPhone
    		},
    		success: function(res) {
    			console.log(res)
    			 $('#checkBtn').click(function(){
    	              if($.trim(res) ==$("#inputCertifiedNumber").val()){
    		              	swal({
    		              		icon: "success",
    		              		title: "인증이 완료되었습니다.",
    		              	})
    					}else{
    						swal({
    		              		icon: "warning",
    		              		title: "인증번호가 일치하지 않습니다.",
    		              	})
    					}
    				})
    		},error : function(e){
    				console.log(e);
    		}
    	})
    });
	</script>
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>