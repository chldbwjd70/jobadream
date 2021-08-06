<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
<jsp:include page="header.jsp"/>
<style>
@font-face {
	font-family: 'ONE-Mobile-POP';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-POP.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.errfont {
	font-family: 'ONE-Mobile-POP';
}

.bg-image-full {
	background: no-repeat center center scroll;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
}

div.bg-image-full {
	height: 500px;
	text-align: center;
}

#error1 {
	color: white;
	position: relative;
	top: 75px;
	font-size: 4em;
	text-shadow: -2px 0 black, 0 2px black, 2px 0 black, 0 -2px black;
}

#errbtn1, #errbtn2 {
	background-color: #3eafe6;
	color: white;
	border: 0px solid #3eafe6;
}

#errbtn1:hover, #errbtn2:hover  #errbtn1:active, #errbtn2:active{
	background-color: #354686;
	color: white;
	border: 0px solid #354686;
}

#err3 {
	padding-right: 0px;
}

#err4 {
	padding-left: 0px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="py-5 bg-image-full"
			style="background-image: url('${contextPath}/resources/images/main/error.png');">
			<div class="col-sm-2"></div>
			<div class="col-sm-8 errfont">
				<h1 id="error1">
					ERROR...<br>job아드림..
				</h1>
			</div>
			<div class="col-sm-2"></div>
		</div>
		<div class="row">
			<div class="col-sm-6 " id="err3">
				<button type="button"
					class="btn btn-block btn-lg btn-outline-info errfont" id="errbtn1"
					onclick="location.href='${pageContext.servletContext.contextPath}'; ">
					메인 페이지로 이동</button>
			</div>
			<div class="col-sm-6 " id="err4">
				<button type="button"
					class="btn btn-block btn-lg btn-outline-info errfont" id="errbtn2"
					onclick="history.back();">이전 페이지로 이동</button>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>