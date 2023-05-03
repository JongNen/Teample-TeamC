<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/commons/top.jsp"%>

<%-- 회원가입 페이지 --%>


<div style="padding: 5em; text-align: center;">
	
	<form action="/user/signUp-task" method="post">
	<span style="color: red">*전부 필수 입력항목 입니다</span>
		<p>
			<input class="signUp-balnk" type="text" name="id" placeholder="아이디(영문)" />
		</p>
		<p>
			<input class="signUp-balnk" type="password" name="pass" placeholder="비밀번호(4자리 이상)" />
		</p>
		<p>
			<input class="signUp-balnk" type="text" name="name" placeholder="이름(3자리 이상)" />
		</p>
		<p>
			<input class="signUp-balnk" type="text" name="area" placeholder="관심지역" />
		</p>
		<div style="padding: 0.7em;">
		<button class="sign-button" type="submit">가입하기</button>
		</div>
	</form>
</div>

<c:if test="${param.cause eq 'valid' }">
	<script>
		alert("경고!!");
	</script>
</c:if>
