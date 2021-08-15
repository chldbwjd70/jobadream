<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 </title>

<jsp:include page="../common/header.jsp"/>
<style>

  #title1 {
	font-family: 'Pretendard-Regular';
	background: linear-gradient(to right top, #4160c8c0, #3eaee6d0);
	color: transparent;
	-webkit-background-clip: text;
}

  .text1 { font-weight: bold; }
      
  .text2 { font-size: 30px; }

  .text3 { color: black; }

  .text3:hover { text-decoration: none;}

  .bc-color:hover {
      background-color: #4161c8;
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

  .btnhover::before {
      content: '';
      position: absolute;
      left: 0px;
      bottom:0px;
      z-index:-1;
      width: 0%;
      height:1px;
      background: #6098FF;
      box-shadow: inset 0px 0px 0px #6098FF;
      display: block;
      -webkit-transition: all 0.4s cubic-bezier(.5, .24, 0, 1);
      transition: all 0.4s cubic-bezier(.5, .24, 0, 1)
  }

  .btnhover:hover::before {  width:100%; }
 
  .btnhover::after {
      content: '';
      position: absolute;
      right: 0px;
      top:0px;
      z-index:-1;
      width: 0%;
      height:1px;
      -webkit-transition: all 0.4s cubic-bezier(.5, .24, 0, 1);
      transition: all 0.4s cubic-bezier(.5, .24, 0, 1)
  }
  .btnhover:hover::after { width:100%; }
  
  .btnhover:hover{
      border-left:1px solid #6098FF;
      border-right:1px solid #6098FF;
  }
</style>
</head>
<body>
<div class="container">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <br> <h1 class="text1" id="title1"> 마이페이지 </h1> <br>
                    <div class="row">
                        <div class="col-md-6 ">
                            <a href="myInformation">
                                <button type="button" class="btn btn-block btn-outline bc-color  btnhover" id="Information" >
                                    <img src="${contextPath}/resources/images/main/mypage1.png">
                                </button>
                            </a>
                            <h3 class="text-center text1" ><br>
                                <label for="Information"><a href="myInformation" class="text3">내 정보</a></label>
                            </h3>
                        </div>
                        <div class="col-md-6">
                            <a href="pointSell">
                                <button type="button" class="btn btn-block btn-outline bc-color  btnhover" id="sell" >
                                    <img src="${contextPath}/resources/images/main/mypage.png">
                                </button>
                            </a>
                            <h3 class="text-center text1" ><br>
                                <label for="pointSell"><a href="pointSell" class="text3">결제</a></label>
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>