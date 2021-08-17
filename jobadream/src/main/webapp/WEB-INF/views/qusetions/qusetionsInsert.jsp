<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<style>
.quInsert-title {
	font-family: 'Pretendard-Regular';
	background: linear-gradient(to right top, #4160c8c0, #3eaee6d0);
	color: transparent;
	-webkit-background-clip: text;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 40px;
}

#qu-insertTop-all{
	margin-left:10px;
	margin-bottom: 10px;
	font-weight: bold;
	text-align: left;
	padding-top: 13px;
	height: 60px;
}

#qusetionsTitle {
	width: 100%;
	border: 1px solid #F2EEEB;
}

.qu-textarea-custom {
	width: 96%;
	height: 100%;
	resize: none;
	overflow-y: hidden;
	padding: 11px;
	padding-bottom: 2px;
	line-height: 16px;
	border: 1px solid #F0F0F2;
	border-radius: 5px;
}

.quInsert-text-area {
	height: 500px;
}

.qu-textarea-custom:focus {
    outline: none;
}

#qu-button{
	background-color: #3eafe6;
	border:#3eafe6;
	color: white;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
 <div class="container">
        <h2 class="quInsert-title">1:1 문의</h2>
        <form action="insert" method="post" role="form" onsubmit="return qusetionsValidate();">
        <div class="list-detaiil shadow p-3 mb-5 bg-white rounded p-5">
        <div class="row">
            <div class="col col-md-12" id="quInsert-title">
                <div class="input-group m-3" id="qu-input title">
                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
                    placeholder="제목 입력" name="qusetionsTitle" id="qusetionsTitle">
                </div>
            </div>
        </div>
			<div class="row" id="qu-insertTop-all">
					<div class="col-md-2 " id="qu-top-wri">작성자</div>
					<div class="col-md-10" id="qu-top-insert">${loginMember.memberId }</div>
				</div>
			<div class="row" id="qu-insertTop-all">
					<div class="col-md-2" id="qu-top-date">작성일</div>
					<div class="col-md-10" id="qu-top-insert"><h5 class="my-0" id="today"></h5></div>
				</div>
        <div class="row">
            <div class="col col-md-12 mb-3 m-3 quInsert-text-area" id="content">
                <textarea class="qu-textarea-custom" id="qusetionsContent" name="qusetionsContent" placeholder="내용을 입력해주세요"></textarea> 
            </div>
        </div>
        <div class="row">
            <div class="col col-md-12 mb-3 d-flex flex-row-reverse bd-highlight">
                <button type="submit" class="btn btn-light mr-5" id="qu-button">등록</button>
            </div>
        </div>
        </div>
        </form>
    </div>
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>
		
		(function printToday() {
			// 오늘 날짜 출력 
			var today = new Date();
			var month = (today.getMonth() + 1);
			var date = today.getDate();

			var str = today.getFullYear() + "-"
					+ (month < 10 ? "0" + month : month) + "-"
					+ (date < 10 ? "0" + date : date);
			$("#today").html(str);
		})();

		// 유효성 검사 
		function qusetionsValidate() {
			if ($("#qusetionsTitle").val().trim().length == 0) {
				alert("제목을 입력해 주세요.");
				$("#title").focus();
				return false;
			}

			if ($("#qusetionsContent").val().trim().length == 0) {
				alert("내용을 입력해 주세요.");
				$("#content").focus();
				return false;
			}
		}
</script>
</body>
</html>