<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이용 내역</title>
<jsp:include page="../../common/header.jsp" />

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

.td {
	text-align: center;
}

.nav-item a {
	color: black !important;
}

.nav-item .active {
	color: #4161c8 !important;
}

.pg {
	justify-content: center;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}


</style>
</head>

<body>
	<div class="container">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<br>
					<h1 class="text1" id="title1">이용 내역</h1>
					<br>
				</div>
			</div>
			<ul class="nav nav-tabs">
				<li class="nav-item col-md-4"><a
					class="nav-link text-center text1 text2" href="pointSell">포인트
						결제</a></li>
				<li class="nav-item col-md-4"><a
					class="nav-link active text-center text1 text2" href="usageHistory">이용
						내역</a></li>
				<li class="nav-item col-md-4"><a
					class="nav-link  text-center text1 text2" href="sellHistory">결제
						내역</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active ">
					<form method="POST" action="usageHistory" name="usageHistory"
						onsubmit="return ss();" class="form-horizontal" role="form">
						<div class="style1">
							<br>
							<br>
							<br>
							<br>
							<br>
							<div class="row">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-1"></div>
										<div class="col-md-10">
											<h3 class=" text1 text4">job아줌</h3>
										</div>
										<div class="col-md-1"></div>
									</div>
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-8">
											<table class="table table-hover">
												<thead class="style2">
													<tr class="td">
														<th>아이디</th>
														<th>포인트</th>
														<th>제목</th>
														<th>날짜</th>
														<th></th>

													</tr>
												</thead>
												<tbody>
													<c:choose>
														<c:when test="${empty jobBordList }">
															<tr class="td">
																<td colspan="5">job아준적이 없습니다.</td>
															</tr>
														</c:when>
														<c:otherwise>
															<c:forEach items="${jobBordList}" var="borad">
																<tr class="td">
																	<td><a id="modal-400265"
																		href="#modal-container-33" role="button" class="btn "
																		data-toggle="modal">user01</a></td>
																	<td>1000</td>
																	<td>내용입니다</td>
																	<td>21-07-23</td>
																	<c:if test="PROGRESS_STATUS = n">
																		<td>
																			진행완료
																		</td>
																	</c:if>
																	<c:if test="PROGRESS_STATUS = y">
																		<td>
																			<a id="modal-400265" href="#modal-container-33" 
																			role="button" class="btn btn-sm btn-color1">진행완료</a>
																		</td>
																	</c:if>
																	
																</tr>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>
											<%---------------------- Pagination start----------------------%>
											<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>

											<c:set var="pageURL" value="list" />

											<c:set var="prev"
												value="${pageURL}?cp=${pagination.prevPage}${searchStr}" />
											<c:set var="next"
												value="${pageURL}?cp=${pagination.nextPage}${searchStr}" />


											<div class="my-5">
												<ul class="pagination pg">

													<%-- 현재 페이지가 10페이지 초과인 경우 --%>
													<c:if
														test="${pagination.currentPage > pagination.pageSize }">
														<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
													</c:if>

													<%-- 현재 페이지가 2페이지 초과인 경우 --%>
													<c:if test="${pagination.currentPage > 2 }">
														<li><a class="page-link"
															href="${pageURL}?cp=${pagination.currentPage - 1}${searchStr}">&lt;</a></li>
													</c:if>



													<%-- 페이지 목록 --%>
													<c:forEach var="p" begin="${pagination.startPage}"
														end="${pagination.endPage}">

														<c:choose>
															<c:when test="${p == pagination.currentPage }">
																<li class="page-item active"><a class="page-link">${p}</a></li>
															</c:when>

															<c:otherwise>
																<li><a class="page-link"
																	href="${pageURL}?cp=${p}${searchStr}">${p}</a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>

													<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
													<c:if
														test="${pagination.currentPage < pagination.maxPage }">
														<li><a class="page-link"
															href="${pageURL}?cp=${pagination.currentPage + 1}${searchStr}">&gt;</a></li>
													</c:if>

													<%-- 현재 페이지가 마지막 페이지가 아닌 경우 --%>
													<c:if
														test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
														<li><a class="page-link" href="${next}">&gt;&gt;</a></li>
													</c:if>

												</ul>
											</div>
											<%---------------------- Pagination end----------------------%>
										</div>
										<div class="col-md-2"></div>
									</div>
								</div>
							</div>
							<br> <br>
							<!-- ************************************************************************************************************ -->
							<div class="row">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-1"></div>
										<div class="col-md-10">
											<h3 class=" text1 text4">job아감</h3>
										</div>
										<div class="col-md-1"></div>
									</div>
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-8">
											<table class="table table-hover">
												<thead class="style2">
													<tr class="td">
														<th>아이디</th>
														<th>포인트</th>
														<th>제목</th>
														<th>날짜</th>
														<th></th>

													</tr>
												</thead>
												<tbody>
													<c:choose>
														<c:when test="${empty jobBordList }">
															<tr class="td">
																<td colspan="5">job아간적이 없습니다.</td>
															</tr>
														</c:when>
														<c:otherwise>
															<c:forEach items="${jobBordList}" var="borad">
																<tr class="td">
																	<td>user01</td>
																	<td>1000</td>
																	<td>내용입니다</td>
																	<td>21-07-23</td>
																	<c:if test="PROGRESS_STATUS = n">
																		<td>
																			진행완료
																		</td>
																	</c:if>
																	<c:if test="PROGRESS_STATUS = y">
																		<td>
																			진행 중
																		</td>
																	</c:if>
																</tr>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>
											<%---------------------- Pagination start----------------------%>
											<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>

											<c:set var="pageURL" value="list" />

											<c:set var="prev"
												value="${pageURL}?cp=${pagination.prevPage}${searchStr}" />
											<c:set var="next"
												value="${pageURL}?cp=${pagination.nextPage}${searchStr}" />


											<div class="my-5">
												<ul class="pagination pg">

													<%-- 현재 페이지가 10페이지 초과인 경우 --%>
													<c:if
														test="${pagination.currentPage > pagination.pageSize }">
														<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
													</c:if>

													<%-- 현재 페이지가 2페이지 초과인 경우 --%>
													<c:if test="${pagination.currentPage > 2 }">
														<li><a class="page-link"
															href="${pageURL}?cp=${pagination.currentPage - 1}${searchStr}">&lt;</a></li>
													</c:if>



													<%-- 페이지 목록 --%>
													<c:forEach var="p" begin="${pagination.startPage}"
														end="${pagination.endPage}">

														<c:choose>
															<c:when test="${p == pagination.currentPage }">
																<li class="page-item active"><a class="page-link">${p}</a></li>
															</c:when>

															<c:otherwise>
																<li><a class="page-link"
																	href="${pageURL}?cp=${p}${searchStr}">${p}</a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>

													<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
													<c:if
														test="${pagination.currentPage < pagination.maxPage }">
														<li><a class="page-link"
															href="${pageURL}?cp=${pagination.currentPage + 1}${searchStr}">&gt;</a></li>
													</c:if>

													<%-- 현재 페이지가 마지막 페이지가 아닌 경우 --%>
													<c:if
														test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
														<li><a class="page-link" href="${next}">&gt;&gt;</a></li>
													</c:if>

												</ul>
											</div>
											<%---------------------- Pagination end----------------------%>
										</div>
										<div class="col-md-2"></div>
									</div>
								</div>
							</div>
							<br> <br> <br> <br> <br>
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

			<!-- 모달 -->
			<div class="modal fade" id="modal-container-33" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog " role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<br>
						<h5 class="text1 text-center">상대의 평점은?</h5>
						<br>
						<form id="ration_form">
							<div class="modal-body">
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-10">
										<input type="number" class="form-control" name="rating"
											id="rating" maxlength="12" autocomplete="off">
									</div>
									<div class="col-md-1"></div>
								</div>
								<br>
								<div class="col-md-12">
									<button type="button" class="btn btn-sm btn-color2 btn-block"
										onclick="jobbtn();">
										<label class="text3"> 등록</label>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function jobbtn() {

			const regExp = /^[0-9]{1}$/;
			const rating = $("#rating").val().trim();

			if (regExp.test(rating)) {
				console.log(rating);
				swal({
					title : "평점 등록 완료",
					text : "이용해주셔서 감사합니다.",
					icon : "success",
				});
				$('#modal-container-33').modal("hide");
			} else {
				console.log(rating);
				swal({
					title : "평점 등록 실패",
					text : "0이상의 숫자를 입력하세요.",
					icon : "error",
				});
			}
		};
	</script>
	<jsp:include page="../../common/footer.jsp" />
</body>

</html>