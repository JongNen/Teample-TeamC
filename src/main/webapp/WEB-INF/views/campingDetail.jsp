<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%-- 캠핑장 상세정보 페이지 --%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<style>
.heart-icon.fas {
	color: red;
}

.heart-icon.far {
	color: black;
}
</style>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/resource/style.css">
<link
	href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro-v6@44659d9/css/all.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
</head>
<body>
	<div class="detail-main">
		<div class="detail-img">
			<img src="${camp.firstImageUrl}"
				onerror="this.src='/resource/image/tent.png';" />
			<button id="likeButton" onclick="like()" class="like-button-position">
				<i id="likeIcon" class="far fa-heart heart-icon like-button"></i>
			</button>
		</div>
		<div class="camping-content">
			<div class="camping-line"></div>
			<div class="camping-name">
				<c:choose>
					<c:when test="${not empty camp.facltNm}">
							${camp.facltNm.replace("(주)", " ")}
						</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>
			</div>
			<div class="camping-line">
				<div class="onelog-introduce">
					<c:choose>
						<c:when test="${not empty camp.lineIntro}">
								"${camp.lineIntro}"
							</c:when>
						<c:otherwise>
							"멋진 캠핑장이에요!"
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div>
				<%@ include file="/WEB-INF/views/commons/icon.jsp"%>
			</div>
		</div>
	</div>

	<div id="map"
		style="width: 100%; height: 270px; margin: auto; display: flex; justify-content: center; align-items: center; border: 1px solid #dddddd">

		<c:choose>
			<c:when test="${empty camp.addr1 }">
						지도정보를 확보 하지 못해 렌더링에 실패하였습니다.
					</c:when>
			<c:otherwise>
						지도를 불러옵니다.
						
					</c:otherwise>
		</c:choose>
	</div>

	<!-- 지도 관련 부분 -->
	<c:if test="${!empty camp.addr1}">
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdd7a2dbaa2570a180f3c39b9a412437"></script>
		<script>
				
		let pos = new kakao.maps.LatLng(${camp.mapY}, ${camp.mapX}); //지도의 중심좌표.
		
		let container = document.querySelector('#map'); //지도를 담을 영역의 DOM 레퍼런스
		let options = { //지도를 생성할 때 필요한 기본 옵션
			center : pos, 
			level : 4
		//지도의 레벨(확대, 축소 정도)
		};

		let map = new kakao.maps.Map(document.querySelector('#map'), options); //지도 생성 및 객체 리턴
		
		let marker = new kakao.maps.Marker({
		    position: pos
		});
		
		marker.setMap(map);
		</script>
	</c:if>


	<script>
	// 좋아요 부분
	
	   const likes = ${likeCheckJson};
	   const userId = "${sessionScope.logonUser.id}";
	   let liked = false;
	   for (let i = 0; i < likes.length; i++) {
 	   		if (likes[i].liker === userId) {
   		 		liked = true;
    			break;
  			}
		}
	   
		if (liked) {
  			document.getElementById("likeIcon").classList.remove("far");
  			document.getElementById("likeIcon").classList.add("fas");
			}

	function like() {
			const likeButton = document.getElementById("likeButton");
			const likeIcon = document.getElementById("likeIcon");
	
		const xhr = new XMLHttpRequest();
		xhr.open("GET", "/api/like?campname=${camp.facltNm}&campid=${camp.contentId}", false);
		xhr.send();
		const txt = xhr.responseText;
		const obj = JSON.parse(txt);

	  // isLiked 값에 따라 하트 색 변경
	  if (obj.done === 'fas') {
	    likeIcon.classList.remove("fas");
	    likeIcon.classList.add("far");
	  } else {
	    likeIcon.classList.remove("far");
	    likeIcon.classList.add("fas");
	  }
	 
	}
	
	</script>
</body>
</html>