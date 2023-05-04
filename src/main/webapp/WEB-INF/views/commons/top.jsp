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
					<div>
						<b>${logonUser.id }님 환영합니다.</b>
					</div>
					<select id="select">
						<option value="option1">이동하기</option>
						<option value="option2">마이페이지</option>
						<option value="option3">로그아웃하기</option>
					</select>
				</c:when>
				<c:otherwise>
					<a href="/user/signIn">로그인하기 </a>/
		
		<a href="/user/signUp"> 회원가입하기</a>
				</c:otherwise>

			</c:choose>

		</div>
		<img style="width: 600px; padding-top: 4em;"
			src="/resource/image/CSlogo_outline.png" />
	</div>

	<script type="text/javascript">
	if(${sessionScope.logon eq true}){
		document.querySelector("#select").addEventListener("change", function(){
		//선택한 값을 사용했을때 작업 수행
		
		let selectValue = this.value;
		
		if(selectValue === "option1") {
						
		} else if(selectValue === "option2"){
			window.location.href="/user/myPage?name=${logonUser.name}";
		}else if(selectValue === "option3"){
			window.location.href="/user/signOut";
		}
	});
	}
</script>

</body>
</html>
