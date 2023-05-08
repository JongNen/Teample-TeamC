<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/top.jsp"%>

<%-- 후기 게시판 --%>
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
	<div style="text-align: center;">
		<div class="board-title">캠핑장후기게시판</div>
		<div style="text-align: center; margin-left: 15em;">
			<div class="post-title">
				<div class="post-t1">게시글번호</div>
				<div class="post-t2">제목</div>
				<div class="post-t3">작성자</div>
				<div class="post-t3">작성일</div>
			</div>
			<div class="post-content">
				<c:forEach items="${list }" var="li">
					<div class="post-contentmain">
						<div class="post-content1">${li.postNum }</div>
						<div class="post-content2">
							<a href="/boardDetail?number=${li.postNum }">${li.title }</a>
						</div>
						<div class="post-content3">${li.writerName }</div>
						<div class="post-content3">${li.writed }</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<%-- 페이징처리 --%>
		<div style="padding: 1em; text-align: center;">
			<c:set var="currentPage" value="${empty param.p ? 1: param.p }" />
			<c:choose>
				<c:when test="${param.p eq null|| param.p eq 1 || param.p <10}">
				</c:when>
				<c:otherwise>
					<a href="/board"><i class="fa-solid fa-chevrons-left"></i></a>
					<a href="/board?p=${previousPage }"> <i
						class="fa-solid fa-chevron-left"></i></a>
				</c:otherwise>
			</c:choose>
			<div class="bord-bottom-position">
				<div class="write-button-position">
					<form action="/write">
						<button class="write-button" type="submit">글쓰러가기</button>
					</form>
				</div>

				<c:forEach begin="1" end="${totalPage}" var="pg">
					<c:choose>
						<c:when test="${pg eq currentPage }">
							<b style="color: #05BFDB;">${pg }</b>
						</c:when>
						<c:otherwise>
							<a href="/board?p=${pg }">${pg }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${currentPage eq totalPage }">
					</c:when>
					<c:otherwise>
						<a href="/board?p=${nextPage }"><i
							class="fa-solid fa-chevron-right"></i></a>
						<a href="/board?p=${totalPage }"><i
							class="fa-solid fa-chevrons-right"></i></a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>