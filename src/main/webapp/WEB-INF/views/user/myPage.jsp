<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<%-- 마이페이지 --%>
</head>
<body>
	<div>${sessionScope.logonUser.name}님 로그인중</div>
	<div>@${sessionScope.logonUser.id}</div>
	<div>관심지역 = ${sessionScope.logonUser.area }</div>
	<a href="/user/delete?id=${sessionScope.logonUser.id}">회원탈퇴</a>


	<form action="/user/modify" method="post">

		<h2>변경하기</h2>
		<div style="margin: 0.4em">
			<input type="hidden" name="id" value="${sessionScope.logonUser.id}">
			<input type="password" placeholder="비밀번호" name="pass"
				class="join-input" />
		</div>

		<div style="margin: 0.4em">
			<input type="name" placeholder="닉네임" name="name" class="join-input"/>
		</div>

		<div style="margin: 0.4em">
			<input type="area" placeholder="지역" name="area" class="join-input"/>
		</div>

		<%-- <select id="main" data-name="도" data-gender="m">
			<c:forTokens items="${campingList }" delims="," var="one">
				<option>${one.doNm }</option>
			</c:forTokens>
			
		</select> 
		
		<select class="sub" data-group="시군구">
			<c:forTokens items="${campingList }" delims="," var="one">
				<option>${one.sigunguNm }</option>
			</c:forTokens>
		</select>
 --%>
		<div style="margin: 0.4em">
			<button type="submit" class="join-btn">정보수정</button>
		</div>
	</form>
	<div>
		<c:forEach items="${myPost}" var="post">
		
			<p onclick="location.href='/detail?contentId=${list.contentId}'">${post.campname}</p>
		</c:forEach>
	</div>



	<a href="/index">홈으로</a>



<script>
	
	document.querySelector("#main").onchange = function(evt) {
		console.log(this.dataset);
		console.log(this.dataset.name);
		
		evt.target == this;	// 여기서는 evt.target 이나 this나 같을거임.
		console.log(evt.target.value);
		
		document.querySelectorAll(".sub").forEach(function(one) {
			if(one.dataset.group != evt.target.value) {
				one.style.display="none";
			}else {
				one.style.display="";
			}
				
		});
		
		
	}
	
	/*
		document.querySelectorAll(".sub").forEach( function(one) {
			one.style.display = "none";	// ""로 설정하면 나옴.
		});
	*/
	</script>
</body>
</html>