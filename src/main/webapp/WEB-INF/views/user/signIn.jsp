<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/commons/top.jsp"%>

<%-- 로그인페이지 --%>
<link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro-v6@44659d9/css/all.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
<div style="padding-top: 5em;">
	<form action="/user/signIn-task" method="post">
		<div style="text-align: center;">
			<div style="padding-left: 14%; margin-bottom: 0.17em;">
				<input type="checkbox" name="check"> <small>자동로그인하기</small>
			</div>
			<div>
				<input class="loginId" type="text" name="id" placeholder="아이디"
					value="${idSave }" required />
			</div>
			<input class="loginPass" type="password" name="pass"
				placeholder="비밀번호" />
			<div style="margin-top: 1em;">
				<button class="sign-button" type="submit">
					<b>로그인</b>
				</button>
			</div>
			<div style="margin: 1em;">
				혹시 아이디가 없으신가요? <a href="/user/signUp">회원가입하러가기</a>
			</div>
		</div>
	</form>
</div>

