<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>job아드림</title>
<jsp:include page="../common/header.jsp"/>
</head>
    <style>
       #title1 {
	font-family: 'Pretendard-Regular';
	background: linear-gradient(to right top, #4160c8c0, #3eaee6d0);
	color: transparent;
	-webkit-background-clip: text;
}
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
                    	<jsp:include page="findId.jsp"/>
                </div>
                <div class="tab-pane fade" id="findPw">
                     <jsp:include page="findPw.jsp"/>
                </div>
        	</div>
        </div>
    </div>
    <script type="text/javascript">
    
    function findId() {
    	const inputName = Number(document.getElementById("name").value);
    	const inputEamil = Number(document.getElementById("email").value);
    	
    	const memberName = ${Member.memberName};
        
    	const point1 = ${loginMember.memberPoint};
        
    	
    	
    	
    }
    </script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>