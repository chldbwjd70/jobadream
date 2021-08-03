<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<style>
body {
	font-family: 'NanumSquare', sans-serif;
}

.container {
	width: 1200px;
}

.list-title {
	color: #3eafe6;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 40px;
}

.table {
	text-align: center;
}

#request-table-btn {
	border-radius: 4px;
	background-color: #4161c8;
}

.pagination {
	justify-content: center;
}

#searchForm {
	position: relative;
}

#searchForm>* {
	top: 0;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<h2 class="list-title" style="font-weight: bold;">신고하기</h2>
		<form>
			<div class="list-detaiil shadow p-3 mb-5 bg-white rounded p-5">
				<div class="row">
					<div class="col-md-12">
						<br>
						<table class="table table-hover mt-4">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>TB - Monthly</td>
									<td>훈이</td>
									<td>Default</td>
								</tr>
								<tr class="table">
									<td>1</td>
									<td>TB - Monthly</td>
									<td>훈이</td>
									<td>Approved</td>
								</tr>
								<tr class="table">
									<td>2</td>
									<td>TB - Monthly</td>
									<td>훈이</td>
									<td>Declined</td>
								</tr>
								<tr class="table">
									<td>3</td>
									<td>TB - Monthly</td>
									<td>훈이</td>
									<td>Pending</td>
								</tr>
								<tr class="table">
									<td>4</td>
									<td>TB - Monthly</td>
									<td>훈이</td>
									<td>Call in to confirm</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-12">

						<button type="button" style="float: right" class="btn btn-primary"
							id="request-table-btn">글 작성하기</button>
					</div>
				</div>
				<br>
				
				
		<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>