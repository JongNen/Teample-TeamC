<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- 회원가입 페이지 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/user/signUp-task" method="post">
		<input type="text" name="id" placeholder="아아디(영문)" /> 
		<input type="password" name="pass" placeholder="비밀번호(4자리 이상)" /> 
		<input type="text" name="name" placeholder="이름(3자리 이상)" /> 
		<input type="text" name="area" placeholder="관심지역" />
		<button type="submit">가입하기</button>
	</form>
	<c:if test="${param.cause eq 'valid' }">
		<script>
		  alert("경고!!");
		</script>
	</c:if>
</body>
</html>