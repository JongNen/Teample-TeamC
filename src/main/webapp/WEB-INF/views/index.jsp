<%@page import="java.util.List"%>
<%@page import="data.camping.Item"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/commons/top.jsp"%>

<%-- 메인페이지 --%>
<div style="text-align: center;">
	<img class="backimg-linear" src="/resource/image/backGround.jpg" />
</div>
<div class="indexbutton-position">
	<form action="/search">
		<button class="indedetail-button" type="submit">상세보기+</button>
	</form>
</div>
<%--기본 검색 영역 --%>
<div class="back" style="font-size: 20px;">
	<form action="/search">

		지역별
		<%--도 영역 --%>
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
		<select name="sigunguNm" data-group="서울시" class="city">
			<c:forEach items="${seoul }" var="seoul">
				<option value="${seoul}"
					${seoul eq parmam.sigunguNm ? 'selected' : ''}>${seoul }</option>
			</c:forEach>
		</select>
		<%--서울 끝--%>

		<%--부산 --%>
		<select name="sigunguNm" data-group="부산시" class="city">
			<c:forEach items="${busan }" var="busan">
				<option value="${busan}"
					${busan eq parmam.sigunguNm ? 'selected' : ''}>${busan }</option>
			</c:forEach>
		</select>
		<%--부산 끝--%>

		<%--대구 --%>
		<select name="sigunguNm" data-group="대구시" class="city">
			<c:forEach items="${daegu }" var="daegu">
				<option value="${daegu}"
					${daegu eq parmam.sigunguNm ? 'selected' : ''}>${daegu }</option>
			</c:forEach>
		</select>
		<%--대구 끝--%>

		<%--인천 --%>
		<select name="sigunguNm" data-group="인천시" class="city">
			<c:forEach items="${incheon }" var="incheon">
				<option value="${incheon}"
					${incheon eq parmam.sigunguNm ? 'selected' : ''}>${incheon }</option>
			</c:forEach>
		</select>
		<%--인천 끝--%>

		<%--광주 --%>
		<select name="sigunguNm" data-group="광주시" class="city">
			<c:forEach items="${gwangju }" var="gwangju">
				<option value="${gwangju}"
					${gwangju eq parmam.sigunguNm ? 'selected' : ''}>${gwangju }</option>
			</c:forEach>
		</select>
		<%--광주 끝--%>

		<%--대전 --%>
		<select name="sigunguNm" data-group="대전시" class="city">
			<c:forEach items="${daejeon }" var="daejeon">
				<option value="${daejeon}"
					${daejeon eq parmam.sigunguNm ? 'selected' : ''}>${daejeon }</option>
			</c:forEach>
		</select>
		<%--대전 끝--%>
		<%--울산 --%>
		<select name="sigunguNm" data-group="울산시" class="city">
			<c:forEach items="${ulsan }" var="ulsan">
				<option value="${ulsan}"
					${ulsan eq parmam.sigunguNm ? 'selected' : ''}>${ulsan }</option>
			</c:forEach>
		</select>
		<%--울산 끝--%>
		<%--세종 --%>
		<select name="sigunguNm" data-group="세종시" class="city">
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
		<select name="sigunguNm" data-group="제주도" class="city">
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
		<div>
			<%--테마별 --%>
			테마별 <select name="lctCl">
				<option value="" ${param.lctCl eq '' ? 'selected' :  ''}>테마별</option>
				<c:forEach items="${themaList }" var="thema">
					<option value="${thema }" ${thema eq param.lctCl ? 'selected' : ''}>${thema}</option>
				</c:forEach>
			</select>
			<%--테마별 끝 --%>
		</div>
		<button type="submit">검색하기</button>

	</form>
</div>
<div class="belt">
	<table style="margin: auto; width: 1355px;">
		<tbody>

			<c:choose>
				<c:when test="${!empty sessionScope.logonUser.area}">
					<c:set var="count" value="0" />
					<p>관심지역인 ${sessionScope.logonUser.area} 지역 캠핑장은 어떠신가요?</p>
					<c:forEach items="${campingList}" var="obj">
						<c:if test="${count < 5}">
							<c:if
								test="${sessionScope.logonUser.area eq obj.sigunguNm.substring(0,2) || sessionScope.logonUser.area eq obj.doNm.substring(0,2)}">
								<c:set var="count" value="${count+1 }" />
								<tr class="camping-item"
									onclick="location.href='/detail?contentId=${obj.contentId}'">
									<td style="width: 20%; max-width: 270px;"><img
										style="border-radius: 50%; width: 180px; height: 180px; margin: 20px;"
										src="${obj.firstImageUrl}"
										onerror="this.src='/resource/image/tent.png';" /> <br> <b>${obj.facltNm.replace("(주)", "")}</b>
										<br>

										<p style="font-size: 12px;">${obj.lineIntro}</p></td>
										
								</tr>
							</c:if>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach items="${campingList}" var="obj" begin="1" end="5">
						<tr class="camping-item"
							onclick="location.href='/detail?contentId=${obj.contentId}'">
							<td style="width: 20%; max-width: 270px;"><img
								style="border-radius: 50%; width: 180px; height: 180px; margin: 20px;"
								src="${obj.firstImageUrl}"
								onerror="this.src='/resource/image/tent.png';" /> <br> <b>${obj.facltNm.replace("(주)", "")}</b>
								<br>
								<p style="font-size: 12px;">${obj.lineIntro}</p></td>

						</tr>
					</c:forEach>

				</c:otherwise>
			</c:choose>

		</tbody>
	</table>
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


