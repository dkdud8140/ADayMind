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
<link href="${rootPath}/resources/css/main.css?ver-013" rel="stylesheet" />

<style>
@import url("basic.css");
body {
	background-image: url("resources/BG-V2_1.png");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
	overflow: hidden;
}

.main_bubble {
	width: 40%;
	height: 75%;
	margin: 2.5% auto;
	transition: all 1s;
	background: url("resources/bubbleAndperson.png") no-repeat;
	background-size: 100%;
}

.bubble_box {
	font-family: "cafe24sa";
	width: 100%;
	height: 45%;
	align-content: center;
	padding: 4%;
	position: relative;
}

.p1 {
	color: #3f6d84;
	font-size: 20px;
	text-align: center;
	margin: 0 auto;
	height: 10%;
}

.p2 {
	color: black;
	font-size: 30px;
	text-align: center;
	width: 75%;
	margin: 2.5% auto;
	line-height: 150%;
	word-break: keep-all;
	height: 75%;
	overflow: auto;
}

.p3 {
	color: black;
	font-size: 20px;
	text-align: center;
	margin: 2.5% auto;
	height: 12%;
}

.siren {
	width: 13%;
	position: absolute;
	left: 10%;
	top: 13%;
	user-select: none;
	cursor: pointer;
}

.siren img {
	width: 30%;
}

#siren {
	display: none;
}


h4#siren_title {
	border-bottom : 1px solid #ccc;
	padding: 10px;
	margin-bottom: 10px;
	color: #3f6d84;
}


#body_size_box {
	width: 100vw;
	height: 85vh;
	perspective: 1500px;
	background: rgba(0, 0, 0, 0);
}



.main_bubble.active {
	transform: translateZ(-500px);
}

.main_bubble.active2 {
	transform: translateZ(-1500px) scale(0);
	transform-origin: 50% 0%;
}

.main_bubble.active3 {
	transform: translateZ(-500px);
	animation: move 1s forwards;
}



@keyframes unfoldIn { 
	0% {
		transform: scaleX(0) scaleY(0.005);
	}
	50% {
		transform : scaleX(1) scaleY(0.005);
	}
	100% {
		transform : scaleY(1) scaleX(1);
	}
}

@keyframes move { 
	100% {
		transform: translateZ(0px);
	}
}
body {
position: relative;

}
div.main_modal {
	width: 100%;
	height: 100vh;
	background-color: black;
	opacity: 0.8;
	position: fixed;
	top: 0;
	left: 0;
	display: none;
	z-index: 0;
}

div.siren_box {
	width: 500px;
	height: auto;
	border-radius: 10px;
	font-family: 'Noto Sans KR';
	font-size: 20px;
	background-color: #fff;
	border-radius: 5px;
	position: absolute;
	left: 5%;
	top: 5%;
	box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.3);
	/* display: none; */
	visibility:hidden;
	animation: unfoldIn 1s cubic-bezier(0.165, 0.84, 0.44, 1) forwards;
	line-height: 2.5rem;
	font-size: 1.2rem;
	margin: 10px;
	padding: 10px;
	z-index: 1000;
}

#siren_box div {
	margin: 3px;
	padding: 3px;
}

#siren_box textarea {
	display: block;
}

#siren_box button {
	display: inline-block;
	margin: 3px;
	padding: 10px 5px;
	margin-left: auto;
	background-color: white;
	color: #3f6d84;
	border: 1px solid #3f6d84;
	cursor: pointer;
}

#siren_box button:hover {
	background-color: #3f6d84;
	opacity: 0.8;
	color: white;
}

#siren:checked+#siren_box {
	display: block;
	animation: unfoldIn 1s cubic-bezier(0.165, 0.84, 0.44, 1) forwards;
}

.siren_box.visible {
	visibility:visible;
	animation: unfoldIn 1s cubic-bezier(0.165, 0.84, 0.44, 1) forwards;
}

.heart-box {
	width: auto;
	height: auto;
	position: absolute;
	left: 45%;
	transform: translate(-50%, -50%);
	text-align: center;
	margin: 2.5% auto;
	font-size: 18px;
}

.heart-box span#like_it {
	color: red;
}

.heart-box p {
	display: inline-block;
}


div#background1 {
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.4);
	display: none;
}
</style>


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
						<c:if test="${empty LIKE}"><span id="dont like_it">♡</span></c:if>
						<c:if test="${not empty LIKE}"><span id="like_it">♥</span></c:if>
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