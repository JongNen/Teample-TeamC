<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/commons/top.jsp"%>

<div style="padding: 4em; text-align: center;">
	<form action="/modifyReview-Task" method="post">
		<input type="hidden" name="number" value="${post.postNum }">
		<div>
			<input class="title-blank" type="text" name="title"
				value="${post.title }">
		</div>
		<div style="padding: 1em;">
			<input class="postBody-blank" type="text"
				style="width: 400px; height: 300px;" name="postBody"
				value="${post.postBody }">
		</div>
		<button class="but" type="submit">수정하기</button>
	</form>
	<div>
		<button class="but" type="submit">이미지 업로드하기</button>
	</div>
</div>

<c:if test="${param.cause eq 'valid' }">
	<script>
		alert("잘못된 입력입니다 !!");
	</script>
</c:if>