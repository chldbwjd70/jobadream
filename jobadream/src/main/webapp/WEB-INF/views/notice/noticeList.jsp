<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<style>
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
		<h2 class="list-title" style="font-weight: bold;">공지사항</h2>
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
						<%-- 검색 상태 유지를 위한 쿼리스트링용 변수 선언 --%>
						<c:if test="${!empty param.sk}">
							<!-- sv가 파라미터에 있다면 -->
							<c:if test="${ !empty param.sv &&  param.sv != '' }">
								<c:set var="searchValue" value="&sv=${param.sv}" />
							</c:if>
							<c:set var="searchStr" value="&sk=${param.sk}${searchValue}" />
						</c:if>
						<%-- 게시글 목록 --%>
						<tbody>
							<c:choose>
								<%-- 조회된 게시글 목록이 없는 경우 --%>
								<c:when test="${empty noticeList}">
									<tr>
										<td colspan="6">게시글이 존재하지 않습니다.</td>
									</tr>
								</c:when>
								<%-- 조회된 게시글 목록이 있을 경우 --%>
								<c:otherwise>
									<c:forEach items="${noticeList}" var="notice">
										<tr>
											<%-- 글 번호 --%>
											<td>${notice.noticeNo }</td>
											<%-- 글제목 --%>
											<td class="boardTitle"><a
												href="${notice.noticeNo}?cp=${pagination.currentPage}${searchStr}">
													${notice.noticeTitle} </a></td>
											<%-- 작성자 --%>
											<td>${notice.mem.memberId}</td>
											<%-- 작성일 --%>
											<td><fmt:formatDate var="createDate"
													value="${notice.createDt}" pattern="yyyy-MM-dd" /> <fmt:formatDate
													var="today" value="<%=new java.util.Date()%>"
													pattern="yyyy-MM-dd" /> <c:choose>
													<%-- 글 작성일이 오늘이 아닐 경우 --%>
													<c:when test="${createDt != today}">
													${createDate}
												</c:when>

													<%-- 글 작성일이 오늘일 경우 --%>
													<c:otherwise>
														<fmt:formatDate value="${notice.createDt}" pattern="HH:mm" />
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
			<%-- 관리자일 경우에만 글쓰기 버튼 노출 --%>
			<c:if test="${loginMember.memberGrade == 'A' }">
				<a class="btn btn-primary float-right" id="request-table-btn"
					href='insert'>글쓰기</a>
			</c:if>
			<br>
			<%---------------------- Pagination start----------------------%>
			<%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>

			<c:set var="pageURL" value="noticeList" />

			<c:set var="prev"
				value="${pageURL}?cp=${pagination.prevPage}${searchStr}" />
			<c:set var="next"
				value="${pageURL}?cp=${pagination.nextPage}${searchStr}" />


			<div class="my-5">
				<ul class="pagination">

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
				<form action="noticeList" method="GET" class="text-center"
					id="searchForm">
					<select name="sk" class="form-control"
						style="width: 100px; display: inline-block;">
						<option value="title">글제목</option>
						<option value="content">내용</option>
						<option value="titcont">제목+내용</option>
						<option value="writer">작성자</option>
					</select> <input type="text" name="sv" class="form-control"
						style="width: 25%; display: inline-block;">
					<button class="form-control btn btn-primary"
						style="width: 100px; display: inline-block;">검색</button>
				</form>
			</div>




		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>