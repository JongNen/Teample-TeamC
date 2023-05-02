<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>M.O.I.M</title>

</head>
<body>
	<div>ID = ${sessionScope.logonUser.id}</div>
	<div>NAME = ${sessionScope.logonUser.name}</div>
	<a href="/user/delete?id=${sessionScope.logonUser.id}">회원탈퇴</a>


	<form action="/user/modify" method="post">

		<h2>변경하기</h2>
		<div style="margin: 0.4em">
			<input type="hidden" name="id" value="${sessionScope.logonUser.id}">
			<input type="password" placeholder="비밀번호" name="pass"
				class="join-input" />
		</div>

		<div style="margin: 0.4em">
			<input type="name" placeholder="닉네임" name="name" class="join-input" />
		</div>

		<div style="margin: 0.4em">
			<input type="area" placeholder="지역" name="area" class="join-input" />
		</div>

		<div style="margin: 0.4em">
			<button type="submit" class="join-btn">정보수정</button>
		</div>
	</form>
	<div>
				<c:forEach items="${myPost}" var="post" >
					<p>${post.title}</p>
				</c:forEach>
	</div>



	<a href="/index">홈으로</a>






</body>
</html>