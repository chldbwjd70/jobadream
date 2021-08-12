<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>job아드림 회원 가입</title>
<jsp:include page="../common/header.jsp"/>
</head>
<style>
	#title1 {
	font-family: 'Pretendard-Regular';
	background: linear-gradient(to right top, #4160c8c0, #3eaee6d0);
	color: transparent;
	-webkit-background-clip: text;
}
	.text1{ font-weight: bold; }
	#btn-color1{
	    background-color: #4161c8;
	    color: white;
	    font-weight: bold;
	}
	.btn-color2{
	    background-color: #354686;
	    color: white;
	    font-weight: bold;
	}
	.style1{
	    border: 1px solid gray;
	    box-shadow: 3px 3px 3px 3px gray;
	}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
</style>
<body>
    <div class="container">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <br>
                    <h1 class="text-center text1" id="title1"> 회원가입 </h1>
                    <br>
                </div>
            </div>
           <form role="form" method="POST" action="signUp" class="needs-validation" name="signUpForm" onsubmit="return validate();">

                <div class="row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-8 style1">
                        <br>
                        <div class="alert alert-dismissable alert-info">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                <h5>x</h5>
                            </button>
                             <strong>모든 항목을 입력해주세요.</strong>
                        </div>
                        <br>
                        <!-- 아이디 -->
                        <div class="row">
                            <div class="col-md-1">
                            </div>
                            <div class="col-md-3">
                                <label class=" text1" for="id"> 아이디 </label>
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="memberId" id="id" maxlength="12" placeholder="아이디를 입력하세요" autocomplete="off" required>
                            </div>
                            <div class="col-md-2">
                            </div>
    
                            <div class="col-md-7 offset-md-4">
                                <span id="checkId">&nbsp;</span>
                            </div>
                        </div>
                        <br>
                        <!-- 비밀번호 -->
                        <div class="row">
                            <div class="col-md-1">
                            </div>
                            <div class="col-md-3">
                                <label class=" text1" for="pwd1"> 비밀번호 </label>
                            </div>
                            <div class="col-md-6">
                                <input type="password" class="form-control" id="pwd1" name="memberPw" maxlength="20" placeholder="비밀번호를 입력하세요" required>
                            </div>
                            <div class="col-md-2">
                            </div>
    
                            <div class="col-md-7 offset-md-4">
                                <span id="checkPwd1">&nbsp;</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-1">
                            </div>
                            <div class="col-md-3">
                                <label class=" text1"> 비밀번호 확인 </label>
                            </div>
                            <div class="col-md-6">
                                <input type="password" class="form-control" id="pwd2" maxlength="20" placeholder="비밀번호 확인" required>
                            </div>
                            <div class="col-md-2">
                            </div>
                            <div class="col-md-7 offset-md-4">
                                <span id="checkPwd2">&nbsp;</span>
                            </div>
                        </div>
                        <br>
                        
                        <!-- 이름 -->
                        <div class="row">
                            <div class="col-md-1">
                            </div>
                            <div class="col-md-3">
                                <label class=" text1"> 이름 </label>
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control" id="name" name="memberName" placeholder="이름을 입력해주세요." required>
                            </div>
                            <div class="col-md-2">
                            </div>

                            <div class="col-md-7 offset-md-4">
                                <span id="checkName">&nbsp;</span>
                            </div>
                        </div>
                        
                        <!-- 이메일 -->
                        <div class="row">
                            <div class="col-md-1">
                            </div>
                            <div class="col-md-3">
                                <label class=" text1"> 이메일 </label>
                            </div>
                            <div class="col-md-6">
                                <input type="email" class="form-control" id="email" name="memberEmail" autocomplete="off" placeholder="이메일을 입력해주세요." required>
                            </div>
                            <div class="col-md-2">
                            </div>
                            <div class="col-md-7 offset-md-4">
                                <span id="checkEmail">&nbsp;</span>
                            </div>
                        </div>
                        
                        <!-- 전화번호 -->
                        <div class="row">
                            <div class="col-md-1">
                            </div>
                            <div class="col-md-3">
                                <label class=" text1"> 전화번호 </label>
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
                                <input type="number" class="form-control phone" id="phone2" name="phone" required>
                            </div>
                            <!-- 전화번호3 -->
                            <div class="col-md-2">
                                <input type="number" class="form-control phone" id="phone3" name="phone" required>
                            </div>
                            <div class="col-md-2">
                            <button type="button" id="sendPhoneNumber" name="sendPhoneNumber" class="btn btn-color2" >전송</button>
                            </div>
                            <div class="col-md-7 offset-md-4">
                                <span id="checkPhone">&nbsp;</span>
                            </div>
                        </div>
                        <div class="row  form-row">
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="inputCertifiedNumber" name="inputCertifiedNumber" autocomplete="off" placeholder="인증번호" required>
                            </div>
                            <div class="col-md-3">
                            <button type="button" id="checkBtn" name="checkBtn" class="btn btn-color2" >인증</button>
                            </div>
                            <div class="col-md-1">
                            </div>
    
                            <div class="col-md-7 offset-md-4">
                                <span id="checkEmail">&nbsp;</span>
                            </div>
                        </div>
                        <div class="row mb-3 form-row">
                            <div class="col-md-1">
                            </div>
                            <div class="col-md-3">
                                <label class=" text1"> 주소 </label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="address" class="form-control postcodify_postcode5"  placeholder="우편번호" required>
                            </div>
                            <div class="col-md-3">
                                <button type="button" class="btn btn-color2" id="postcodify_search_button">검색</button>
                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <div class="row mb-3 form-row">
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control postcodify_address" name="address" id="address1" placeholder="도로명 주소" >
                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>
                        <div class="row mb-3 form-row">
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control postcodify_details" name="address" id="address2" placeholder="상세 주소를 입력해주세요." >
                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>
    
                        <br><br>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-9">
                    </div>
                    <div class="col-md-3">
                        <button class="btn" id="btn-color1" type="submit">
                            다음   
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <script src="${contextPath}/resources/js/singUp.js"></script>
    <script>
        // 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
        $(function () {
            $("#postcodify_search_button").postcodifyPopUp();
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
<jsp:include page="../common/footer.jsp"/>
</body>
</html>