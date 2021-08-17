<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gps</title>
<style>
.map-all {
	padding: 30px;
}

.map-title {
	color: #4161c8;
	font-weight: bolder;
	text-align: center;
}


#map {
	margin: 0 auto;
}

.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>
</head>
<body>
	<!-- header.jsp 동적 include -->
	<jsp:include page="../common/header.jsp" />
    <div class="container">
        <div class="map-all">
            <h1 class="map-title">내주변 해주세요</h1>
            <hr>
            <div id="map" style="width:800px;height:500px;"></div>
        </div>
    </div>
		<input type="hidden" id="searchGps" value="${searchGps}">
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aa63a57fc0af9651ee0bfff3b053ed58&libraries=services,clusterer,drawing"></script>
	<script>
		var searchGps = $("#searchGps").val();

		console.log(searchGps);
		var geocoder = new kakao.maps.services.Geocoder();
		var marker = new kakao.maps.Marker()

		if (searchGps == "current") {

			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {
				console.log(searchGps);
				currentAddr(selectStoreList);

			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
				var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'
			}
		} else {
			selectStoreList(searchGps);
		}

		function currentAddr(fn) {
			console.log(searchGps);
			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				getAddr(lat, lon);

				function getAddr(lat, lon) {
					let geocoder = new kakao.maps.services.Geocoder();

					let coord = new kakao.maps.LatLng(lat, lon);

					let callback = function(result, status) {
						if (status === kakao.maps.services.Status.OK) {
							searchGps = result[0].address.address_name;
							console.log("콜성백성공" + searchGps);
							fn(searchGps);
						}
					};
					geocoder.coord2Address(coord.La, coord.Ma, callback);
				}

			});

		}

		function selectStoreList(searchGps) {
			$.ajax({
				url : "${contextPath}/gps/search",
				type : "POST",
				data : {
					"searchGps" : searchGps
				},
				type : "POST",
				dataType : "JSON",
				success : function(sList) {
					if (sList != null) {
						createMap(sList);
						console.log(sList);
					}
				},
				error : function() {
					console.log("위치 검색 실패");
				}

			});
		}

		function createMap(sList) {

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 4
			// 지도의 확대 레벨
			};

			console.log(sList);
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			for (var i = 0; i < sList.length; i++) {
				//console.log(sList[i].categoryTitle);
				//console.log(sList[i].boardPlace);
			
				const categoryTitle = sList[i].categoryTitle;
				const boardPay = sList[i].boardPay;
				const boardNo = sList[i].boardNo;
				const categoryCode = sList[i].categoryCode;
			
				
				var boardTitle = sList[i].boardTitle;
				//console.log("dd"+categoryCode);
				//console.log("ddd"+boardNo);
			
				getLocation(
						function(latlng, categoryTitle) {
							console.log(categoryCode);
							console.log(boardNo);
							// 결과값으로 받은 위치를 마커로 표시합니다
							marker = new kakao.maps.Marker({
								map : map,
								position : latlng,
								title : categoryTitle
							});
							
							// 마커 위에 커스텀오버레이를 표시합니다
							// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
							var overlay = new kakao.maps.CustomOverlay({
								map : map,
								position :marker.getPosition()
							});
							
					
							  var title = document.createElement('div');
							    title.innerHTML =  categoryTitle;
							    title.style.cssText = 'background: #D5E5F2;position: absolute; font-weight: bold; width: 100px; line-height: 1.5;bottom: 40px; text-align: center;' ;
								
							    
							  var index = document.createElement('div');
							  	index.innerHTML =  boardTitle;
							  	index.style.cssText ='text-align: center;';
							    
							    
							  var content = document.createElement('div');
							    content.innerHTML =  boardPay;
							    content.style.cssText ='text-align: center;';
							    
							    var link = document.createElement('a');
					            link.className ="link";
					            var text3 = document.createTextNode("지원하러가기")
					            link.appendChild(text3);
					            link.target="_blank";
					            link.href = "${contextPath}/board/"+categoryCode+"/"+boardNo;
							    
							    var closeBtn = document.createElement('button');
							    closeBtn.innerHTML = 'x';
							    closeBtn.style.cssText = ' background-color: #4161c8; color: #fff; border-style: none; border-radius: 3px; float: right;';
							    closeBtn.onclick = function () {
							        overlay.setMap(null);
							    };
							    
							    title.appendChild(closeBtn);
							    title.appendChild(content);
							    title.appendChild(content);
							    title.appendChild(link);
							    overlay.setContent(title);

							
						    kakao.maps.event.addListener(marker, 'click', function() {
						        overlay.setMap(map);
						    });

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(latlng);

						}, sList[i].boardPlace, categoryTitle);
			}
		}

		// 주소를 가지고 좌료 얻어오기
		function getLocation(callbackFn, boardPlace, categoryTitle) {
			console.log("getLocation 들어오기 성공");

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(boardPlace,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							console.log("getLocation 들어오기 성공");
							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							callbackFn(coords, categoryTitle);
						}
					});
		}
	</script>


	<!-- footer.jsp 동적 include -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>