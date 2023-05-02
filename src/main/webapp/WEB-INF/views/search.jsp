<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/commons/top.jsp"%>

<!-- 검색 전체화면 -->
<div>
	<form action="/search" method="get" style="display: flex; justify-content: space-evenly;">
		<div style="font-size: 20px;">
			<div>
				지역별 
				<%--도 영역 --%>
				<select name="doNm">
					 <option value="" ${param.doNm eq '' ? 'selected' : ''}>전체</option>
			 	<%-- <option value="서울시" ${param.doNm eq '서울시' ? 'selected' : '' }>서울특별시</option>
					  <option value="인천시" ${param.doNm eq '인천시' ? 'selected' : '' }>인천광역시</option>
					  <option value="대전시" ${param.doNm eq '대전시' ? 'selected' : '' }>대전광역시</option>
					  <option value="강원도" ${param.doNm eq '강원도' ? 'selected' : '' }>강원도</option>
					  <option value="전라남도" ${param.doNm eq '전라남도' ? 'selected' : '' }>전라남도</option> --%>
					<c:forEach items="${datas }" var="obj">
						<option value="${obj.doNm }" ${'param.obj' eq obj.doNm ? 'selected' : '' }>${obj.doNm }</option>
					</c:forEach> 
				</select> 
				<select name="sigunguNm">
					<option value="" ${param.sigunguNm eq '' ? 'selected' :  ''}>전체</option>
					<c:forEach items="${datas }" var="searchSigunguNm">
						<option value="${searchSigunguNm.sigunguNm }" ${searchSigunguNm.sigunguNm eq parmam.sigunguNm ? 'selected' : ''}>${searchSigunguNm.sigunguNm }</option>
					</c:forEach>
				</select>
			</div>
			<div>
				테마별 <select name="lctCl">
					<option value="" ${param.lctCl eq '' ? 'selected' :  ''}>전체테마</option>
					 <c:forEach items="${datas }" var="obj">
						<option value="${obj.lctCl }" ${param.lctCl eq obj.lctCl ? 'selected' : ''}>${obj.lctCl}</option>
					</c:forEach>
				</select>
				<button type="submit">검색하기</button>
			</div>
		</div>
	</form>
</div>
	<div style="text-align: center; padding: 8px;">
		<c:choose>
			<c:when test="${total ne 0 }">
			${total }개의 정보가 확인됩니다.
		</c:when>
			<c:otherwise>
			조회하신 정보가 없습니다. 다시 검색해주세요.
		</c:otherwise>
		</c:choose>
	</div>
<%--컴팽장 리스트 영역 --%>
<div style="display: flex; justify-content: center; padding: 8px;">

	<table>
		<c:forEach items="${datas }" var="list">
			<tr>
				<%--onclick="location.href='/detail?contentId=${contentId}'" --%>

				<c:choose>
					<c:when test="${not empty list.firstImageUrl }">
						<td><img src="${list.firstImageUrl }" style="height: 100px" /></td>
					</c:when>
					<c:otherwise>
						<td><img src="/resource/image/tent.png" style="height: 100px; width: 120px" /></td>
					</c:otherwise>
				</c:choose>
				<td>${list.facltNm.replace("(주)", " ")}</td>
				<td>${list.lineIntro }(${list.doNm}, ${list.sigunguNm}, ${list.lctCl})</td>
				<td>${list.addr1}</td>
			</tr>
		</c:forEach>
	</table>
</div>

          <%-- 페이지 처리영역 --%>
<div style="text-align: center; font-size: 20px;">
	<c:set var="currentPage" value="${empty param.pageNo ? 1: param.pageNo }" />
	<c:set var="doNmStatus" value="${empty param.doNm ? null : param.doNm }" />
	<c:set var="sigunguNmStatus" value="${empty param.sigunguNm ? null : param.sigunguNm }" />
	<c:set var="lctClStatus" value="${empty param.lctCl ? null : param.lctCl }" />
		
	<!-- 이전 버튼 -->
	<c:if test="${existPrev }">
		<a
			href="/search?pageNo=${start-1 }&doNm=${doNmStatus}&sigunguNm=${sigunguNmStatus}&lctCl=${lctClStatus}">&lt;</a>
	</c:if>

	<!-- 전체페이지 불러오기 -->
	<c:forEach var="p" begin="${start }" end="${last }">
		<c:choose>
			<c:when test="${p eq currentPage }">
				<b style="color: red;">${p }</b>
			</c:when>
			<c:otherwise>
				<a href="/search?pageNo=${p }&doNm=${doNmStatus}&sigunguNm=${sigunguNmStatus}&lctCl=${lctClStatus}">${p }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<!--다음버튼영역  -->
	<c:if test="${existNext }">
		<a href="/search?pageNo=${last+1 }&doNm=${doNmStatus}&sigunguNm=${sigunguNmStatus}&lctCl=${lctClStatus}">&gt;</a>
	</c:if>
</div>