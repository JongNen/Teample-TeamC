<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/resource/style.css">
</head>
<body>

	<div class="icon-position">
		<c:if test="${fn:contains(camp.lctCl, '강') }">
			<img class="icon-size" src="/resource/icon/river.png" />
		</c:if>
		<c:if test="${fn:contains(camp.lctCl, '계곡') }">
			<img class="icon-size" src="/resource/icon/waterfall.png" />
		</c:if>
		<c:if test="${fn:contains(camp.lctCl, '도심')}">
			<img class="icon-size" src="/resource/icon/city.png" />
		</c:if>
		<c:if test="${fn:contains(camp.lctCl, '산')}">
			<img class="icon-size" src="/resource/icon/mountain.png" />
		</c:if>
		<c:if test="${fn:contains(camp.lctCl, '섬')}">
			<img class="icon-size" src="/resource/icon/island.png" />
		</c:if>
		<c:if test="${fn:contains(camp.lctCl, '숲')}">
			<img class="icon-size" src="/resource/icon/forest.png" />
		</c:if>
		<c:if test="${fn:contains(camp.lctCl, '해변')}">
			<img class="icon-size" src="/resource/icon/beach.png" />
		</c:if>
	</div>
	<div class="icon-position">
		<c:choose>
			<c:when test="${fn:contains(camp.lctCl, '카라반') }">
				<img class="icon-size" src="/resource/icon/van.png" />
			</c:when>
			<c:otherwise>
				<img class="icon-size" src="/resource/icon/tent.png" />
			</c:otherwise>
		</c:choose>
	</div>
	<div class="icon-position">
		<c:if test="${fn:contains(camp.sbrsCl, '전기') }">
			<img class="icon-size-etc" src="/resource/icon/electricity.png" />
		</c:if>
		<c:if test="${fn:contains(camp.sbrsCl, '무선인터넷') }">
			<img class="icon-size-etc" src="/resource/icon/wifi.png" />
		</c:if>
		<c:if test="${fn:contains(camp.sbrsCl,'장작판매') }">
			<img class="icon-size-etc" src="/resource/icon/firewood.png" />
		</c:if>
		<c:if test="${fn:contains(camp.sbrsCl, '트램플린') }">
			<img class="icon-size-etc" src="/resource/icon/trampoline.png" />
		</c:if>
		<c:if test="${fn:contains(camp.sbrsCl, '산책로') }">
			<img class="icon-size-etc" src="/resource/icon/river-trail.png" />
		</c:if>
		<c:if test="${fn:contains(camp.sbrsCl, '운동시설') }">
			<img class="icon-size-etc" src="/resource/icon/gym.png" />
		</c:if>
		<c:if test="${fn:contains(camp.sbrsCl, '온수') }">
			<img class="icon-size-etc" src="/resource/icon/hotwater.png" />
		</c:if>
		<c:if test="${fn:contains(camp.sbrsCl, '물놀이'||'물놀이장') }">
			<img class="icon-size-etc" src="/resource/icon/swimming-pool.png" />
		</c:if>
		<c:if test="${fn:contains(camp.sbrsCl, '놀이터'||'운동장') }">
			<img class="icon-size-etc" src="/resource/icon/playground.png" />
		</c:if>
		<c:if test="${fn:contains(camp.sbrsCl, '마트'||'편의점') }">
			<img class="icon-size-etc" src="/resource/icon/basket.png" />
		</c:if>
		
	</div>

</body>
</html>