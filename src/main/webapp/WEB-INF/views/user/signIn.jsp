<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/commons/top.jsp"%>

<%-- 로그인페이지 --%>
<link
	href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro-v6@44659d9/css/all.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
<div style="padding-top: 5em;">
	<form style="display: flex; justify-content: center;"
		action="/user/signIn-task" method="post">
		<div
			style="text-align: center; display: flex; flex-direction: column; gap: 12px; width: 20rem;">
			<input class="login-blank" type="text" name="id" placeholder="아이디"
				value="${idSave }" required /> <input class="login-blank"
				type="password" name="pass" placeholder="비밀번호" />
				<c:if test="${param.error eq 1 }">
					<h4 style="color: red">아이디와 비밀번호를 다시 확인해주세요.</h4>
				</c:if>
			<div
				style="font-size: 14px; display: flex; gap: 8px; align-items: center;">
				<input type="checkbox" name="check" id="auto-login"> <label
					style="cursor: pointer;" for="auto-login">ID 저장</label>
			</div>
			<button class="sign-button" type="submit">
				<b>로그인</b>
			</button>
			<div style="font-size: 14px;">
				혹시 아이디가 없으신가요? <a href="/user/signUp"
					style="color: #0ea5e9; text-decoration: underline;">회원가입하러가기</a>
			</div>
		</div>
	</form>
</div>

