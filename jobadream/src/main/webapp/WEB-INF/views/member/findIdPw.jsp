<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>job아드림 회원 가입</title>
<jsp:include page="../common/header.jsp"/>
</head>
    <style>
        #title1 { color: #3eafe6;}
        .text1 { font-weight: bold;}
        .text2 { font-size: 30px;}
        #btn-color1 {
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
    </style>
<body>
<div class="container">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <br> <h1 class="text1" id="title1"> 아이디/비밀번호 찾기 </h1> <br>
                </div>
            </div>
            <ul class="nav nav-tabs">
                <li class="nav-item col-md-6">
                    <a class="nav-link active text-center text1" data-toggle="tab" href="#findId">아이디 찾기</a>
                </li>
                <li class="nav-item col-md-6">
                    <a class="nav-link text-center text1" data-toggle="tab" href="#findPw">비밀번호 찾기</a>
                </li>
            </ul>
              <div class="tab-content">
                <div class="tab-pane fade show active " id="findId">
                    <form role="form" method="POST" action="${contextPath}/member/findIdPw " >
                        <div class="style1">
                            <br><br><br><br><br>
                            <div class="row">
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-2">
                                    <label class=" text1 text2"> 이름 </label>
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름을 입력해주세요."  required>
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>
                            <br><br><br><br>
                            <div class="row">
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-2">
                                    <label class=" text1 text2"> 이메일</label>
                                </div>
                                <div class="col-md-6">
                                    <input type="email" class="form-control" id="memberEmail" name="memberEmail" autocomplete="off" placeholder="이메일을 입력해주세요."  required>
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>
                            <br><br><br><br><br>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-12">
                                <button type="submit" class="btn float-right" id="btn-color1" type="submit"  onclick="findId">
                                    아이디 찾기
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="findPw">
                    <form action = "findPw.html">
                        <div class="style1">
                            <br><br><br>
                            <div class="row">
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-2">
                                    <label class=" text1 text2"> 이름 </label>
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" id="name" name="memberName" placeholder="이름을 입력해주세요." required>
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>
                            <br><br>
                            <div class="row">
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-2">
                                    <label class=" text1 text2"> 아이디 </label>
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="memberId" id="id" maxlength="12" placeholder="아이디를 입력하세요" autocomplete="off" required>
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>
                            <br><br>
                            <div class="row">
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-2">
                                    <label class=" text1 text2"> 이메일 </label>
                                </div>
                                <div class="col-md-6">
                                    <input type="email" class="form-control" id="email" name="memberEmail" autocomplete="off" placeholder="이메일을 입력해주세요." required>
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-color2" >인증</button>
                                </div>
                                <div class="col-md-7 offset-md-4">
                                    <span id="checkEmail">&nbsp;</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-1">
                                </div>
                                <div class="col-md-3">
                                </div>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" id="emailNum" name="EmailNum" autocomplete="off" placeholder="인증번호" required>
                                </div>
                                <div class="col-md-5">
                                </div>
        
                                <div class="col-md-7 offset-md-4">
                                    <span id="checkEmail">&nbsp;</span>
                                </div>
                            </div>
                            <br><br><br>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-12">
                                <button  class="btn float-right" id="btn-color1" onclick="button2_click();">
                                    비밀번호 찾기    
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
              </div>
        </div>
    </div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>