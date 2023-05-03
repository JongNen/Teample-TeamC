<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ include file="/WEB-INF/views/commons/top.jsp"%>



<div style="padding: 4em; text-align: center;">
	<form action="/write-task" method="post">
		<div>
			<input class="title-blank" type="text" name="title" placeholder="제목">
		</div>
		<div style="padding: 1em;">
			<input class="postBody-blank" type="text" placeholder="글 내용" 
				style="width: 400px; height: 300px;" name="postBody">
		</div>
		<button class="but" type="submit">작성하기</button>
	</form>
	<div>
		<button class="but" type="submit">이미지 업로드하기</button>
	</div>
</div>

<c:if test="${writesuccess eq true }">
	<script type="text/javascript">
		alert('글이 등록되었습니다');
	</script>

</c:if>
