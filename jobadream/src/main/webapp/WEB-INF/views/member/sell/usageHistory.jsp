<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이용 내역</title>
<jsp:include page="../../common/header.jsp" />

<style>
.pointHover:hover{
	cursor: pointer;
}


.modal:before {
	display: inline-block;
	vertical-align: middle;
	content: " ";
	height: 25%;
}

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

.pg {
	justify-content: center;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
#moneycss{
	color: red;
	font-weight: bold;
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
					class="nav-link active text-center text1 text2" href="usageHistory">이용 내역</a></li>
				<li class="nav-item col-md-4"><a
					class="nav-link  text-center text1 text2" href="sellHistory">결제
						내역</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active ">
					<div class="style1">
						<br> <br> <br> <br> <br>
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
									<div class="col-md-1"></div>
									<div class="col-md-10">
										<table class="table table-hover">
											<thead class="style2">
												<tr class="tr">
													<th>이름</th>
													<th>구분</th>
													<th>포인트</th>
													<th>제목</th>
													<th>날짜</th>
													<th>진행</th>
												</tr>
											</thead>
											<tbody>
												<input type="hidden" id="b" value="">
												<input type="hidden" id="cc" value="">
												<input type="hidden" id="pp" value="">
												<c:choose>
													<c:when test="${empty ajumList}">
														<tr class="tr">
															<td colspan="6">job아준적이 없습니다.</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach items="${ajumList}" var="board" >
															<div>
																<tr class="tr">
																	<c:choose>
																		<c:when test="${empty board.memberName}">
																			<td>미지원</td>
																		</c:when>
																		<c:otherwise>
																			<td>${board.memberName}</td>
																		</c:otherwise>
																	</c:choose>
																	<c:if test="${fn:contains(board.categoryCode, '1')}">
																		<td>가게알바</td>
																	</c:if>
																	<c:if test="${fn:contains(board.categoryCode, '2')}">
																		<td>돌봄/산책</td>
																	</c:if>
																	<c:if test="${fn:contains(board.categoryCode, '3')}">
																		<td>청소/심부름</td>
																	</c:if>
																	<c:if test="${fn:contains(board.categoryCode, '4')}">
																		<td>배달알바</td>
																	</c:if>
																	<c:if test="${fn:contains(board.categoryCode, '5')}">
																		<td>기타</td>
																	</c:if>
																	<td>${board.boardPay}</td>
																	<td class="pointHover" onClick="titleClick(${board.categoryCode},${board.boardNo})">${board.boardTitle}</td>
																	<td><fmt:formatDate var="createDate"
																			value="${board.createDate}" pattern="yyyy-MM-dd" />
																		<fmt:formatDate var="today"
																			value="<%=new java.util.Date()%>"
																			pattern="yyyy-MM-dd" /> <c:choose>
																			<c:when test="${createDate != today}">
																				${createDate}
																			</c:when>
																			<c:otherwise>
																				<fmt:formatDate value="${board.createDate}"
																					pattern="HH:mm" />
																			</c:otherwise>
																		</c:choose></td>
																	<c:if test="${board.boardStatus eq 'Y' }">
																		<td>대기</td>
																	</c:if>
																	<c:if test="${board.progressStatus eq 'Y' }">
																		<td>진행완료</td>
																	</c:if>
																	<c:if test="${board.progressStatus eq 'N' }">
																		<c:if test ="${board.boardPay gt loginMember.memberPoint}">
																			<td><label id="moneycss">포인트 부족</label></td>
																		</c:if>
																		<c:if test ="${board.boardPay lt loginMember.memberPoint}">
																			<td><a id="modal-400265" href="#modal-container-33" role="button" class="btn btn-sm btn-color1"
																			 data-toggle="modal" onclick="a(${board.boardNo} , ${board.memberNo}, ${board.memberPoint});">진행완료</a></td>
																		</c:if>
																		<input type="hidden" id="jobboardNo"
																			value="${board.boardNo}">
																		<input type="hidden" id="jobboardNo2"
																			value="${board.memberNo}">
																		<input type="hidden" id="jobboardNo3"
																			value="${board.memberPoint}">
																	</c:if>
																</tr>
															</div>
															<!-- 모달 -->
															<div class="modal fade" id="modal-container-33"
																role="dialog" aria-labelledby="myModalLabel"
																aria-hidden="true">
																<div class="modal-dialog " role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" id="myModalLabel">
																				<img
																					src="${contextPath}/resources/images/main/logo.png">
																			</h5>
																			<button type="button" class="close"
																				data-dismiss="modal">
																				<span aria-hidden="true">×</span>
																			</button>
																		</div>
																		<br>
																		<h5 class="text1 text-center">상대의 점수는?</h5>
																		<h6 class=" text-center">0부터 9사이의 한자리 정수만 입력해주세요.</h6>
																		<form id="ration_form" >
																			<div class="modal-body">
																				<div class="row">
																					<div class="col-md-1"></div>
																					<div class="col-md-10">
																						<input type="number" class="form-control"
																							name="rating" id="rating" maxlength="12"
																							autocomplete="off">
																					</div>
																					<div class="col-md-1"></div>
																				</div>
																				<br>
																				<div class="col-md-12">
																					<button type="button"
																						class="btn btn-sm btn-color2 btn-block"
																						onclick="jobbtn();">
																						<label class="text3"> 등록</label>
																					</button>
																				</div>
																			</div>
																		</form>
																	</div>
																</div>
															</div>
															<script>
																function a(xx, cdc, dwd) {
																	console.log(xx);
																	$("#b").val(xx);
																	console.log("som"+$("#b").val());
																	
																	console.log(cdc);
																	$("#cc").val(cdc);
																	console.log("sdom : "+$("#cc").val());
																	
																	console.log(dwd);
																	$("#pp").val(dwd);
																	console.log("sdddom : "+$("#pp").val());
																}
																
															function jobbtn() {
													
																console.log($(this).parent().children('#jobboardNo').val());
																console.log($(this).parent().children('#jobboardNo2').val());
																console.log($(this).parent().children('#jobboardNo3').val());
																
																const regExp = /^[0-9]{1}$/;
																const rating = $("#rating").val().trim();
																const boardNo = $("#b").val();
																const memberNo2 = $("#cc").val();
																const memberPoint = $("#pp").val();
													
																if (regExp.test(rating)) {
																	console.log(rating);
																	swal({
																		title : "점수 등록 완료",
																		text : "이용해주셔서 감사합니다.",
																		icon : "success",
																		closeOnClickOutside : false
																	}).then(function(){
																		document.location.reload(true);
																	});
																	$('#modal-container-33').modal("hide");
																	$.ajax({
																		type : "POST",
																		url : "${contextPath}/avgPoint",
																		data : {
																			"rating" : rating,
																			"boardNo" : boardNo,
																			"memberNo2" : memberNo2,
																			"memberPoint" : memberPoint
																		}
																	})
																	
																} else {
																	console.log(rating);
																	swal({
																		title : "점수 등록 실패",
																		text : "0부터 9사이의 한자리 정수만 입력해주세요.",
																		icon : "error",
																	});
																}
															};
														</script>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
										<%---------------------- Pagination start----------------------%>
										<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>

										<c:set var="pageURL" value="usageHistory" />

										<c:set var="prev"
											value="${pageURL}?jp=${pagination.prevPage}${searchStr}" />
										<c:set var="next"
											value="${pageURL}?jp=${pagination.nextPage}${searchStr}" />


										<div class="my-5">
											<ul class="pagination pg">

												<%-- 현재 페이지가 10페이지 초과인 경우 --%>
												<c:if test="${pagination.currentPage > pagination.pageSize}">
													<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
												</c:if>

												<%-- 현재 페이지가 2페이지 초과인 경우 --%>
												<c:if test="${pagination.currentPage > 2 }">
													<li><a class="page-link"
														href="${pageURL}?jp=${pagination.currentPage - 1}${searchStr}">&lt;</a></li>
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
																href="${pageURL}?jp=${p}${searchStr}">${p}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>

												<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
												<c:if test="${pagination.currentPage < pagination.maxPage }">
													<li><a class="page-link"
														href="${pageURL}?jp=${pagination.currentPage + 1}${searchStr}">&gt;</a></li>
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
									<div class="col-md-1"></div>
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
									<div class="col-md-1"></div>
									<div class="col-md-10">
										<table class="table table-hover">
											<thead class="style2">
												<tr class="tr">
													<th>이름</th>
													<th>구분</th>
													<th>포인트</th>
													<th>제목</th>
													<th>날짜</th>
													<th>진행</th>

												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${empty agamList }">
														<tr class="tr">
															<td colspan="6">job아간적이 없습니다.</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach items="${agamList}" var="board">
															<tr class="tr">
																<td>${board.memberName}</td>
																<c:if test="${fn:contains(board.categoryCode, '1')}">
																	<td>가게알바</td>
																</c:if>
																<c:if test="${fn:contains(board.categoryCode, '2')}">
																	<td>돌봄/산책</td>
																</c:if>
																<c:if test="${fn:contains(board.categoryCode, '3')}">
																	<td>청소/심부름</td>
																</c:if>
																<c:if test="${fn:contains(board.categoryCode, '4')}">
																	<td>배달알바</td>
																</c:if>
																<c:if test="${fn:contains(board.categoryCode, '5')}">
																	<td>기타</td>
																</c:if>
																<td>${board.boardPay}</td>
																<td class="pointHover" onClick="titleClick(${board.categoryCode},${board.boardNo})">${board.boardTitle}</td>
																<td><fmt:formatDate var="createDate"
																		value="${board.createDate}" pattern="yyyy-MM-dd" /> <fmt:formatDate
																		var="today" value="<%=new java.util.Date()%>"
																		pattern="yyyy-MM-dd" /> <c:choose>
																		<c:when test="${createDate != today}">
																			${createDate}
																		</c:when>
																		<c:otherwise>
																			<fmt:formatDate value="${board.createDate}"
																				pattern="HH:mm" />
																		</c:otherwise>
																	</c:choose></td>
																<c:if test="${board.progressStatus eq 'Y' }">
																	<td>진행완료</td>
																</c:if>
																<c:if test="${board.progressStatus eq 'N' }">
																	<td>진행 중</td>
																</c:if>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
										<%---------------------- pagination2 start----------------------%>
										<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>

										<c:set var="pageURL" value="usageHistory" />

										<c:set var="prev"
											value="${pageURL}?cp=${pagination2.prevPage}" />
										<c:set var="next"
											value="${pageURL}?cp=${pagination2.nextPage}" />


										<div class="my-5">
											<ul class="pagination pg">

												<%-- 현재 페이지가 5페이지 초과인 경우 --%>
												<c:if
													test="${pagination2.currentPage > pagination2.pageSize }">
													<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
												</c:if>

												<%-- 현재 페이지가 2페이지 초과인 경우 --%>
												<c:if test="${pagination2.currentPage > 2 }">
													<li><a class="page-link"
														href="${pageURL}?cp=${pagination2.currentPage - 1}">&lt;</a></li>
												</c:if>



												<%-- 페이지 목록 --%>
												<c:forEach var="p2" begin="${pagination2.startPage}"
													end="${pagination2.endPage}">

													<c:choose>
														<c:when test="${p2 == pagination2.currentPage }">
															<li class="page-item active"><a class="page-link">${p2}</a></li>
														</c:when>

														<c:otherwise>
															<li><a class="page-link"
																href="${pageURL}?cp=${p2}${searchStr}">${p2}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>

												<%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
												<c:if
													test="${pagination2.currentPage < pagination2.maxPage }">
													<li><a class="page-link"
														href="${pageURL}?cp=${pagination2.currentPage + 1}">&gt;</a></li>
												</c:if>

												<%-- 현재 페이지가 마지막 페이지가 아닌 경우 --%>
												<c:if
													test="${pagination2.currentPage - pagination2.maxPage + pagination2.pageSize < 0}">
													<li><a class="page-link" href="${next}">&gt;&gt;</a></li>
												</c:if>

											</ul>
										</div>
										<%---------------------- pagination end----------------------%>
									</div>
									<div class="col-md-1"></div>
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
				</div>
			</div>
		</div>
	</div>
	<script>
    	function titleClick(categoryCode, boardNo){
    		console.log(boardNo);
    		const addr = "${contextPath}/board/"+categoryCode+"/"+boardNo+ "?cpage=${pagination.currentPage}${searchStr}";
    		console.log(addr);
    			location.href = addr;
    	}
    </script>
	<jsp:include page="../../common/footer.jsp" />
</body>

</html>