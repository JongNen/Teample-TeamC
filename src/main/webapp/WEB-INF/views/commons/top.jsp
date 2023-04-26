<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- top view --%>


<!DOCTYPE html>
<html>
<head>
<style>
 * {
		font-family: 'Pretendard-Regular';
	}
</style>
<meta charset="UTF-8">
<title>캠핑스케치</title>
<link rel="stylesheet" href="/resource/style.css">
</head>
<body>

<div style="text-align: center;">
<div style="text-align: right; padding: 1em; margin-right: 22px;">
<c:choose>
	<c:when test="${sessionScope.logon }">
		<select>
			<option>마이페이지</option>
			<option>로그아웃하기</option>
		</select>
	</c:when>
	<c:otherwise>
		<a href="">로그인하기</a>
		/
		<a href="">회원가입하기</a>
		 
	</c:otherwise>

</c:choose>

</div>
<img style="width: 600px; padding-top: 4em;"src="/resource/image/CSlogo_outline.png"/>
</div>
	


</body>
</html>	