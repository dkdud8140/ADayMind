<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하루생각 입력하기</title>
<link href="${rootPath}/resources/css/insert.css?ver-022"
	rel="stylesheet" />
</head>
<body>
	<%@ include file="header.jsp"%>

	<div id="b_container2">
		<section id="b2_con" class="active3">
			<!-- bottom 상자 위로 위동 -->
			<div id="bottom"></div>
			<div id="imgntext">
				<div id="grid">
					<div id="coment">
						<h3>"익명"님의 이름으로 하루생각을 보냅니다.</h3>
					</div>
					<div>
						<input type="text" id="text1" class="img0" placeholder="하루생각을 입력하세요." />
					</div>
					<div>
						<input type="text" id="text2" class="img0" placeholder="출처를 입력하세요." />
					</div>
				</div>
			</div>
			<div>
			<button type="button" class="save">보내기</button>
			</div>
		</section>
	</div>
</body>
<script>
	let box = document.querySelector("#b2_con");
	setTimeout(function() {
		box.classList.remove("active3");
	}, 1000);
</script>
</body>
</html>