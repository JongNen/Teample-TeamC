<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<form action="/write-task" method="post">
<div>
글 제목<input type="text" name="title">
</div>
<div>
<p>
글내용
</p>
<%--캠프 컨텐트 아이디를 기준으로 글쓰기를 넘김 --%>
<input type="hidden" name="target" value="${camp.contentId }"/>
<textarea style="width: 400px; height: 300px;" name="postBody">	</textarea>
<button type="submit">작성하기</button>
</div>
</form>
<div>
<form action ="/pload" method="post" enctype="multipart/form-data">
<input type="file" name="IMG">
</form>
</div>

</body>
</html>