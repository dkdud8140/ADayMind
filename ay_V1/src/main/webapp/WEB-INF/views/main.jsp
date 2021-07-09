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
<link href="${rootPath}/resources/css/main.css?ver-016" rel="stylesheet" />

</head>
<body>

	<div id="background1"></div>

	<%@ include file="header.jsp"%>

	<div id="body_size_box">
		<div class="main_bubble active3">

			<div class="bubble_box">
				<label class="siren" for="siren" onclick> <img src="resources/siren.png"> </label>
				<input type="checkbox" id="siren" />

				<p class="p1">
					<b>“${WRITING.wr_nick}”</b>님이 보내온 하루 생각입니다.
				</p>
				<p class="p2">${WRITING.wr_content}</p>
				<p class="p3">${WRITING.wr_origin}</p>
				<div class="heart-box">
					<div class="content">
					<span id="like_it">♥</span>
					<!-- 	<c:if test="${empty LIKE}"><span id="dont like_it">♡</span></c:if> -->
					<!-- 	<c:if test="${not empty LIKE}"><span id="like_it">♥</span></c:if> -->
						<p>${WRITING.wr_like_count}명이 공감중</p>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="main_modal"></div>
	<div id="siren_box" class="siren_box">
		<h4 id="siren_title">신고하기</h4>
		<form>
			<p>신고 사유를 선택하세요.</p>
			<div>
				<input type="radio" name="r1" id="r1" value="1"><label
					for="r1"> 성적인 콘텐츠</label>
			</div>
			<div>
				<input type="radio" name="r2" id="r2" value="1"><label
					for="r1"> 폭력적 또는 혐오스러운 콘텐츠</label>
			</div>
			<div>
				<input type="radio" name="r3" id="r3" value="1"><label
					for="r1"> 증오 또는 악의적인 콘텐츠</label>
			</div>
			<div>
				<input type="radio" name="r4" id="r4" value="1"><label
					for="r1"> 희롱 또는 괴롭힘</label>
			</div>
			<div>
				<input type="radio" name="r5" id="r5" value="1"><label
					for="r1"> 유해하거나 위험한 행위</label>
			</div>
			<textarea rows="" cols=""></textarea>
			<button id="close">취 소</button>
			<button>신고하기</button>
		</form>
	</div>
</body>


<script>
	let box = document.querySelector(".main_bubble");
	let modal = document.querySelector("div.main_modal");
	
	setTimeout(function() {
		box.classList.remove("active3");
	}, 1000);
	
	
	document.querySelector("label.siren").addEventListener("click",(e)=>{
		modal.style.display = "block";
		document.querySelector("#siren_box").classList.add("visible")
	})
	
</script>

</html>