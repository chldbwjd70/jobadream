<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 소개</title>
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
        .text4 { 
            resize: none;
            border: 1px solid gray;
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
</head>
<body>
    <div class="container">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <br> <h1 class="text1" id="title1"> 내 소개 </h1> <br>
                </div>
            </div>
            <ul class="nav nav-tabs">
				<li class="nav-item col-md-3"><a
					class="nav-link text-center text1 text2" href="myInformation">내 정보</a></li>
				<li class="nav-item col-md-3"><a
					class="nav-link active text-center text1 text2" href="myIntroduce">내 소개</a></li>
				<li class="nav-item col-md-3"><a
					class="nav-link  text-center text1 text2" href="changPwd">비밀번호 변경</a></li>
				<li class="nav-item col-md-3"><a
					class="nav-link text-center text1 text2" href="secession">탈퇴</a>
				</li>
			</ul>
              <div class="tab-content">
                <div class="tab-pane fade show active ">
                    <form method="POST"  action="deleteForm"  name="deleteForm"  onsubmit="return fnRequest();" class="form-horizontal" role="form">
                        <div class="style1">
                            <br><br><br><br>
                            <div class="row">
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-2">
                                    <h4 class=" text1 "> 소개 </h4>
                                    <!-- ${fn:length(list.title) gt 26}" -->
                                    <h5 > (<span id="introduce">
                                    <!-- 길이 구하기 -->
                                    	 ${fn:length(loginMember.memberIntroduce)}
                                    </span> / 50) </h5>
                                </div>
                                <div class="col-md-8">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-8">
                                    <input type="text" class="col-sm text4 text2" id="memberIntroduce" 
                                    name="memberIntroduce" style="height: 100px;" value="${loginMember.memberIntroduce}" ></input>
                                    
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>
                            <br><br><br><br>
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
                            <c:choose>
                            	<c:when test="${empty loginMember.memberIntroduce}">
		                            <div class="col-md-1 pdd">
		                            </div>
		                            <div class="col-md-1 pdd">
		                                <button type="submit"  id="updateBtn" class="btn float-right btn-lg btn-color1" >작성</button> 
		                            </div>
                            	</c:when>
	                            <c:otherwise>
		                            <div class="col-md-1 pdd">
		                                 <button type="button"  id="updateBtn"class="btn float-right btn-lg btn-color1" onclick="fnRequest('updateForm');">수정</button> 
		                            </div>
		                            <div class="col-md-1 pdd">
		                            	<button type="button" class="btn float-right btn-lg btn-color1 "  id="deleteBtn"  onclick="btnDeletion('deleteBtn');" >삭제</button>
		                            </div>
	                            </c:otherwise>
                            </c:choose>
                        </div>
                    </form>
                </div>
              </div>
        </div>
    </div>
   <script>
        $('#input-introduce').on('input',function(){

            if($(this).val().length <= 99){
                $('#introduce').css('color','black');
            }else{  
                $('#introduce').css('color','red');
                const str = $(this).val();
                $(this).val(str.substr(0,100))
            }
            $('#introduce').text($(this).val().length);    // 글자 수 세기
        });
        
        
        function btnDeletion(addr){
        	swal({
      		  title: "삭제하시겠습니까?",
      		  icon: "warning",
      		  buttons: true,
      		  dangerMode: true
      		})
  			.then((willDelete) => {
  	      		  if (willDelete) {
  	      			  
  	      			document.requestForm.action = "${contextPath}/member/" + addr;
  			      	document.requestForm.submit();
  			      	
  	      		  }else{
  	      		    swal("삭제를 취소 하였습니다.");
  	      		  }
  	      });
        }
        
        
    </script>
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>