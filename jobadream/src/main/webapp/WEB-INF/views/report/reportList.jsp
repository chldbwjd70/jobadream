<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<style>
.report-list-title {
	font-family: 'Pretendard-Regular';
	background: linear-gradient(to right top, #4160c8c0, #3eaee6d0);
	color: transparent;
	-webkit-background-clip: text;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 40px;
}

.reportTitleA:link {
  color : black;
  text-decoration: none;
}
.reportTitleA:visited {
  color :  #8c59b9;
  text-decoration: none;
}


.table {
	text-align: center;
}

#report-table-btn {
	border-radius: 4px;
	background-color: #3eafe6;
	border:#3eafe6;
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

#reportSearch{
	background-color: #3eafe6;
	border:#3eafe6;
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<h2 class="report-list-title" style="font-weight: bold;">신고하기</h2>
		<div class="list-detaiil shadow p-3 mb-5 bg-white rounded p-5">
			<div class="row">
				<div class="col-md-12">
					<br>
					<table class="table table-hover mt-4">
						<thead>
							<tr>
								<th>번호</th>
								<th>카테고리</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>

						<%-- 검색 상태 유지를 위한 쿼리스트링용 변수 선언 --%>
						<c:if test="${!empty param.sk}">
							<!-- ct가 파라미터에 있다면 -->
							<c:if test="${!empty paramValues.ct }">
								<c:forEach items="${paramValues.ct }" var="code">
									<c:set var="category" value="${category}&ct=${code}" />
								</c:forEach>
							</c:if>

							<c:if test="${ !empty param.sv &&  param.sv != '' }">
								<c:set var="searchValue" value="&sv=${param.sv}" />
							</c:if>
							<c:set var="searchStr"
								value="${category}&sk=${param.sk}${searchValue}" />
						</c:if>

						<%-- 게시글 목록 --%>
						<tbody>
							<c:choose>
								<c:when test="${empty reportList}">
									<tr>
										<td colspan="6">게시글이 존재하지 않습니다.</td>
									</tr>
								</c:when>
								<%-- 조회된 게시글 목록이 있을 경우 --%>
								<c:otherwise>
									<c:forEach items="${reportList}" var="re">
										<tr>
											<%-- 글 번호 --%>
											<td>${re.reportNo }</td>
											<%-- 카테고리 --%>
											<td>${re.rcategory.reportCategoryTitle }</td>
											<%-- 글제목 --%>
											<td class="reportTitle"><a class="reportTitleA"
												href="${re.reportNo}?cp=${pagination.currentPage}${searchStr}">
													${re.reportTitle} </a></td>
											<%-- 작성자 --%>
											<td>${re.mem.memberId}</td>
											<%-- 작성일 --%>
											<td><fmt:formatDate var="reportDt"
													value="${re.reportDt}" pattern="yyyy-MM-dd" /> <fmt:formatDate
													var="today" value="<%=new java.util.Date()%>"
													pattern="yyyy-MM-dd" /> <c:choose>
													<%-- 글 작성일이 오늘이 아닐 경우 --%>
													<c:when test="${reportDt != today}">
													${reportDt}
												</c:when>

													<%-- 글 작성일이 오늘일 경우 --%>
													<c:otherwise>
														<fmt:formatDate value="${re.reportDt}" pattern="HH:mm" />
													</c:otherwise>
												</c:choose></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>

			</div>
			<br>
			<%-- 회원일경우에만 글쓰기 버튼 노출 --%>
			<c:if test="${!empty loginMember}">
				<a class="btn btn-primary float-right" id="report-table-btn"
					href='insert'>글쓰기</a>
			</c:if>
			<br>
			
			<style>
				.pg.pagination *{
					border: 0px;
					background-color: white;
					font-weight: bold;
					font-size: 20px;
					color : black;
					
				}

				.pg.pagination > .active  > *{
					background-color: white;
					color: #3eafe6;
					font-size: 22px;
				}
					
				</style>
			<%---------------------- Pagination start----------------------%>

			<c:set var="pageURL" value="list" />

			<c:set var="prev"
				value="${pageURL}?cp=${pagination.prevPage}${searchStr}" />
			<c:set var="next"
				value="${pageURL}?cp=${pagination.nextPage}${searchStr}" />


			<div class="my-5">
				<ul class="pagination pg">

					<%-- 현재 페이지가 10페이지 초과인 경우 --%>
					<c:if test="${pagination.currentPage > pagination.pageSize}">
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
					<c:if test="${pagination.currentPage < pagination.maxPage }">
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
			<!-- 검색창 -->
			<div class="my-5">
				<form action="list" method="GET" class="text-center" id="searchForm">

					<span> 카테고리(다중 선택 가능)<br> 
					<label for="board">게시판</label><input type="checkbox" name="ct" value="1" id="board">&nbsp; 
					<label for="chat">채팅</label> <input type="checkbox" name="ct" value="2" id="chat"> &nbsp; 
					<label for="deal">거래</label> <input type="checkbox" name="ct" value="3" id="deal"> &nbsp;
					</span>

					<select name="sk" class="form-control"
						style="width: 100px; display: inline-block;">
						<option value="title">글제목</option>
						<option value="content">내용</option>
						<option value="titcont">제목+내용</option>
					</select> <input type="text" name="sv" class="form-control"
						style="width: 25%; display: inline-block;">
					<button class="form-control btn btn-primary" id="reportSearch"
						style="width: 100px; display: inline-block;">검색</button>
				</form>
			</div>
		</div>



	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script>
			(function(){
				var searchKey = "${param.sk}"; 
				var searchValue = "${param.sv}";
				
				$("select[name=sk] > option").each(function(index, item){
								// content            content
					if( $(item).val() == searchKey  ){
						$(item).prop("selected", true);
					}
				});		
				
				$("input[name=sv]").val(searchValue);
				
				
		
				<c:forEach  items="${paramValues.ct}"  var="code" >
					
					$.each( $("[name='ct']") ,  function(){
						
						if( $(this).val() == "${code}"    ){
							
							$(this).prop("checked", true);
						}
						
					})
				
				</c:forEach>
				
				
			})();
			
	</script>
</body>
</html>