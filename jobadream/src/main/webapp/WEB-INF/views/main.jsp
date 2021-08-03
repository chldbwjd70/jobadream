<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잡아드림 main</title>
</head>
<body>
	
	<jsp:include page="common/header.jsp"/>
	<link rel="stylesheet" href="${contextPath}/resources/css/main.css" type="text/css"/>
    <div class="container">
       <!--캐러셀-->
       <div id="carouselMain" class="carousel slide" data-ride="carousel">
           <ol class="carousel-indicators">
           <li data-target="#carouselMain" data-slide-to="0" class="active"></li>
           <li data-target="#carouselMain" data-slide-to="1"></li>
           <li data-target="#carouselMain" data-slide-to="2"></li>
           </ol>
           <div class="carousel-inner">
           <div class="carousel-item active">
               <img src="${contextPath}/resources/images/main/slide-1.png" class="d-block w-100" >
           </div>
           <div class="carousel-item">
               <img src="${contextPath}/resources/images/main/slide-2.png" class="d-block w-100" >
           </div>
           <div class="carousel-item">
               <img src="${contextPath}/resources/images/main/slide-3.png" class="d-block w-100" >
           </div>
           </div>
       </div>
       <!-- job아드림 소개내용 -->
       <div class="introduce">
           <div class="text-content"><strong>job아드림은?</strong>
           <p>자투리시간, 부담없는 시간에 간단하게<br>
           알바하고 싶을때 <mark style="background-color: #6dade3;">잡아드림</mark>으로 찾아오세요.<br>
           <br></p>
               <hr>
           </div>
       </div>

       <!-- 카테고리 제목 -->
       <div class="category-head">
           <div class="giveme">해주세요</div>
       </div>

       <!-- 카테고리 부분 -->
       <div class="category-list">
           <div class="row">
               <div class="col-xs-6 col-sm-6 col-md-4">
                   <a href="${contextPath}/board/0/list"" class="category-list">
                       <img src="${contextPath}/resources/images/main/all.png">
                   </a>
               </div>

               <div class="col-xs-6 col-sm-6 col-md-4">
                   <a href="${contextPath}/board/1/list" class="category-list">
                       <img src="${contextPath}/resources/images/main/home.png">
                   </a>
               </div>

               <div class="col-xs-6 col-sm-6 col-md-4">
                   <a href="${contextPath}/board/2/list" class="category-list">
                       <img src="${contextPath}/resources/images/main/catdog.png">
                   </a>
               </div>

               <div class="col-xs-6 col-sm-6 col-md-4">
                   <a href="${contextPath}/board/3/list" class="category-list">
                       <img src="${contextPath}/resources/images/main/errand.png">
                   </a>
               </div>

               <div class="col-xs-6 col-sm-6 col-md-4">
                   <a href="${contextPath}/board/4/list" class="category-list">
                       <img src="${contextPath}/resources/images/main/delivery.png">
                   </a>
               </div>

               <div class="col-xs-6 col-sm-6 col-md-4">
                   <a href="${contextPath}/board/5/list" class="category-list">
                       <img src="${contextPath}/resources/images/main/etc.png">
                   </a>
               </div>

           </div>
       </div>

       <!-- 실시간 간단알바 제목 -->
       <div class="real-head"> 
           <div class="real-title">실시간 간단알바</div>
       </div>

       <!-- 실시간 간단 알바 목록 -->
       <div class="real-list">
           
           <div class="real-item row">
               <div class="item-image col-md-4"><a href="#"></a><img src="${contextPath}/resources/images/main/new-square.png"></div>
               <div class="item-text col-md-8"><a href="#"><strong>편의점 1시간 대타 구합니다[급구]</strong></a>
                   <p class="item-info"><strong>강서구   |   금액:12,000원 |  시간: 1시간</strong></p>
                   <p class="item-title">대타가 개인사정으로 오지못해서 1시간 급하게 구해봅니다...</p>
               </div>
           </div>

           <div class="real-item row">
               <div class="item-image col-md-4"><a href="#"></a><img src="${contextPath}/resources/images/main/new-square.png"></div>
               <div class="item-text col-md-8"><a href="#"><strong>편의점 1시간 대타 구합니다[급구]</strong></a>
                   <p class="item-info"><strong>강서구   |   금액:12,000원 |  시간: 1시간</strong></p>
                   <p class="item-title">대타가 개인사정으로 오지못해서 1시간 급하게 구해봅니다...</p>
               </div>
           </div>

           <div class="real-item row">
               <div class="item-image col-md-4"><a href="#"></a><img src="${contextPath}/resources/images/main/new-square.png"></div>
               <div class="item-text col-md-8"><a href="#"><strong>편의점 1시간 대타 구합니다[급구]</strong></a>
                   <p class="item-info"><strong>강서구   |   금액:12,000원 |  시간: 1시간</strong></p>
                   <p class="item-title">대타가 개인사정으로 오지못해서 1시간 급하게 구해봅니다...</p>
               </div>
           </div>
           
       </div>

   </div>
   	<jsp:include page="common/footer.jsp"/>
	<script>
       $('.carousel').carousel({
         interval: 2000,
         // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
         wrap: true,
       })
   	</script>

</body>
</html>