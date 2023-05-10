<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--후기글 자세히보기 --%>

<!DOCTYPE html>
<html>
<head>
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
	<div class="postDetail-position">
		<div class="title">${post.title}</div>
		<div style="text-align: right;">
			<i class="fa-solid fa-user" style="margin: 4px;"></i>${post.writerName }
			| <i class="fa-light fa-calendar-pen" style="margin: 4px;"></i>${post. writed}</div>
		<hr />
		<div style="padding-left: 1em; padding-top: 1.7em;">


			<c:if test="${post.img != null }">
				<div>
					<img style="width: 25%;" src="/upload/${post.img}">
				</div>
			</c:if>
			<div style="padding-top: 1em;">${post.postBody }</div>
		</div>
		<div style="padding-top: 20em;">
			<c:choose>
				<c:when test="${post.writerId eq logonUser.id}">
					<p style="text-align: right;">
						<a href="/modifyReview?number=${post.postNum }">수정</a> | <a
							href="/deleteReview?number=${post.postNum }">삭제</a>
					</p>
				</c:when>
			</c:choose>
			<hr />
			<form action="/board">
				<p style="text-align: right;">
					<button class="but">목록으로 돌아가기</button>
				</p>
			</form>
		</div>
	</div>
</body>
</html>