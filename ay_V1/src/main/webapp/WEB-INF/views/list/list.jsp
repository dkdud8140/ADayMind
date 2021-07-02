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
       			
       		<c:forEach items="${LISTS}" var="LIST" >	
				<div class="board item1">
					<a class="card"> <img class="abc"
						src="${rootPath}/resources/board_white.svg" />
						<article>
							<img class="profile" src="${rootPath}/resources/profile.png" />
							<h1>${LIST.vl_content}</h1>
							<span> <img class="heart"
								src="${rootPath}/resources/heart_red.png" /> "${LIST.vl_like_count}"명이
								공감하였어요!
							</span>
						</article>
					</a>
				</div>
			</c:forEach>
			
			
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