<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>M.O.I.M</title>

</head>
<body>
	
		<form action="/user/modify" method="post" >
			<h2>M.O.I.M</h2>
			<div style="margin: 0.4em">
				<input type="text" placeholder="아이디" name="id" 
					class="join-input" required />
			</div>
			<div style="margin: 0.4em">
				<input type="password" placeholder="비밀번호" name="pass" class="join-input" />
			</div>
			
			<div style="margin: 0.4em">
				<input type="name" placeholder="닉네임" name="name" class="join-input" />
			</div>
			
			<div style="margin: 0.4em">
				<input type="area" placeholder="지역" name="area" class="join-input" />
			</div>

			<div style="margin: 0.4em">
				<button type="submit" class="join-btn">다음</button>
			</div>
		</form>
		<p style="flex: 0.1">
			 <a href="/user/delete">삭제하기</a>
		</p>

	
	
	
</body>
</html>