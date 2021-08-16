<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충전 내역</title>
<jsp:include page="../../common/header.jsp" />
<!-- import -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>

#title1 {
	font-family: 'Pretendard-Regular';
	background: linear-gradient(to right top, #4160c8c0, #3eaee6d0);
	color: transparent;
	-webkit-background-clip: text;
}

.text1 {
	font-weight: bold;
}

.text2 {
	font-size: 20px;
}

.text3 {
	color: white;
}

.text4 {
	font-size: 25px;
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

.btn-color2 {
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

.style2 {
	background-color: #D9EDF7;
	text-align: center;
}

.tr {
	text-align: center;
}

.nav-item a {
	color: black !important;
}

.nav-item .active {
	color: #4161c8 !important;
}

#pg {
	justify-content: center;
}

#pg.pagination *{
	border: 0px;
	background-color: white;
	font-weight: bold;
	font-size: 20px;
	color : black;

}

#pg.pagination > .active  > *{
	background-color: white;
	color: #3eafe6;
	font-size: 22px;
}



</style>
</head>
<body>
	<div class="container">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<br>
					<h1 class="text1" id="title1">충전 내역</h1>
					<br>
				</div>
			</div>
			<ul class="nav nav-tabs">
				<li class="nav-item col-md-4"><a
					class="nav-link  text-center text1 text2" href="pointSell">포인트
						결제</a></li>
				<li class="nav-item col-md-4"><a
					class="nav-link text-center text1 text2" href="usageHistory">이용
						내역</a></li>
				<li class="nav-item col-md-4"><a
					class="nav-link active text-center text1 text2" href="sellHistory">충전 내역</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active ">
					<form method="POST" action="sellHistory" name="sellHistory"
						onsubmit="return ss();" class="form-horizontal" role="form">
						<div class="style1">
							<br>
							<br>
							<br>
							<div class="row">
								<div class="col-md-1"></div>
								<div class="col-md-10">
									<table class="table table-hover">
										<thead class="style2">
											<tr class="td ">
												<th class="col-md-7">포인트</th>
												<th class="col-md-5">날짜</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<%-- 조회된 게시글 목록이 없는 경우 --%>
												<c:when test="${empty pointList}">
													<tr class="tr">
														<td colspan="2">충전하신 내역이 없습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
														<c:forEach items="${pointList}" var="import2">
														<tr class="tr">
															<td class="col-md-7">${import2.importMoney}</td>
															<td class="col-md-5"><fmt:formatDate
																	var="createDate" value="${import2.importDt}"
																	pattern="yyyy-MM-dd" /> <fmt:formatDate var="today"
																	value="<%=new java.util.Date()%>" pattern="yyyy-MM-dd" />
																<c:choose>
																	<c:when test="${createDate != today}">
																				${createDate}
																			</c:when>
																	<c:otherwise>
																		<fmt:formatDate value="${import2.importDt}"
																			pattern="HH:mm" />
																	</c:otherwise>
																</c:choose></td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>

										</tbody>
									</table>
									<%---------------------- pagination3 start----------------------%>
									<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>

									<c:set var="pageURL" value="sellHistory" />

									<c:set var="prev"
										value="${pageURL}?cp=${pagination3.prevPage}${searchStr}" />
									<c:set var="next"
										value="${pageURL}?cp=${pagination3.nextPage}${searchStr}" />


									<div class="my-5">
										<ul class="pagination" id="pg">

											<%-- 현재 페이지가 10페이지 초과인 경우 --%>
											<c:if test="${pagination3.currentPage > pagination3.pageSize}">
												<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
											</c:if>

											<%-- 현재 페이지가 2페이지 초과인 경우 --%>
											<c:if test="${pagination3.currentPage > 2 }">
												<li ><a class="page-link " id="pagecss"
													href="${pageURL}?cp=${pagination3.currentPage - 1}${searchStr}">&lt;</a></li>
											</c:if>
											<%-- 페이지 목록 --%>
											<c:forEach var="p" begin="${pagination3.startPage}"
												end="${pagination3.endPage}">

												<c:choose>
													<c:when test="${p == pagination3.currentPage }">
														<li class="page-item active"><a class="page-link">${p}</a></li>
													</c:when>

													<c:otherwise>
														<li><a class="page-link"
															href="${pageURL}?cp=${p}${searchStr}">${p}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>

											<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
											<c:if test="${pagination3.currentPage < pagination3.maxPage }">
												<li><a class="page-link"
													href="${pageURL}?cp=${pagination3.currentPage + 1}${searchStr}">&gt;</a></li>
											</c:if>

											<%-- 현재 페이지가 마지막 페이지가 아닌 경우 --%>
											<c:if
												test="${pagination3.currentPage - pagination3.maxPage + pagination3.pageSize < 0}">
												<li><a class="page-link" href="${next}">&gt;&gt;</a></li>
											</c:if>

										</ul>
									</div>
									<%---------------------- pagination3 end----------------------%>
								</div>
								<div class="col-md-1"></div>
							</div>
							<br>
							<br>
							<br>
						</div>
						<br>
						<div class="row">
							<div class="col-md-10">
								<a href="myPage">
									<button type="button" class="btn float-left btn-lg btn-color2">
										<label class="text3"> < 목록으로</label>
									</button>
								</a>
							</div>
							<div class="col-md-2"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>