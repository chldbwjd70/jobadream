<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rContent {
	height: 100%;
	width: 100%;
}

.reply-row {
	list-style: none;
}

.rWriter{
	font-weight: bold;
	font-size: 19px; 
}

.rDate{
	  display: inline-block;
      font-size: 13px; 
}
</style>
</head>
<body>

	<!-- 댓글 -->
	<div class="row">
		<div class="col-md-12">
			<h5 class="mb-4">댓글</h5>
			<ul id="replyListArea">
				<c:forEach items="${rList}" var="reply">
				<li class="reply-row">
					<div class="reply-top mb-2">
							<p class="rWriter">${reply.memberId }</p>
							<p class="rDate"><fmt:formatDate value="${reply.qusetionsCommentDt}" pattern="yyyy년 MM월 dd일 HH:mm"/></p>
					</div>
					<p class="rContent">${reply.replyContent }</p>
					<c:if test="${reply.memberNo == loginMember.memberNo}">
						<div class="replyBtnArea">
							<button class="btn btn-primary btn-sm ml-1" id="updateReply" onclick="showUpdateReply(${reply.qusetionsNo}, this)">수정</button>
							<button class="btn btn-primary btn-sm ml-1" id="deleteReply" onclick="deleteReply(${reply.qusetionsNo})">삭제</button>
						</div>
					</c:if>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
</body>
<script type="text/javascript">
const loginMemberNo = "${loginMember.memberNo}";
const qusetionsNo = ${qusetions.qusetionsNo};
selectReplyList();
function selectReplyList(){
		/*/fin */
$.ajax({
url : "${contextPath}/reply/list",
data : {"qusetionsNo" : qusetionsNo}, // 오른쪽 변수명
type : "POST",
dataType : "JSON", //응답되는 데이터의 형식이 JSON임을 알랴줌-->자바스크립트로변환됨
success : function(rList){
console.log(rList);

$("#replyListArea").html(""); // 기존 정보 초기화
//왜? 새로 읽어온 댓글 목록으로 다시 만들어서 출력하려고.

$.each(rList, function(index, item){
   	//$.each() : jQuery와 반복문
   	//
   	//index : 순차접근시 현재 택텍스트
   	//item : 순차 접근시 현재 접근한 배열 요소(댓글객체하나)
	 
	 //console.log(rList[i]);
	
   
   
   var li = $("<li>").addClass("reply-row");

   // 작성자, 작성일, 수정일 영역 
   var div = $("<div>");
   var rWriter = $("<p>").addClass("rWriter").text(item.memberId);
   var rDate = $("<p>").addClass("rDate").text("작성일 : " + item.qusetionsCommentDt);
   div.append(rWriter).append(rDate)
   
   
   // 댓글 내용
   var rContent = $("<p>").addClass("rContent").html(item.qusetionsCommentContent);
   
   
   // 대댓글, 수정, 삭제 버튼 영역
   var replyBtnArea = $("<div>").addClass("replyBtnArea");
   
   // 현재 댓글의 작성자와 로그인한 멤버의 아이디가 같을 때 버튼 추가
   if(item.memberNo == loginMemberNo){
      
      // ** 추가되는 댓글에 onclick 이벤트를 부여하여 버튼 클릭 시 수정, 삭제를 수행할 수 있는 함수를 이벤트 핸들러로 추가함. 
      var showUpdate = $("<button>").addClass("btn btn-primary btn-sm ml-1").text("수정").attr("onclick", "showUpdateReply("+item.qusetionsCommentNo+", this)");
      var deleteReply = $("<button>").addClass("btn btn-primary btn-sm ml-1").text("삭제").attr("onclick", "deleteReply("+item.qusetionsCommentNo+")");
      
      replyBtnArea.append(showUpdate).append(deleteReply);
   }
   
   
   // 댓글 요소 하나로 합치기
   li.append(div).append(rContent).append(replyBtnArea);
   
   
   // 합쳐진 댓글을 화면에 배치
   $("#replyListArea").append(li);
});


},
error : function(){
console.log("댓글 목록 조회 실패");
}

});
}
</script>
</html>