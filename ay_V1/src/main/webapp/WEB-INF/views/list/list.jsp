<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>하루생각</title>
<link rel="stylesheet" href="${rootPath}/resources/css/list.css?ver=003" />
<script>let pathName = "${title}";</script> <!-- 6월 13일 -->
<script defer src="${rootPath}/resources/js/list.js?ver-004"></script>

</head>

<body>

	<%@ include file="../header.jsp"%>

	<!-- section 시작-->
	<div id="modal"></div>
	<section>
	
		<div id="b_container" class="active3">
		       <!-- 리스트 타이틀 6월 13일 -->
	        <div id="list_title">
	          <span id="list_span"></span>
	          <span id="list_span2"></span>
	        </div>
       			<!-- 리스트 타이틀 끝-->
			<c:choose>
				<c:when test="${title eq '인기 하루 생각'}">
					<%@ include file="/WEB-INF/views/list/bestlist.jsp"%>
				</c:when>
				<c:when test="${title eq '내가 쓴 하루 생각'}">
					<%@ include file="/WEB-INF/views/list/iwrite.jsp"%>
				</c:when>
				<c:when test="${title eq '나의 공감리스트'}">
					<%@ include file="/WEB-INF/views/list/ilike.jsp"%>
				</c:when>
			</c:choose>
		</div>
	</section>
</body>
<script> // 6월 13일
let bcon1 = document.getElementById("b_container");
setTimeout(function () {
		bcon1.classList.remove("active3");
	}, 1000);
</script>
</html>	