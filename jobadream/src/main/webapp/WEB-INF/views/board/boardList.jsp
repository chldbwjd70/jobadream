<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해주세요 게시글 목록</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<link rel="stylesheet" href="${contextPath}/resources/css/board/boardList.css" type="text/css"/>
    <div class="container">
        <div class="content">
            <ul class="nav justify-content-center nav-pills nav-fill" id="category">
                <li class="nav-item">
                    <a class="nav-link category-item" id="all-tab" href="${contextPath}/board/list" ">전체보기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link category-item" id="store-tab" href="${contextPath}/board/1/list" >가게알바</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link category-item" id="care-tab" href="${contextPath}/board/2/list" >돌봄/산책</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link category-item" id="clean-tab" href="${contextPath}/board/3/list" >청소/심부름</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link category-item" id="delivery-tab" href="${contextPath}/board/4/list">배달알바</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link category-item" id="etc-tab" href="${contextPath}/board/5/list" >기타</a>
                </li>
            </ul>
            <c:if test="${!empty pagination.categoryTitle}">
	            <div class="title">${pagination.categoryTitle}</div>
            </c:if>
             <c:if test="${empty pagination.categoryTitle}">
	            <div class="title">전체보기</div>
            </c:if>
            <div class="tab-content" id="myTabContent">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th class="col-1 tb-num">No.</th>
                        <th class="col-2 tb-title">카테고리</th>
                        <th class="col-2 tb-parti">아이디</th>
                        <th class="col-3">제목</th>
                        <th class="col-1 tb-title">구이름</th>
                        <th class="col-1 tb-parti">포인트</th>
                        <th class="col-2 ">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                    	<c:when test="${empty boardList}">
                    		<tr>
								<td colspan="6">게시글이 존재하지 않습니다.</td>
							</tr>	
                    	</c:when>
                    	
                    	<c:otherwise>
                    		<c:forEach items="${boardList}" var="board">
                    			 <c:set var="place" value="${fn:split(board.boardPlace, ',') }" />
                    			 <c:set var="guPlace" value="${fn:split(place[1], ' ')}"/>
			                    <tr>
			                        <th class="tb-num">${board.boardNo}</th>
			                        <td class="tb-title">${board.categoryTitle}</td>
			                        <td class="tb-parti">${board.memberName}</td>
			                        <td>${board.boardTitle}</td>
			                        <td>${guPlace[1]}</td>
			                        <td>${board.boardPay}</td>
		                        	<td> 
										<fmt:formatDate var="createDate" value="${board.createDate}"  pattern="yyyy-MM-dd"/>                          
										<fmt:formatDate var="today" value="<%= new java.util.Date() %>"  pattern="yyyy-MM-dd"/>                          
										
										<c:choose>
											<c:when test="${createDate != today}">
												${createDate}
											</c:when>
											
											<c:otherwise>
												<fmt:formatDate value="${board.createDate}"  pattern="HH:mm"/>                          
											</c:otherwise>
										</c:choose>
									</td>
			                    </tr>
		                    </c:forEach>
                    	</c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
        <c:if test="${loginMember != null}">
	       	<div class="btn-box">   
	            <button class="btn" id="register">해주세요 등록</button>
	        </div>
        </c:if>
       	<%---------------------- Pagination start----------------------%>
		
		<c:set var="pageURL" value="list"  />
		
		<c:set var="prev" value="${pageURL}?cpage=${pagination.prevPage}${searchStr}" />
		<c:set var="next" value="${pageURL}?cpage=${pagination.nextPage}${searchStr}" />
		
		
		<div class="my-5 content">
			<ul class="pagination">
			
				<c:if test="${pagination.currentPage > pagination.pageSize }">
					<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
				</c:if>
				
				<c:if test="${pagination.currentPage > 2 }">
					<li><a class="page-link" href="${pageURL}?cpage=${pagination.currentPage - 1}${searchStr}">&lt;</a></li>
				</c:if>
				
				
			
				<%-- 페이지 목록 --%>
				<c:forEach var="p" begin="${pagination.startPage}" end="${pagination.endPage}">
					
						<c:choose>
							<c:when test="${p == pagination.currentPage }">
								<li class="page-item active"><a class="page-link">${p}</a></li>
							</c:when>
							
							<c:otherwise>
								<li><a class="page-link" href="${pageURL}?cpage=${p}${searchStr}">${p}</a></li>
							</c:otherwise>
						</c:choose>						
				</c:forEach>
				
				<c:if test="${pagination.currentPage < pagination.maxPage }">
					<li><a class="page-link" href="${pageURL}?cpage=${pagination.currentPage + 1}${searchStr}">&gt;</a></li>
				</c:if>
				
				<c:if test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
					<li><a class="page-link" href="${next}">&gt;&gt;</a></li>
				</c:if>
			</ul>
		</div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
</body>
</html>