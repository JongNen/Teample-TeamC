<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 로그인페이지 --%>
<!DOCTYPE>
<html>
<head>
  <style>
   * {
  		font-family: 'Pretendard-Regular';
  	}
  </style>
<title>브라우저 탭의 제목</title>
<link rel="stylesheet" href="/resource/style.css">
</head>

<body>
  <div style="text-align: center;" >
  <img style="width: 600px; padding-top: 4em; padding-bottom:6em;" class="backimg-linear"src="/resource/image/CSlogo_outline.png"/>
  </div>
  	<form action="/user/signIn-task" method="post">
      <div style="text-align : center;">
  		<span style="text-align: right;"><small>자동로그인하기</small></span><input type="checkbox" name="check" />
  	<div>
  		<input  class ="loginId"type="text" name="id" placeholder="아이디" value="${idSave }" required/>
  	</div>
  		<input class="loginPass"type="password" name="pass" placeholder="비밀번호"/>
  	<div style="margin-top: 0.7em;">
  		<button class="but"type="submit">로그인</button>
  	</div>
  	<div>
  		혹시 아이디가 없으신가요? <a href="/user/signUp">회원가입하러가기</a>
  	</div>
  </div>
  	</form>
</body>
</html>