<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<link rel="stylesheet" href="${contextPath}/resources/css/board/boardInsert.css" type="text/css"/>
    <div class="container">
        <div class="page-title">
            <p>해주세요 수정</p>
        </div>
        <c:set var="place" value="${fn:split(board.boardPlace, ',') }" />
        <form class="work-register" action="../update/${board.boardNo}" name="boardForm" method ="post" onsubmit="return validate();">
            <div class="work-1">
                  <label class="input-group-addon mr-3 insert-label">카테고리</label> 
                  <select   class="custom-select category-select" id="categoryCode" name="categoryCode" style="width: 150px;">
                     <c:forEach items="${category}" var="c">
                        <option value="${c.categoryCode}">${c.categoryTitle}</option>
                     </c:forEach>
                  </select>
                <input type="text" class="form-control" placeholder="제목 입력" id="boardTitle" name="boardTitle" value="${board.boardTitle}" required>
                <textarea class="form-control" name="boardContent" placeholder="요청사항을 입력해주세요.(최대한 구체적으로 적어주세요)"  id="request-content" rows="10">${board.boardContent}</textarea>
            </div>
            <div class="work-2">
                <label for="time">예상 시간</label>
                <input type="text" class="form-control" id="boardTime" name ="boardTime" placeholder="소요 시간을 입력해주세요." value="${board.boardTime}" required>
            </div>
            <div class="work-3"> 
                <p>장소</p>
            </div>
            <div class="work-4">
                <div class="row mb-3 form-row">
                    <div class="col-md-3">
                        <label for="postcodify_search_button">우편번호</label>
                    </div>
                    <div class="col-md-3">
                        <input type="text" name="address" class="form-control postcodify_postcode5" value="${place[0]}">
                    </div>
                    <div class="col-md-3">
                        <button type="button" class="btn btn-primary" id="postcodify_search_button">검색</button>
                    </div>
                </div>

                <div class="row mb-3 form-row">
                    <div class="col-md-3">
                        <label for="address1">도로명 주소</label>
                    </div>
                    <div class="col-md-9">
                        <input type="text" class="form-control postcodify_address" name="address" id="address1" value="${place[1]}">
                    </div>
                </div>

                <div class="row mb-3 form-row">
                    <div class="col-md-3">
                        <label for="address2">상세주소</label>
                    </div>
                    <div class="col-md-9">
                        <input type="text" class="form-control postcodify_details" name="address" id="address2" value="${place[2]}">
                    </div>
                </div>
            </div>
            <div class="work-5">
                <label for="pay">페이</label>
                <input type="number" class="form-control" id="boardPay" name="boardPay" placeholder="지급할 포인트를 입력해주세요." value="${board.boardPay}" required>
            </div>

            <div class="request">
                <button class="btn request-btn">요청하기</button>
                <a href="${contextPath}/board/${board.categoryCode}/list?cpage=${param.cpage}${searchStr}" class="btn" id="prv">이전으로</a>
            </div>
        </form>



    </div>
    <jsp:include page="../common/footer.jsp"/>

    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <script src="${contextPath}/resources/js/boardRegister.js"></script>
    <script>
        // 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
        $(function () {
            $("#postcodify_search_button").postcodifyPopUp();
        });
    </script>

</body>
</html>