<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/commons/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

header {
	background-color: #333;
	color: #fff;
	padding: 10px;
}

h1 {
	margin: 0;
	font-size: 28px;
	font-weight: normal;
}

.container {
	max-width: 960px;
	margin: 0 auto;
	padding: 20px;
}

.content {
	background-color: #FFG;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.delete-link {
	color: red;
	text-decoration: none;
	font-weight: bold;
}

.delete-link:hover {
	text-decoration: underline;
}

.list-group-item {
	padding: 10px;
	margin-bottom: 10px;
	list-style-type: circle;
}

.simple-btn {
	background-color: #f0f8ff;
	border: 1px solid #aaa;
	color: #333;
	font-size: 14px;
	padding: 8px 16px;
	border-radius: 4px;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
}

.simple-btn:hover {
	background-color: skyblue;
	color: #fff;
}

fieldset {
	border: 5px solid skyblue;
	border-radius: 20px;
	padding: 10px;
	width: 45%;
	height: auto;
	box-sizing: border-box;
	background-color: #f0f8ff;
	background-image: linear-gradient(180deg, rgba(255, 255, 255, 0.8),
		rgba(255, 255, 255, 0.5) 50%, rgba(255, 255, 255, 0));
}
</style>
</head>
<body>
	<header>
		<div class="container">
			<h1>마이페이지</h1>
		</div>
	</header>
	<div class="container">
		<div class="content">
			<div>${sessionScope.logonUser.name}님
				로그인중(${sessionScope.logonUser.id})</div>
			<c:choose>
				<c:when test="${empty sessionScope.logonUser.area}">
					<div>설정된 관심 지역이 없습니다.</div>
				</c:when>

				<c:otherwise>
					<div>관심지역 = ${sessionScope.logonUser.area }</div>
				</c:otherwise>
			</c:choose>
			<a href="/user/delete?id=${sessionScope.logonUser.id}"
				class="delete-link">회원탈퇴하기</a> <br /> <br /> <br />
			<h2>비밀번호 및 닉네임 수정</h2>

			<small style="color: red;">* 비밀번호와 닉네임은 필수 입력입니다.</small>
			<fieldset>
				<form action="/user/modify">
					<div style="margin: 0.4em">
						<input type="hidden" name="id"
							value="${sessionScope.logonUser.id}"> <input
							type="password" placeholder="비밀번호" name="pass" class="join-input" />
						<small>* 4글자 이상</small>
					</div>

					<div style="margin: 0.4em">
						<input type="name" placeholder="닉네임" name="name"
							class="join-input" value="${sessionScope.logonUser.name}" /> <small>*
							3글자 이상</small>
					</div>

					<div>
						<h2>관심 지역 설정</h2>
						<select name="doNm" id="do">
							<option value="" ${param.doNm eq '' ? 'selected' :  ''}>전국</option>
							<c:forEach items="${doList}" var="obj">
								<option value="${obj}" ${obj eq param.doNm ? 'selected' : '' }>${obj}</option>
							</c:forEach>
						</select>
						<%--도영역 끝 --%>
						<%--시,군,구 영역 --%>
						<select name="sigunguNm" data-group="" class="city">
							<option value="" ${param.sigunguNm eq '' ? 'selected' :  ''}>시/군/구</option>
						</select>
						<%--서울 --%>
						<select name="sigunguNm" data-group="서울특별시" class="city">
							<c:forEach items="${seoul }" var="seoul">
								<option value="${seoul}"
									${seoul eq parmam.sigunguNm ? 'selected' : ''}>${seoul }</option>
							</c:forEach>
						</select>
						<%--서울 끝--%>

						<%--부산 --%>
						<select name="sigunguNm" data-group="부산광역시" class="city">
							<c:forEach items="${busan }" var="busan">
								<option value="${busan}"
									${busan eq parmam.sigunguNm ? 'selected' : ''}>${busan }</option>
							</c:forEach>
						</select>
						<%--부산 끝--%>

						<%--대구 --%>
						<select name="sigunguNm" data-group="대구광역시" class="city">
							<c:forEach items="${daegu }" var="daegu">
								<option value="${daegu}"
									${daegu eq parmam.sigunguNm ? 'selected' : ''}>${daegu }</option>
							</c:forEach>
						</select>
						<%--대구 끝--%>

						<%--인천 --%>
						<select name="sigunguNm" data-group="인천광역시" class="city">
							<c:forEach items="${incheon }" var="incheon">
								<option value="${incheon}"
									${incheon eq parmam.sigunguNm ? 'selected' : ''}>${incheon }</option>
							</c:forEach>
						</select>
						<%--인천 끝--%>

						<%--광주 --%>
						<select name="sigunguNm" data-group="광주광역시" class="city">
							<c:forEach items="${gwangju }" var="gwangju">
								<option value="${gwangju}"
									${gwangju eq parmam.sigunguNm ? 'selected' : ''}>${gwangju }</option>
							</c:forEach>
						</select>
						<%--광주 끝--%>

						<%--대전 --%>
						<select name="sigunguNm" data-group="대전광역시" class="city">
							<c:forEach items="${daejeon }" var="daejeon">
								<option value="${daejeon}"
									${daejeon eq parmam.sigunguNm ? 'selected' : ''}>${daejeon }</option>
							</c:forEach>
						</select>
						<%--대전 끝--%>
						<%--울산 --%>
						<select name="sigunguNm" data-group="울산광역시" class="city">
							<c:forEach items="${ulsan }" var="ulsan">
								<option value="${ulsan}"
									${ulsan eq parmam.sigunguNm ? 'selected' : ''}>${ulsan }</option>
							</c:forEach>
						</select>
						<%--울산 끝--%>
						<%--세종 --%>
						<select name="sigunguNm" data-group="세종특별자치시" class="city">
							<c:forEach items="${sejong }" var="sejong">
								<option value="${sejong}"
									${sejong eq parmam.sigunguNm ? 'selected' : ''}>${sejong }</option>
							</c:forEach>
						</select>
						<%--세종 끝 --%>
						<%--경기도 --%>
						<select name="sigunguNm" data-group="경기도" class="city">
							<c:forEach items="${gyeonggi }" var="gyeonggi">
								<option value="${gyeonggi}"
									${gyeonggi eq parmam.sigunguNm ? 'selected' : ''}>${gyeonggi }</option>
							</c:forEach>
						</select>
						<%--경기도 끝--%>
						<%--제주 --%>
						<select name="sigunguNm" data-group="제주특별자치도" class="city">
							<c:forEach items="${jeju }" var="jeju">
								<option value="${jeju}"
									${jeju eq parmam.sigunguNm ? 'selected' : ''}>${jeju }</option>
							</c:forEach>
						</select>
						<%--제주 끝--%>
						<%--강원도 --%>
						<select name="sigunguNm" data-group="강원도" class="city">
							<c:forEach items="${gangwon }" var="gangwon">
								<option value="${gangwon}"
									${gangwon eq parmam.sigunguNm ? 'selected' : ''}>${gangwon }</option>
							</c:forEach>
						</select>
						<%--강원도 끝--%>
						<%--충청복도 --%>
						<select name="sigunguNm" data-group="충청북도" class="city">
							<c:forEach items="${chungbuk }" var="chungbuk">
								<option value="${chungbuk}"
									${chungbuk eq parmam.sigunguNm ? 'selected' : ''}>${chungbuk }</option>
							</c:forEach>
						</select>
						<%--충청복도 끝--%>
						<%--충청남도 --%>
						<select name="sigunguNm" data-group="충청남도" class="city">
							<c:forEach items="${chungnam }" var="chungnam">
								<option value="${chungnam}"
									${chungnam eq parmam.sigunguNm ? 'selected' : ''}>${chungnam }</option>
							</c:forEach>
						</select>
						<%--충청남도 끝--%>
						<%--전라북도 --%>
						<select name="sigunguNm" data-group="전라북도" class="city">
							<c:forEach items="${jeonbuk }" var="jeonbuk">
								<option value="${jeonbuk}"
									${jeonbuk eq parmam.sigunguNm ? 'selected' : ''}>${jeonbuk }</option>
							</c:forEach>
						</select>
						<%--전라북도 끝--%>
						<%--전라남도 --%>
						<select name="sigunguNm" data-group="전라남도" class="city">
							<c:forEach items="${jeonnam }" var="jeonnam">
								<option value="${jeonnam}"
									${jeonnam eq parmam.sigunguNm ? 'selected' : ''}>${jeonnam }</option>
							</c:forEach>
						</select>
						<%--전라남도 끝--%>
						<%--경상북도 --%>
						<select name="sigunguNm" data-group="경상북도" class="city">
							<c:forEach items="${gyeongbuk }" var="gyeongbuk">
								<option value="${gyeongbuk}"
									${gyeongbuk eq parmam.sigunguNm ? 'selected' : ''}>${gyeongbuk }</option>
							</c:forEach>
						</select>
						<%--경상북도 끝--%>
						<%--경상남도 --%>
						<select name="sigunguNm" data-group="경상남도" class="city">
							<c:forEach items="${gyeongnam }" var="gyeongnam">
								<option value="${gyeongnam}"
									${gyeongnam eq parmam.sigunguNm ? 'selected' : ''}>${gyeongnam }</option>
							</c:forEach>
						</select>
						<%--경상남도 끝--%>
						<%--시,군,구 영역 끝 --%>
					</div>





					<div style="margin-top: 10px;">
						<button type="submit" class="simple-btn">정보수정</button>
					</div>
				</form>
			</fieldset>
			<br />

			<h2>좋아요 한 캠핑장</h2>
			<fieldset>
				<c:choose>
					<c:when test="${empty myPost}">
						<p>아직 좋아요 한 캠핑장이 없습니다.</p>
						<a href="/search" class="btn btn-primary">캠핑장 찾으러 가기</a>
					</c:when>
					<c:otherwise>
						<ul class="list-group">
							<c:forEach items="${myPost}" var="post">
								<li class="list-group-item">${post.campname}<a
									href="/detail?contentId=${post.campid}" style="color: blue;">
										이동</a></li>
							</c:forEach>
						</ul>
					</c:otherwise>
				</c:choose>
			</fieldset>


			<br /> <a href="/index" style="color: blue;">홈으로</a>
		</div>
	</div>





	<script>
		//do 영역의 select 태그에 onchange 이벤트 추가
		document.querySelector("#do").onchange = function(evt) {
			// 선택한 도시값 가져오기
			const selectedCity = evt.target.value;

			// 시, 군, 구 영역의 select 태그들을 찾아서 처리
			document.querySelectorAll(".city").forEach(function(one) {
				if (one.dataset.group != selectedCity) {
					one.name = "";
					one.style.display = "none";
				} else {
					one.name = "sigunguNm";
					one.style.display = "";
				}
			});
		};
		//do 영역의 select 태그에 change 이벤트 발생시키기
		document.querySelector("#do").dispatchEvent(new Event("change"));

		// 시, 군, 구 영역의 select 태그에 값 넣어주기
		document.querySelectorAll(".city").forEach(function(one) {
			if (one.dataset.group === document.querySelector("#do").value) {
				one.name = "sigunguNm";
				one.value = "${param.sigunguNm}";
			} else {
				one.style.display = "none";
			}
		});
	</script>
	<c:if test="${param.cause eq 'valid' }">
		<script>
			alert("잘못된 입력입니다!!");
		</script>
	</c:if>
</body>
</html>