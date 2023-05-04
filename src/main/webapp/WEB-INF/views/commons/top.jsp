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
<link
	href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro-v6@44659d9/css/all.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
</head>
<body>
	<div style="text-align: center;">
		<div
			style="display: flex; flex-direction: row; justify-content: flex-end; margin-right: 40px;">
			<c:choose>
				<c:when test="${sessionScope.logon }">
					<div id="status">
						<span style="font-size: 16px;"><b>${logonUser.id }님
								환영합니다</b></span><small style="font-size: 10px"> ▼</small>
						<div class="menu" id="pop" style="display: none">
							<div>
								<a href="/user/myPage?name=${logonUser.name}"><i
									class="fa-regular fa-square-user"></i>&nbsp;&nbsp;마이페이지</a>
							</div>
							<hr>
							<div>
								<a href="/user/signOut"><i
									class="fa-solid fa-right-from-bracket"></i>&nbsp;로그아웃하기</a>
							</div>
						</div>
					</div>

				</c:when>
				<c:otherwise>
					<a href="/user/signIn">로그인하기 </a> / 
		
		<a href="/user/signUp"> 회원가입하기</a>
				</c:otherwise>

			</c:choose>

		</div>
		<a href="/index"> <img style="width: 600px; padding-top: 4em;"
			src="/resource/image/CSlogo_outline.png" />
		</a>
	</div>

	<script type="text/javascript">
		document.querySelector("#status").onmouseover = function() {
			console.log("!!");
			document.querySelector("#pop").style.display = "";
		}
		document.querySelector("#status").onmouseout = function() {
			console.log("!!");
			document.querySelector("#pop").style.display = "none";
		}
	</script>

</body>
</html>
