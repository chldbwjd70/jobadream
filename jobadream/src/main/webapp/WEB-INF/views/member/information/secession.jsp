<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<jsp:include page="../../common/header.jsp" />
<style>
     #title1 {
	font-family: 'Pretendard-Regular';
	background: linear-gradient(to right top, #4160c8c0, #3eaee6d0);
	color: transparent;
	-webkit-background-clip: text;
}
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
        .btn-color2{
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

        .nav-item a{ color: black !important; }
        .nav-item .active{ color: #4161c8 !important;}
        
        #pss{
		background-color: rgba(62, 175, 230, 0.1);
		}
    </style>
</head>
<body>
    <div class="container">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <br> <h1 class="text1" id="title1"> 탈퇴 </h1> <br>
                </div>
            </div>
            <ul class="nav nav-tabs">
				<li class="nav-item col-md-4"><a
					class="nav-link active text-center text1 text2" href="myInformation">내 정보</a></li>
				<li class="nav-item col-md-4"><a
					class="nav-link  text-center text1 text2" href="changPwd">비밀번호 변경</a></li>
				<li class="nav-item col-md-4"><a
					class="nav-link text-center text1 text2" href="secession">탈퇴</a>
				</li>
			</ul>
              <div class="tab-content">
                <div class="tab-pane fade show active ">
                    <form method="POST" action="secession" onsubmit="return secessionValidate();" class="form-horizontal" role="form">
                        <div class="style1">
                            <br><br>
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class="col-md-10">
                                    <h4 class="text1">*약관</h4>
                            <!-- <p style="border: 1px solid gray;"> -->
                             <textarea class="form-control "  id="pss"  rows="10" cols="107" style="resize: none;">
제1조
이 약관은 샘플 약관입니다.

① 팀장은 유정언니이다.

② 수빈언니는 뾰족 수빈 언니

③ 디자인 잘하는 가을 언니

④ 두둥!


제2조
이 약관은 샘플 약관입니다.

① 약관 내용 1

② 약관 내용 2
   
③ 약관 내용 3

④ 약관 내용 4
</textarea>
                                <label for="terms">
                                    <input type="checkbox" name="agree" id="agree" /> 약관에 동의합니다
                                </label>
                        </div>
                                <div class="col-md-1">
                                </div>
                            </div>
                            <br><br><div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-3">
                                        </div>
                                        <div class="col-md-6">
                                            <h4 class=" text1">
                                                비밀번호 확인
                                            </h4>
                                        </div>
                                        <div class="col-md-3">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                        </div>
                                        <div class="col-md-5">
                                        <input type="password" class="form-control" id="currentPwd" name="currentPwd" placeholder="비밀번호를 입력해주세요.">
                                        </div>
                                        <div class="col-md-4">
                                            <button class="btn btn-color2" onclick="button1_click();" >
                                                확인
                                            </button>
                                        </div>
                                    </div>
                                    <br><br>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-10">
                                <a href="myPage" >
                                    <button type="button" class="btn float-left btn-lg btn-color2">
                                        <label class="text3">< 목록으로</label>
                                    </button>
                                </a>
                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>
                    </form>
                </div>
              </div>
        </div>
    </div>
    </div>
    <script>
		// 약관 동의가 체크 되었을 때에만 탈퇴 진행
		function secessionValidate(){
			
			if( !$("#agree").prop("checked") ){
				swal({"icon" : "info", "title" : "약관 동의를 체크해주세요."})
				return false;
			}
			
			const regExp = /^[a-zA-Z0-9\#\-\_]{1,}$/;
			
			const currentPwd = $("#currentPwd").val().trim();
			
			if( !regExp.test(currentPwd) ){
				swal({ 
					"icon" : "error",
					"title" : "회원 탈퇴",
					"text" : "탈퇴를 진행하기 위해 비밀번호를 입력해주세요"
				});
				
				return false;
			}
		}
	</script>
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>