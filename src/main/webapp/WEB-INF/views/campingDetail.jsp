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
th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

.container {
	display: flex;
	flex-direction: row-reverse;
	justify-content: flex-start;
	align-items: center;
	margin: 20px;
}

.heart-icon.fas {
	color: red;
}

.heart-icon.far {
	color: black;
}

.detail_btn button {
	width: 30%;
	height: 40px;
	border: 1px solid #8e8e8e;
	border-radius: 5px;
}

.detail_btn button:hover {
	background: white;
	cursor: pointer;
}

.table th {
	width: 45%;
}

.comment-list {
	margin-top: 20px;
	border: 1px solid #ccc;
	padding: 10px;
}

.comment {
	margin-bottom: 20px;
}

.comment .writer {
	font-weight: bold;
	font-size: 16px;
	margin-bottom: 5px;
}

.comment .body {
	font-size: 14px;
}

.comment-wrapper textarea {
	width: 30%;
	height: 150px;
	padding: 10px;
	border: none;
	border-radius: 5px;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
	resize: none;
	font-size: 16px;
	font-family: inherit;
	height: 150px;
}

.comment-wrapper button {
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	padding: 10px;
	font-size: 16px;
	cursor: pointer;
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
			<c:if test="${sessionScope.logon}">
				<button id="likeButton" onclick="like()"
					style="position: absolute; top: 10px; right: 10px; background-color: transparent; border: none;">
					<i id="likeIcon" class="far fa-heart heart-icon"
						style="font-size: 40px;"></i>
				</button>
			</c:if>
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
			<div
				style="display: flex; justify-content: center; align-items: center;">
				<div class="detail_btn"
					style="display: flex; justify-content: space-around; width: 960px;">
					<button onclick="toggleDetail()">상세정보</button>
					<button onclick="toggleMap()">지도보기</button>
					<button onclick="toggleReview()">후기</button>
				</div>
			</div>

			<!-- 상세보기 영역 -->
			<div
				style="display: flex; justify-content: center; width: 960px; margin-top: 20px;">
				<div class="table" id="campInfo"
					style="display: block; width: 100%;">
					<table>
						<tr>
							<th>항목</th>
							<th>내용</th>
						</tr>
						<tr>
							<td>캠핑장 명</td>
							<c:choose>
								<c:when test="${not empty camp.facltNm}">
									<td>${camp.facltNm.replace("(주)", " ")}</td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>주소</td>
							<c:choose>
								<c:when test="${not empty camp.addr1}">
									<td>${camp.addr1}</td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>연락처</td>
							<c:choose>
								<c:when test="${not empty camp.tel}">
									<td>${camp.tel}</td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>홈페이지 주소</td>
							<c:choose>
								<c:when test="${not empty camp.homepage}">
									<td><a href="${camp.homepage}" style="color: blue">${camp.homepage}</a></td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>캠핑장 형태</td>
							<c:choose>
								<c:when test="${not empty camp.induty}">
									<td>${camp.induty}</td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>주변 환경</td>
							<c:choose>
								<c:when test="${not empty camp.lctCl}">
									<td>${camp.lctCl}</td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>운영기간</td>
							<c:choose>
								<c:when test="${not empty camp.operPdCl}">
									<td>${camp.operPdCl}</td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>운영일</td>
							<c:choose>
								<c:when test="${not empty camp.operDeCl}">
									<td>${camp.operDeCl}</td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>애완동물 출입</td>
							<c:choose>
								<c:when test="${not empty camp.animalCmgCl}">
									<td>${camp.animalCmgCl}</td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>캠핑장 소개</td>
							<c:choose>
								<c:when test="${not empty camp.lineIntro}">
									<td>${camp.lineIntro}</td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</table>
				</div>
			</div>

			<!-- 지도 영역 -->
			<div id="map"
				style="width: 100%; height: 400px; margin: auto; display: none; justify-content: center; align-items: center; border: 1px solid #dddddd">

				<c:choose>
					<c:when test="${empty camp.addr1 }">
            지도정보를 확보 하지 못해 렌더링에 실패하였습니다.
        </c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</div>


			<div id="review" style="display: none">
				<!-- 댓글 작성 영역 -->
				<div class="comment-wrapper">
					<form action="/camp/review" method="post">

						<textarea name="body" placeholder="댓글을 입력해주세요"></textarea>
						<input type="hidden" name="contentId" value="${param.contentId}">
						<div>
							<button>댓글 작성</button>
						</div>

					</form>
				</div>


				<!-- 댓글 보기 영역 -->
				<div class="comment-list">
					<c:forEach items="${review}" var="m">
						<c:choose>
							<c:when test="${sessionScope.logonUser.id eq m.writerId}">
								<div class="comment">
									<div class="writer">${m.writerName}님(${m.writerId})
										<a
											href="/camp/delete?contentId=${param.contentId}&reviewNum=${m.reviewNum}"
											style="color: red"> 삭제</a>
									</div>
									<div class="body">${m.body}</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="comment">
									<div class="writer">${m.writerName}님(${m.writerId})</div>
									<div class="body">${m.body}</div>
								</div>

							</c:otherwise>
						</c:choose>

					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<!-- ///////////////////////////// 스크립트 부분 ////////////////////////////////// -->

	<!-- 상세 보기 영역 -->
	<script>
		function toggleDetail() {
		    var campInfo = document.getElementById("campInfo");
		    var mapElement = document.getElementById("map");
		    var review = document.getElementById("review");
		    if (campInfo.style.display === "none") {
		        campInfo.style.display = "block";
		        mapElement.style.display="none";
		        review.style.display = "none";
		    } 
		}
	</script>

	<!-- 지도 관련 부분 -->
	<c:if test="${!empty camp.addr1}">
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdd7a2dbaa2570a180f3c39b9a412437"></script>
		<script>
	let pos = new kakao.maps.LatLng(${camp.mapY}, ${camp.mapX});	
	let container = document.querySelector('#map');
	let options = {		
		center : pos, 
		level : 4
	};
	
	let map = new kakao.maps.Map(document.querySelector('#map'), options);
	let marker = new kakao.maps.Marker({
		position: pos
	});
	marker.setMap(map);
	
	
  
	function toggleMap() {
		  let mapElement = document.getElementById("map");
		  var campInfo = document.getElementById("campInfo");
		  var review = document.getElementById("review");
		  if (mapElement.style.display === "none") {
			campInfo.style.display = "none";
			review.style.display = "none";
		    mapElement.style.display = "inline-block";
		    map.relayout();
		    map.setCenter(pos);
		    marker.setMap(map);
		    
		  }
		}
	

</script>

		<!-- 후기 관련 부분 -->
		<script>
		function toggleReview() {
			var campInfo = document.getElementById("campInfo");
			var mapElement = document.getElementById("map");
	    	var review = document.getElementById("review");
	   		if (review.style.display === "none") {
	        	review.style.display = "block";
	        	mapElement.style.display="none";
	        	campInfo.style.display = "none";
	   		} 
	    	
		}
	</script>

	</c:if>

	<!-- 좋아요 부분 -->
	<script>	
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

	<c:if test="${param.cause eq 'valid' }">
		<script>
			alert("비회원은 글 쓰기가 불가능합니다.");
		</script>
	</c:if>

</body>
</html>