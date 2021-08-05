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

/*  ---------------------------------------------------------------- */
.pagination {
	position: relative;
	display: flex;
	flex-direction: row;
	--ddim: 10px;
	--rd: 15px;
	--rdim: calc(var(--rd)*2);
	--pm: #354686;
}

.pgpp {
	content: '';
	margin: 0 10px;
	height: var(--ddim);
	width: var(--ddim);
	background: #3eafe6;
	cursor: pointer;
}

.rpgpp {
	content: '';
	margin: 0 10px;
	height: var(--ddim);
	width: var(--ddim);
	border: 1px solid #3eafe6;
	cursor: pointer;
}

.pgpp:first-child {margin-left: 0;}
.pgpp:last-child {margin-right: 0;}
.pgpp2 {display: none;}

.pacman {
	content: '';
	position: absolute;
	top: calc(-1*var(--ddim));
	left: calc(-1*var(--ddim)/2);
	height: var(--rdim);
	width: var(--rdim);
	transition: transform 250ms linear;
}

.pacman:before,
.pacman:after {
	content: '';
	position: absolute;
	height: var(--rd);
	width: var(--rdim);
	left: 0;
	background: var(--pm);
	transition: inherit;
}

.pacman:before {
	top: 0px;
	border-top-left-radius: var(--rdim);
	border-top-right-radius: var(--rdim);
	transform-origin: bottom center;
	transform: rotate(-45deg);
}

.pacman:after {
	bottom: 0px;
	border-bottom-left-radius: var(--rdim);
	border-bottom-right-radius: var(--rdim);
	transform-origin: top center;
	transform: rotate(45deg);
}

@keyframes waka {
	0% {}
	50% {transform: rotate(0);}
	100% {}
}

input[type="radio"]:hover ~ .pacman:before,
input[type="radio"]:hover ~ .pacman:after {
	animation: waka 500ms infinite;
}

input[id="dot-1"]:checked ~ .pacman {transform: translateX(var(--ddim));}
input[id="dot-2"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)));}
input[id="dot-3"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*2));}
input[id="dot-4"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*3));}
input[id="dot-5"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*4));}
input[id="dot-6"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*5));}
input[id="dot-7"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*6));}
input[id="dot-8"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*7));}

input[id="dot-12"]:checked ~ .pacman {transform: translateX(var(--ddim));}
input[id="dot-22"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)));}
input[id="dot-32"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*2));}
input[id="dot-42"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*3));}
input[id="dot-52"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*4));}
input[id="dot-62"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*5));}
input[id="dot-72"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*6));}
input[id="dot-82"]:checked ~ .pacman {transform: translateX(calc(var(--ddim) + var(--rdim)*7));}

#pgp{
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}
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
                <li class="nav-item col-md-4">
                    <a class="nav-link text-center text1 text2" href="pointSell">포인트 결제</a>
                </li>
                <li class="nav-item col-md-4">
                    <a class="nav-link active text-center text1 text2" href="usageHistory">이용 내역</a>
                </li>
                <li class="nav-item col-md-4">
                    <a class="nav-link  text-center text1 text2" href="sellHistory">결제 내역</a>
                </li>
            </ul>
			<div class="tab-content">
				<div class="tab-pane fade show active ">
					<form method="POST" action="usageHistory"  name="usageHistory"  onsubmit="return ss();" class="form-horizontal" role="form">
						<div class="style1">
							<br><br><br><br><br>
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
																<td>
																	<a id="modal-400265" href="#modal-container-33" role="button" class="btn " data-toggle="modal">user01</a>
																</td>
																<td>1000</td>
																<td>내용입니다</td>
																<td>21-07-23</td>
																<td>
																	<button type="submit" class="btn btn-sm btn-color1"> 진행 완료</button>
																</td>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
												</tbody>
											</table>
											<div id="pgp">
												<div class="pagination ">	
													<input class ="pgpp2" id="dot-1" type="radio" name="dots">	
													<label class ="rpgpp"  for="dot-1"></label>	
													<input class ="pgpp2"id="dot-2" type="radio" name="dots">
													<label class ="pgpp"  for="dot-2"></label>	
													<input class ="pgpp2"id="dot-3" type="radio" name="dots" checked="checked">
													<label class ="pgpp"  for="dot-3"></label>	
													<input class ="pgpp2"id="dot-4" type="radio" name="dots">
													<label class ="pgpp"  for="dot-4"></label>	
													<input class ="pgpp2"id="dot-5" type="radio" name="dots">
													<label class ="pgpp"  for="dot-5"></label>	
													<input class ="pgpp2"id="dot-6" type="radio" name="dots">
													<label class ="pgpp"  for="dot-6"></label>	
													<input class ="pgpp2"id="dot-7" type="radio" name="dots">
													<label class ="pgpp"  for="dot-7"></label>	
													<input class ="pgpp2"id="dot-8" type="radio" name="dots">
													<label class ="rpgpp"  for="dot-8"></label>
													<div class="pacman"></div>
												</div>
											</div>
										</div>
										<div class="col-md-2"></div>
									</div>
								</div>
							</div>
							<br> <br>
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
																<td>
																	<a id="modal-400265" href="#modal-container-33" role="button" class="btn " data-toggle="modal">user01</a>
																</td>
																<td>1000</td>
																<td>내용입니다</td>
																<td>21-07-23</td>
																<td>진행 완료</td>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
												</tbody>
											</table>
											<div id="pgp">
												<div class="pagination ">	
													<input class ="pgpp2" id="dot-12" type="radio" name="dots2" >	
													<label class ="rpgpp"  for="dot-12"></label>
													<input class ="pgpp2"id="dot-22" type="radio" name="dots2">
													<label class ="pgpp"  for="dot-22"></label>	
													<input class ="pgpp2"id="dot-32" type="radio" name="dots2" checked="checked">
													<label class ="pgpp"  for="dot-32"></label>	
													<input class ="pgpp2"id="dot-42" type="radio" name="dots2">
													<label class ="pgpp"  for="dot-42"></label>	
													<input class ="pgpp2"id="dot-52" type="radio" name="dots2">
													<label class ="pgpp"  for="dot-52"></label>	
													<input class ="pgpp2"id="dot-62" type="radio" name="dots2">
													<label class ="pgpp"  for="dot-62"></label>	
													<input class ="pgpp2"id="dot-72" type="radio" name="dots2">
													<label class ="pgpp"  for="dot-72"></label>	
													<input class ="pgpp2"id="dot-82" type="radio" name="dots2">
													<label class ="rpgpp"  for="dot-82"></label>
													<div class="pacman"></div>
												</div>
											</div>
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