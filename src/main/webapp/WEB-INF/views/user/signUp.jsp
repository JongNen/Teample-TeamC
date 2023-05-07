<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/commons/top.jsp"%>

<%-- 회원가입 페이지 --%>
<div style="padding-top: 3em;">
	<form style="display: flex; justify-content: center;"
		action="/user/signUp-task" method="post">
		<div
			style="text-align: center; justify-content: center; display: flex; flex-direction: column; gap: 12px; width: 40rem;">
			<div style="color: red">*전부 필수입력항목입니다.</div>
			<input class="signup-blank" type="text" name="id"
				placeholder="아이디(영문)" /> <input class="signup-blank"
				type="password" name="pass" placeholder="비밀번호(4자리 이상)" /> <input
				class="signup-blank" type="text" name="name"
				placeholder="이름(3자리 이상)" /> <input class="signup-blank" type="text"
				name="area" placeholder="관심지역" />
			<div
				style="display: flex; width: 100%; align-items: center; jusify-content: center;"
				class="signup-bottom-position">
				<button class="sign-button" type="submit">가입하기</button>
			</div>
		</div>
	</form>
</div>

<c:if test="${param.cause eq 'valid' }">
	<script>
		alert("경고!!");
	</script>
</c:if>
