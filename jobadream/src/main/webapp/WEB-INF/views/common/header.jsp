<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" scope="application"
	value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<!--부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<!-- 제이쿼리주소 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>

<!-- 나눔스퀘어 폰트적용 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<link rel="stylesheet"
	href="${contextPath}/resources/css/common/header.css" type="text/css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

/* 검색창 */
.gps-btn{
	border:none;
	background-color: transparent;
}
/* 로그인 모달  */
.text1 {
	font-weight: bold;
}

.text2-1 {
	font-size: 20px;
}

#btn-color1 {
	background-color: #4161c8;
	color: white;
	font-weight: bold;
}

a, a:hover {
	text-decoration: none;
}

.pdd {
	padding: 0px;
}

input[type=password] {
	font-family: 'Pretendard-Regular';
}
input[type=text] {
	font-family: 'Pretendard-Regular';;
}
textarea {
	font-family: 'Pretendard-Regular';
}
/* 로그인 모달 */
</style>

</head>
<body>
	<div class="container">
		<div class="header">
			<div class="alarm-box">
			<c:if test="${ !empty alarmList }">
				
				<c:forEach items="${alarmList}" var="alarm">
						<div class="alert" role="alert" id="alart1">
							<p class="alarm-title">채팅방 개설 알림</p>
							<p class="alarm-msg">${alarm.alarmMessage}</p>
							<div class="alartBtn-box">
								<button class="btn" id="chatRoomGo" onClick="chatRoomGo(${alarm.chatRoomNo})">채팅방으로 이동</button>
								<button class="btn" id="alartOk" onClick="closeAlarm(${alarm.chatRoomNo})">확인</button>
							</div>
						</div>
					</c:forEach>
			</c:if>
			</div>
			<!-- 로그인,회원가입 박스 -->
			<div class="hd-1">
				<!-- 로그인,회원가입 글 -->
				<c:choose>
					<c:when test="${ empty loginMember }">
						<a href="${contextPath}/member/terms">회원가입</a>
						<a href="#jobLogin" data-toggle="modal">로그인</a>
					</c:when>
					<c:otherwise>
						<a href="${contextPath}/member/myPage">마이페이지</a>
						<a href="${contextPath}/member/logout">로그아웃</a>
					</c:otherwise>
				</c:choose>
				<a href="${contextPath}/member/error">오류</a>
				<a href="${contextPath}/member/error404"> 404</a>
			</div>
			<div class="row hd-2">
				<div class="col-sm-4" id="logo">
					<a href="${contextPath}"><img
						src="${contextPath}/resources/images/main/logo.png"></a>
				</div>
				<div class="col-sm-5 sc">
					<div id="sc-2">
						<form class="input-group" id="input-search" action="${contextPath}/gps/searchView" method="POST">
						<input type="text" id="search" size="40" name="searchGps"  placeholder="Ex)서울특별시 노원구 "
							style="border: 0 solid black">
						<div class="icon">
							<button class="gps-btn" type="submit"><img
								src="${contextPath}/resources/images/main/sc.png"></button>
						</div>
						</form>
					</div>
				</div>
				<div class="col-sm-3 btn-box">
					<c:if test="${ !empty loginMember }">
						<button type="button" class="btn-location" id="btd-2" onClick="location.href='${contextPath}/chat/roomList'">
							<strong>1:1채팅</strong>
						</button>
					</c:if>
					<button type="button" class="btn-location" onclick="location.href='${contextPath}/gps/list'" id="btd-2"><strong>내주변 job</strong></button>
				</div>	
			</div>

			<!-- 로그인 모달 -->
			<div class="modal fade" id="jobLogin" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog " role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								<img src="${contextPath}/resources/images/main/logo.png">
							</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<br>
						<div class="modal-body">
							<form class="form-signin" method="POST"
								action="${contextPath}/member/login"
								onsubmit="return loginValidate();">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-3">
										<label class=" text1 text2-1"> 아이디 </label>
									</div>
									<div class="col-md-6 pdd">
										<input type="text" class="form-control " name="memberId" id="id cssid" maxlength="12" 
										placeholder="아이디를 입력하세요" value="${cookie.saveId.value}" autocomplete="off" >
									</div>
									<div class="col-md-2"></div>
								</div>
								<br>
								<br>
								<div class="row">
                                     <div class="col-md-1">
                                     </div>
                                     <div class="col-md-3">
                                         <label class=" text1 text2-1"> 비밀번호 </label>
                                     </div>
                                     <div class="col-md-6 pdd">
                                         <input type="password" class="form-control " id="memberPw" name="memberPw"
                                             maxlength="20" placeholder="비밀번호를 입력하세요" required>
                                     </div>
                                     <div class="col-md-1 pdd">
                                         <button type="button" class="btn btn-outline-secondary btn-md " id="eye">show</button>
                                     </div>
                                     <div class="col-md-1">
                                     </div>
                                 </div>
								<br>
								<div class="modal-footer">
									<div class="container-fluid">
										<div class="row">
											<div class="col-md-12">
												<button type="submit" class="btn btn-block" id="btn-color1">
													로그인</button>
											</div>
										</div>
										<br>
										<div class="row">
											<c:if test="${ !empty cookie.saveId.value }">
												<c:set var="ch" value="checked" />
											</c:if>
											<div class="col-md-4">
												<label> <input type="checkbox" name="save" id="save" ${ch}> 아이디 저장
												</label>
											</div>
											<div class="col-md-2"></div>
											<div class="col-md-6 text-right">
												<label> <a href="${contextPath}/member/findId">아이디/비밀번호
														찾기</a>
												</label>
											</div>
										</div>
										<br>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- 로그인 모달 -->
		</div>
	</div>
	<c:if test="${!empty title }">
		<script>
			swal({
				"icon" : "${icon}",
				"title" : "${title}",
				"text" : "${text}"
			});
		</script>
	</c:if>
	<script>
		// 로그인 수행 시 아이디/비밀번호가 작성 되었는지 확인하는 유효성 검사
		function loginValidate() {

			if ($("#memberId").val().trim().length == 0) {
				swal({
					"icon" : "warning",
					"title" : "아이디를 입력해주세요"
				}).then(function() {
					$("#memberId").focus();
				});
				return false;
			}

			if ($("#memberPw").val().trim().length == 0) {

				swal({
					"icon" : "warning",
					"title" : "비밀번호를 입력해주세요"
				}).then(function() {
					$("#memberPw").focus();
				});

				return false;
			}
		}
	</script>
	<script>
        // mouseenter(hover) mousedown(action)
      $('#eye').on("mousedown", function(){
            $('#memberPw').attr('type',"text");
        }).on('mouseup mouseleave', function() {
            $('#memberPw').attr('type',"password");
        });
    </script>
    <script>
    	function chatRoomGo(chatRoomNo){
    		const addr = "${contextPath}/chat/room/"+chatRoomNo;
    		location.href = addr;
    		
    		alarmUpdateStatus(chatRoomNo);
    		
    	}
    	
    	function closeAlarm(chatRoomNo){
    		alarmUpdateStatus(chatRoomNo);
    		location.href = location.href;
    		
    	}
    	
    	function alarmUpdateStatus(chatRoomNo){
    		
 		   $.ajax({
				url : "${contextPath}/chat/alarmOk",
				data : {"chatRoomNo" : chatRoomNo},
				type : "GET",
				dataType : "JSON", 
				success : function(result){
					if(result > 0){
					
						console.log("알림 확인 성공")
					}else{
						console.log("알림 확인 실패")
					}
				},
				error : function(){
					console.log("알림 변경 자체 실패");
				}
			});
    	}
    

    </script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script>
    	let alarmSock = new SockJS("<c:url value='/alarm' />");
    	alarmSock.onmessage = function(event){
			const obj = JSON.parse(event.data);
			const memberNo = obj.memberNo;
			console.log(obj);
			console.log(memberNo);
			
			   $.ajax({
					url : "${contextPath}/chat/selectAlarmList",
					type : "POST",
					data : {"memberNo" : memberNo},
					dataType : "JSON", 
					success : function(newAlarmList){
						console.log(newAlarmList);
						console.log("성공");
							$(".alarm-box").html("");
						$.each(newAlarmList, function(index, item){
							
							var div1 = $("<div>").addClass("alert").attr("role", "alert").attr("id", "alart1");
							
							var p1 = $("<p>").addClass("alarm-title").html("채팅방 개설 알림");
							var pTxt = item.alarmMessage;
							var p2 = $("<p>").addClass("alarm-msg").html(pTxt);
							
							var fn1 = "chatRoomGo("+item.chatRoomNo+");";
							var fn2 = "closeAlarm("+item.chatRoomNo+");";
							var div2 = $("<div>").addClass("alartBtn-box")
							var btn1 = $("<button>").addClass("btn").attr("id", "chatRoomGo").attr("onClick", fn1).text("채팅방으로 이동");
							var btn2 = $("<button>").addClass("btn").attr("id", "alartOk").attr("onClick", fn2).text("확인");
							
							div2.append(btn1).append(btn2);
							div1.append(p1).append(p2).append(div2);
							$(".alarm-box").append(div1);
							
						});
						location.href
					},
					error : function(){
						console.log("알림리스트 조회 실패");
					}
				});

			
	
		}	
    
    </script>
    
</body>
</html>