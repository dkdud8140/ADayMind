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
<!-- <link href="${rootPath}/resources/css/main.css?ver-016" rel="stylesheet" /> -->
<link href="${rootPath}/static/css/basic.css?ver-016" rel="stylesheet" />
<style>

/*0715 배경수정*/
body {
	-webkit-background-size: cover; 
	-moz-background-size: cover; 
	-o-background-size: cover; 
	background-size: cover;

	overflow: hidden;
}


div#background1 img{
	min-height : 100%;
	min-width : 1024px;
	width : 100%;
	height : auto;
	position : fixed;
	top: 0;
	left: 0;
}
/*0715 배경수정 끝*/


.main_bubble {
	width: 750px;
	height: 600px;
	margin: 2.5% auto;
	transition: all 1s;
	background: url("${rootPath}/static/bubbleAndperson.png") no-repeat;
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

h3#siren_title {
	border-bottom: 1px solid #ccc;
	padding: 10px;
	margin-bottom: 10px;
	color: #3f6d84;
}

/* 	0714 신고창 관련된 모든 css 수정 */
div.siren_box {
	width: 300px;
	height: auto;
	background-color: #fff;
	border-radius: 5px;
	position: absolute;
	left: 30%;
	top: 10%;
	transform: translateX(-50%);
	box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.3);
	visibility: hidden;
	line-height: 2.5rem;
	margin: 10px;
	padding: 10px;
	z-index: 1000;
}

.siren_box div {
	padding: 3px;
	width: 100%;
}

.siren_box form {
	width: 100%;
	font-size: 15px;
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

.siren_box.visible {
	visibility: visible;
	animation: unfoldIn 0.6s cubic-bezier(0.165, 0.84, 0.44, 1) forwards;
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

/*0715 하트모양 변경*/
.heart-box span#like_it {
	cursor: pointer;
	font-size: 20px;
}
.heart-box span#like_it span#h_black{
	color: black;
}
.heart-box span#like_it span#h_red{
	color: red;
}

.heart-box p {
	display: inline-block;
}

/*0715 배경수정*/
@media screen and (max-width: 1024px) { 
 div#background1 img { 
 	left: 50%; 
 	margin-left: -512px;
 	} 
}



@keyframes unfoldIn { 
0% { transform: scaleX(0) scaleY(0.005);}

50% { transform : scaleX(1) scaleY(0.005);}

100% { transform : scaleY(1) scaleX(1);}
}


@keyframes move { 
100% {transform: translateZ(0px);}
}

</style>

</head>
<body>
	
	<!-- 배경수정 -->
	<div id="background1">
		<img class="heart" src="${rootPath}/static/BG-V2_1.png">
	</div>

	<%@ include file="header.jsp"%>

	<div id="body_size_box">
		<div class="main_bubble active3">

			<div class="bubble_box">

				<label class="siren" for="siren"> <img
					src="static/siren.png">
				</label>

				<p class="p1">
					<b>“${WRITING.wr_nick}”</b>님이 보내온 하루 생각입니다.
				</p>

				<p class="p2">${WRITING.wr_content}</p>
				<p class="p3">${WRITING.wr_origin}</p>


				<div class="heart-box">

					<div class="content">
						<span id="like_it"> 
							<c:if test="${CHECK == 0}">
									<span id="h_black">♡</span>
							</c:if> 
							<c:if test="${CHECK == 1}">
									 <span id="h_red">♥</span>
							</c:if>
						</span>
						<p id="like_it_text">${WRITING.wr_like_count}명이공감중</p>
					</div>

				</div>


			</div>

		</div>
	</div>

	<div class="main_modal"></div>

	<!--  0714 신고창 수정-->
	<!--  0715 신고창 수정-->
	<div id="siren_box" class="siren_box">
		<h3 id="siren_title">신고하기</h3>
		<form  id="WARNING" method="POST" action="${rootPath}/warning/insert" onsubmit="jSubmit">
			<p>신고 사유를 선택하세요.</p>
				<input type="hidden" name="wa_writing" value="${WRITING.wr_seq}">
				<input type="hidden" name="wa_user" value="${WRITING.wr_user}">


			<div>
				<input type="radio" name="wa_content"  value="성적인 콘텐츠" onClick="this.form.wa_content_other.disabled=true">
				<label for="wa_content"> 성적인 콘텐츠</label>
			</div>

			<div>
				<input type="radio" name="wa_content"  value="폭력적 또는 혐오스러운 콘텐츠" onClick="this.form.wa_content_other.disabled=true"> 
				<label for="wa_content"> 폭력적 또는 혐오스러운 콘텐츠</label>
			</div>

			<div>
				<input type="radio" name="wa_content"  value="증오 또는 악의적인 콘텐츠" onClick="this.form.wa_content_other.disabled=true"> 
				<label for="wa_content"> 증오 또는 악의적인 콘텐츠</label>
			</div>

			<div>
				<input type="radio" name="wa_content"  value="희롱 또는 괴롭힘" onClick="this.form.wa_content_other.disabled=true"> 
				<label for="wa_content"> 희롱 또는 괴롭힘</label>
			</div>

			<div>
				  <input type="radio" name="wa_content" value="유해하거나 위험한 행위" onClick="this.form.wa_content_other.disabled=true">
				  <label for="wa_content"> 유해하거나 위험한 행위</label>
			</div>

			<div id="div_text">
				<input type="radio" name="wa_content" value="6" onClick="this.form.wa_content_other.disabled=false"> 
				<label for="wa_content" >기타</label>
				
				<input type="text" name="wa_content_other" id="other" value="입력하세요" disabled="disabled" >
				
			</div>

			<button type="button" id="close">취소</button>
			<button type="button" id="btn_wa" >신고하기</button>
		</form>
	</div>



</body>


<script>
	let box = document.querySelector(".main_bubble");
	let modal = document.querySelector("div.main_modal");
	let content = document.querySelector("div.content");
	let like_it = document.querySelector("#like_it");
	let like_it_text = document.querySelector("#like_it_text");
	
	setTimeout(function() {
		box.classList.remove("active3");
	}, 1000);
	
	
	content.addEventListener("click",()=>{
		if(${not empty USER}) {
			fetch(`${rootPath}/like_count?bseq=${WRITING.wr_seq}&useq=${USER.u_seq}`)
			.then(response=>response.text())
			.then(result=>{
				if(result === "COUNT_DOWN"){
					like_it.innerHTML = `<span id="h_black">♡</span>`;
					wrLikeCount();
				}else if (result === "COUNT_UP"){
					like_it.innerHTML = `<span id="h_red">♥</span>`;
					wrLikeCount();
				}
			})
		}
	})
	
	function wrLikeCount(){
		fetch(`${rootPath}/wrlike_count?bseq=${WRITING.wr_seq}`)
		.then(response=>response.text())
		.then(result=>{
				like_it_text.innerText = result + "명이 공감중";
		})
	}
	
	/* 0715 로그인제한 추가*/
	document.querySelector("label.siren").addEventListener("click",(e)=>{
		
		if(${not empty USER}) {
			modal.style.display = "block";
			document.querySelector("#siren_box").classList.add("visible")
		} else {
			alert("로그인하세요.")
		}
	})
	
	document.querySelector("button#close").addEventListener("click",(e)=>{
		modal.style.display = "none";
		document.querySelector("#siren_box").classList.remove("visible")
	})	
	
	document.querySelector("button#btn_wa").addEventListener("click",(e)=>{
		
		let size = document.getElementsByName("wa_content").length
		let check = 0;
		
		for(let i = 0 ; i < size ; i ++) {
			if(document.getElementsByName("wa_content")[i].checked == true) {
				check ++	
			}	
		}
		
		if(check <=0) {
			alert("항목은 반드시 선택해야 합니다")
			return false;
		} 
		
		document.querySelector("form#WARNING").submit()
		
	})

</script>

</html>