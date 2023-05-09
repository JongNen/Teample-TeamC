<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/commons/top.jsp"%>

<%-- 자유게시판 글쓰기 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<link rel="stylesheet" href="/resource/style.css">
</head>
<body>
	<div class="write-main">
		<div class="write-range">
			<form action="/write-task" class="write-content">
				<input class="write-blank" type="text" name="title" placeholder="제목">
				<textarea class="write-blank1" placeholder="내용을 입력해주세요"
					name="postBody"></textarea>
				<div class="write-button-position">
					<button class="sign-button" type="submit">등록하기</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>


<c:if test="${param.cause eq 'valid' }">
	<script>
		alert("잘못된 입력입니다 !!");
	</script>
</c:if>





