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
	
		<button type="submit">검색하기</button>
	</form>
</div>
<table style="margin: auto; width: 1355px;">
	<tbody>
		<c:forEach items="${campingList}" var="obj" begin="1" end="5">
			<tr class="camping-item">
				<td style="width: 20%; max-width: 270px;"><img
					style="border-radius: 50%; width: 180px; height: 180px; margin: 20px;"
					src="${obj.firstImageUrl}" /> <br> <b>${obj.facltNm.replace("(주)", "")}</b>
					<br>
					<p>${obj.lineIntro}</p></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
