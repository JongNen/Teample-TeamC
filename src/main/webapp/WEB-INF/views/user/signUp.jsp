<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/commons/top.jsp"%>

<%-- 회원가입 페이지 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<link rel="stylesheet" href="/resource/style.css">
</head>
<body>
	<div class="sign-up-main">
		<form class="sign-up-main1" action="/user/signUp-task" method="post">
			<div class="sign-up-main2">
			
				<div style="color: red; font-weight: 500px;">*전부 필수 입력항목입니다.</div>
				<input class="signup-blank" type="text" name="id"
					placeholder="아이디(영문)" /> <input class="signup-blank"
					type="password" name="pass" placeholder="비밀번호(4자리 이상)" /> <input
					class="signup-blank" type="text" name="name" 
					placeholder="이름(3자리 이상)" />
		
				<div class="sign-up-main3">
					<div>*관심 지역을 선택해주세요(필수 입력항목 아님!)</div>
					<div class="sign-up-seelct">
						<select name="doNm" id="do">
							<option value="" ${param.doNm eq '' ? 'selected' :  ''}>전국</option>
							<c:forEach items="${doList}" var="obj">
								<option value="${obj}" ${obj eq param.doNm ? 'selected' : '' }>${obj}</option>
							</c:forEach>
						</select>
						<%--도영역 끝 --%>
						<%--시,군,구 영역 --%>
						<select name="sigunguNm" data-group="" class="city">
							<option value="" ${param.sigunguNm eq '' ? 'selected' :  ''}>시/군/구</option>
						</select>
						<%--서울 --%>
						<select name="sigunguNm" data-group="서울특별시" class="city">
							<c:forEach items="${seoul }" var="seoul">
								<option value="${seoul}"
									${seoul eq parmam.sigunguNm ? 'selected' : ''}>${seoul }</option>
							</c:forEach>
						</select>
						<%--서울 끝--%>

						<%--부산 --%>
						<select name="sigunguNm" data-group="부산광역시" class="city">
							<c:forEach items="${busan }" var="busan">
								<option value="${busan}"
									${busan eq parmam.sigunguNm ? 'selected' : ''}>${busan }</option>
							</c:forEach>
						</select>
						<%--부산 끝--%>

						<%--대구 --%>
						<select name="sigunguNm" data-group="대구광역시" class="city">
							<c:forEach items="${daegu }" var="daegu">
								<option value="${daegu}"
									${daegu eq parmam.sigunguNm ? 'selected' : ''}>${daegu }</option>
							</c:forEach>
						</select>
						<%--대구 끝--%>

						<%--인천 --%>
						<select name="sigunguNm" data-group="인천광역시" class="city">
							<c:forEach items="${incheon }" var="incheon">
								<option value="${incheon}"
									${incheon eq parmam.sigunguNm ? 'selected' : ''}>${incheon }</option>
							</c:forEach>
						</select>
						<%--인천 끝--%>

						<%--광주 --%>
						<select name="sigunguNm" data-group="광주광역시" class="city">
							<c:forEach items="${gwangju }" var="gwangju">
								<option value="${gwangju}"
									${gwangju eq parmam.sigunguNm ? 'selected' : ''}>${gwangju }</option>
							</c:forEach>
						</select>
						<%--광주 끝--%>

						<%--대전 --%>
						<select name="sigunguNm" data-group="대전광역시" class="city">
							<c:forEach items="${daejeon }" var="daejeon">
								<option value="${daejeon}"
									${daejeon eq parmam.sigunguNm ? 'selected' : ''}>${daejeon }</option>
							</c:forEach>
						</select>
						<%--대전 끝--%>
						<%--울산 --%>
						<select name="sigunguNm" data-group="울산광역시" class="city">
							<c:forEach items="${ulsan }" var="ulsan">
								<option value="${ulsan}"
									${ulsan eq parmam.sigunguNm ? 'selected' : ''}>${ulsan }</option>
							</c:forEach>
						</select>
						<%--울산 끝--%>
						<%--세종 --%>
						<select name="sigunguNm" data-group="세종특별자치시" class="city">
							<c:forEach items="${sejong }" var="sejong">
								<option value="${sejong}"
									${sejong eq parmam.sigunguNm ? 'selected' : ''}>${sejong }</option>
							</c:forEach>
						</select>
						<%--세종 끝 --%>
						<%--경기도 --%>
						<select name="sigunguNm" data-group="경기도" class="city">
							<c:forEach items="${gyeonggi }" var="gyeonggi">
								<option value="${gyeonggi}"
									${gyeonggi eq parmam.sigunguNm ? 'selected' : ''}>${gyeonggi }</option>
							</c:forEach>
						</select>
						<%--경기도 끝--%>
						<%--제주 --%>
						<select name="sigunguNm" data-group="제주특별자치도" class="city">
							<c:forEach items="${jeju }" var="jeju">
								<option value="${jeju}"
									${jeju eq parmam.sigunguNm ? 'selected' : ''}>${jeju }</option>
							</c:forEach>
						</select>
						<%--제주 끝--%>
						<%--강원도 --%>
						<select name="sigunguNm" data-group="강원도" class="city">
							<c:forEach items="${gangwon }" var="gangwon">
								<option value="${gangwon}"
									${gangwon eq parmam.sigunguNm ? 'selected' : ''}>${gangwon }</option>
							</c:forEach>
						</select>
						<%--강원도 끝--%>
						<%--충청복도 --%>
						<select name="sigunguNm" data-group="충청북도" class="city">
							<c:forEach items="${chungbuk }" var="chungbuk">
								<option value="${chungbuk}"
									${chungbuk eq parmam.sigunguNm ? 'selected' : ''}>${chungbuk }</option>
							</c:forEach>
						</select>
						<%--충청복도 끝--%>
						<%--충청남도 --%>
						<select name="sigunguNm" data-group="충청남도" class="city">
							<c:forEach items="${chungnam }" var="chungnam">
								<option value="${chungnam}"
									${chungnam eq parmam.sigunguNm ? 'selected' : ''}>${chungnam }</option>
							</c:forEach>
						</select>
						<%--충청남도 끝--%>
						<%--전라북도 --%>
						<select name="sigunguNm" data-group="전라북도" class="city">
							<c:forEach items="${jeonbuk }" var="jeonbuk">
								<option value="${jeonbuk}"
									${jeonbuk eq parmam.sigunguNm ? 'selected' : ''}>${jeonbuk }</option>
							</c:forEach>
						</select>
						<%--전라북도 끝--%>
						<%--전라남도 --%>
						<select name="sigunguNm" data-group="전라남도" class="city">
							<c:forEach items="${jeonnam }" var="jeonnam">
								<option value="${jeonnam}"
									${jeonnam eq parmam.sigunguNm ? 'selected' : ''}>${jeonnam }</option>
							</c:forEach>
						</select>
						<%--전라남도 끝--%>
						<%--경상북도 --%>
						<select name="sigunguNm" data-group="경상북도" class="city">
							<c:forEach items="${gyeongbuk }" var="gyeongbuk">
								<option value="${gyeongbuk}"
									${gyeongbuk eq parmam.sigunguNm ? 'selected' : ''}>${gyeongbuk }</option>
							</c:forEach>
						</select>
						<%--경상북도 끝--%>
						<%--경상남도 --%>
						<select name="sigunguNm" data-group="경상남도" class="city">
							<c:forEach items="${gyeongnam }" var="gyeongnam">
								<option value="${gyeongnam}"
									${gyeongnam eq parmam.sigunguNm ? 'selected' : ''}>${gyeongnam }</option>
							</c:forEach>
						</select>
						<%--경상남도 끝--%>
						<%--시,군,구 영역 끝 --%>
					</div>
				</div>
				<div style="padding-top:0.7em;">
					<button class="sign-up-button" type="submit">가입하기</button>
				</div>
			</div>


		</form>
	</div>
	<script>
		//do 영역의 select 태그에 onchange 이벤트 추가
		document.querySelector("#do").onchange = function(evt) {
			// 선택한 도시값 가져오기
			const selectedCity = evt.target.value;

			// 시, 군, 구 영역의 select 태그들을 찾아서 처리
			document.querySelectorAll(".city").forEach(function(one) {
				if (one.dataset.group != selectedCity) {
					one.name = "";
					one.style.display = "none";
				} else {
					one.name = "sigunguNm";
					one.style.display = "";
				}
			});
		};
		//do 영역의 select 태그에 change 이벤트 발생시키기
		document.querySelector("#do").dispatchEvent(new Event("change"));

		// 시, 군, 구 영역의 select 태그에 값 넣어주기
		document.querySelectorAll(".city").forEach(function(one) {
			if (one.dataset.group === document.querySelector("#do").value) {
				one.name = "sigunguNm";
				one.value = "${param.sigunguNm}";
			} else {
				one.style.display = "none";
			}
		});
	</script>


	<c:if test="${param.cause eq 'valid' }">
		<script>
			alert("잘못된 입력입니다 !!");
		</script>
	</c:if>

</body>
</html>

