<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>job아드림 회원 가입</title>
<jsp:include page="../common/header.jsp"/>
</head>
<style>
	#title1{ color: #3eafe6; }
	.text1{ font-weight: bold; }
	#btn-color1{
		background-color: #4161c8;
		color: white;
		font-weight: bold;
	}
	.pss{
		background-color: rgba(62, 175, 230, 0.1);
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
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                            <h4 class="text1">*약관</h4>
                            <!-- <p style="border: 1px solid gray;"> -->
                            <textarea class=" pss" readonly rows="10" cols="107" style="resize: none;">
제1조
이 약관은 샘플 약관입니다.

① 약관 내용 1

② 약관 내용 2

③ 약관 내용 3

④ 약관 내용 4


제2조
이 약관은 샘플 약관입니다.

① 약관 내용 1

② 약관 내용 2
   
③ 약관 내용 3

④ 약관 내용 4
</textarea>
                             <form role="form" action="terms" >
                           <%--  <form role="form" method="POST" action="${contextPath}/member/terms" onsubmit="return button1_click();"> --%>
                                <label for="terms">
                                    <input type="checkbox" id="terms" /> 약관에 동의합니다
                                </label>
                            </form>
                        </div>
                        <div class="col-md-1">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-10"></div>
                <div class="col-md-2">
                    <a type="submit" class="btn" id="btn-color1" onclick="button1_click();" >
                        다음
                    </a>
                </div>
            </div>
        </div>
    </div>
    <script>
        function button1_click() {
            if($("#terms").is(":checked")){
            	 location.href="${contextPath}/member/signUp" ;
            }else{
                swal({
                    title: "약관에 동의해주세요",
                    button: "확인"
                });
            }
        }
    </script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>