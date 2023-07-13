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
		<div class="board-title">
			자유게시판
			<div class="board-subtitle">캠핑에 관한 이야기를 자유롭게 나누어보세요</div>
		</div>
		<div style="text-align: center; margin-left: 15em;">
			<div class="post-title">
				<div class="post-t1">번호</div>
				<div class="post-t2">제목</div>
				<div class="post-t3">작성자</div>
				<div class="post-t3">작성일</div>
			</div>
			<div class="post-content">
				<c:forEach items="${list }" var="li" varStatus="num">
					<div class="post-contentmain">
						<div class="post-content1">${param.p eq 1 ? num.count : (idx - 10) + num.count}</div>
						<div class="post-content2">
							<a href="/boardDetail?number=${li.postNum }">${li.title }</a>
						</div>
						<div class="post-content3">${li.writerName }</div>
						<div class="post-content3">
							<fmt:formatDate value="${li.writed }" pattern="yyyy-MM-dd" />
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="bord-bottom-position">
			<div class="write-button-position">
				<form action="/write">
					<c:if test="${sessionScope.logon}">
						<button class="write-button" type="submit">글쓰러가기</button>
					</c:if>
				</form>
			</div>


			<%-- 페이징처리 --%>
			<div style="padding: 1em; text-align: center;">
				<c:set var="currentPage" value="${empty param.p ? 1: param.p }" />


				<!-- prev 처리 -->

				<c:if test="${existPrev}">
					<a href="/board?p=${start-1}">이전</a>
				</c:if>

				<!-- 페이지 넘버 처리 -->
				<c:forEach begin="${start}" end="${last}" var="pg">
					<c:choose>
						<c:when test="${pg eq currentPage }">
							<b style="color: #05BFDB;">${pg }</b>
						</c:when>
						<c:otherwise>
							<a href="/board?p=${pg }">${pg }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<!-- next 처리 -->

				<c:if test="${existNext}">
					<a href="/board?p=${last + 1}">다음</a>
				</c:if>

			</div>
		</div>
	</div>

</body>
</html>