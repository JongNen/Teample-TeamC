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
		<p>지역별</p>
		<p>테마별</p>
		<button class="searchbutton searchbutton-position" type="submit">검색하기</button>
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
								<tr class="camping-item" onclick="location.href='/detail?contentId=${obj.contentId}'">
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
						<tr class="camping-item" onclick="location.href='/detail?contentId=${obj.contentId}'">
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