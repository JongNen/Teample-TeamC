<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/top.jsp" %>

<%-- 후기 게시판 --%>

<div style="text-align: center;">
<h2>후기게시판</h2>
	<table style="text-align: center;">
		<tr style="text-align: center;" >
			<th>게시글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>	
	</table>
		<c:forEach items="${list }" var="li">
			<tr style="text-align: center;">
				<td>${li.postNum }
				<td><a href="/boardDetail?number=${li.postNum }">${li.title }</a></td>
				<td>${li.writerName }</td>
				<td>${li.writed }</td>
				<br/>
			</tr>
		</c:forEach>

</div>
