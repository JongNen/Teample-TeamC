<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<section style="text-align: center;">
		<nav
			style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; padding: 8px 16px; gap: 16px;">
			<c:choose>
				<c:when test="${sessionScope.logon }">
					<div id="status" style="position: relative">
						<span
							style="font-size: 14px; display: flex; gap: 8px; align-items: center; cursor: default;"><b>${logonUser.id }님
								환영합니다</b> <small style="font-size: 10px"> ▼</small> </span>
						<div class="menu" id="pop" style="display: none">
							<div>
								<a href="/user/myPage?name=${logonUser.name}"><i
									class="fa-regular fa-square-user"></i>&nbsp;&nbsp;마이페이지</a>
							</div>
							<div>
								<a href="/board"><i class="fa-regular fa-memo-pad"></i>&nbsp;자유게시판</a>
							</div>
							<div>
								<a href="/user/signOut"><i
									class="fa-solid fa-right-from-bracket"></i>&nbsp;로그아웃하기</a>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div style="display: flex; gap: 16px;">
						<a href="/user/signIn" class="text-button"> <img
							src="https://api.iconify.design/ic:round-person.svg" /> 로그인
						</a> <a href="/user/signUp" class="text-button"> <img
							src="https://api.iconify.design/ic:baseline-person-add-alt-1.svg" />
							회원가입
						</a>
					</div>
				</c:otherwise>
			</c:choose>
		</nav>
		<a href="/index"> <img style="width: 600px; padding-top: 4em;"
			src="/resource/image/CSlogo_outline.png" />
		</a>
	</section>

	<script type="text/javascript">
		const popUp = document.querySelector("#pop");

		document.querySelector("#status").onclick = function() {
			popUp.style.display = "flex";
		}

		document.querySelector("#status").onmouseleave = function() {
			popUp.style.display = "none";
		}
	</script>


</body>
</html>
