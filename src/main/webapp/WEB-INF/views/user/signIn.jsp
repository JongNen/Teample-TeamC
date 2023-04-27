<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 로그인페이지 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/user/signIn-task" method="post">
		<input type="text" name="id" placeholder="아이디" value="${idSave }" required/>
		<input type="password" name="pass" placeholder="비밀번호"/>
		<input type="checkbox" name="check" />	
		<button type="submit">로그인</button>
	</form>
	<c:if test="${param.error eq '1' }">
		<span style="color: red"><b>아이디 혹은 비밀번호가 일치하지 않습니다.</b></span>
	</c:if>
</body>
</html>