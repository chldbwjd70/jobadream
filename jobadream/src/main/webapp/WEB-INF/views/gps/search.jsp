<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search</title>
<style>
#search-map {
	height: 500px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#gps{
	width:210px;
	height:40px;
	margin-left: 3px;
	padding: 6px 25px;
	margin-bottom:8px;
	background-color: #354686;;
	border-radius: 4px;
	color: white;
	cursor: pointer;
}


</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div id="search-map">
			<div class="current-map">
				<span class="input-group-btn"> <a class="btn btn-primary"
					id="gps" type="button" href="${contextPath}/gps/list">현재위치 
				</a>
				</span>
				<form class="input-group" id="input-search"
					action="${contextPath}/gps/searchView" method="POST">
					<input type="search" class="form-control"
						aria-describedby="button-addon" name="searchGps" id="searchGps"
						placeholder="예시)서울특별시 노원구 ">
					<button class="btn" type="submit" id="button-addon">검색</button>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>