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
<link rel="stylesheet" href="${rootPath}/static/css/list.css?ver=34" />
<script defer>
let pathName = "${title}";
let user = "${USER.u_seq}";
let rootPath = "${rootPath}";
let boardNum = null;
let modal_Temp = document.createElement("div");
</script> <!-- 6월 13일 -->
<script src="${rootPath}/static/js/list.js?ver=98"></script>
<style>
/* 	0714 신고창 관련된 모든 css 수정 */
div.siren_box {
	width: 300px;
	height: auto;
	background-color: #fff;
	border-radius: 5px;
	position: fixed;
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

p#more {
	color:white;
	text-align: center;
	width:69vw;
	font-family: "cafe24s";
	margin-bottom: 20px;
}

</style>
</head>

<body>

	<%@ include file="../header.jsp"%>

	<!-- section 시작-->
	<!-- 7월14일 modal form으로 감싸기 -->
	<form id="writing_delete" method="POST" action="${rootPath}/list/delete">
	<div id="modal"></div>
	</form>
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
			<c:if test="${LISTSIZE > 8 }">
			<p id="more">더보기(More)</p>
			</c:if>
		</div>
		
	</section>
		<div id="siren_box" class="siren_box">
		<h3 id="siren_title">신고하기</h3>
		<form  id="WARNING" method="POST" action="${rootPath}/warning/insert" onsubmit="jSubmit">
			<p>신고 사유를 선택하세요.</p>
				<input type="hidden" name="wa_writing">
				<input type="hidden" name="wa_user" >
				<input id="url_now2" type="hidden" name="url_now2" />

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
<script> // 6월 13일
document.addEventListener("DOMContentLoaded", () => {
let bcon1 = document.getElementById("b_container");
let moreList_p = document.querySelector("p#more");
let boardList = document.getElementsByClassName("card");
let b_length = 8;
let url_now2 = document.querySelector("input#url_now2")

setTimeout(function () {
		bcon1.classList.remove("active3");
	}, 1000);


	function refreshList() {
	  
	  console.log(b_length)
	  for (let i = 0; i < b_length; i++) {
	      boardList[i].addEventListener("click", function () {
	      let openModal = document.getElementById("modal");
	      let modalContent = document.getElementById("modal_content");
	      boardNum = boardList[i];
	      boardList[i].style.opacity = "0";
	      openModal.style.display = "flex";
	      openModal.innerHTML = boardList[i].innerHTML;
	      modal_Temp.innerHTML = boardList[i].innerHTML;
	      document.querySelector("section").style.opacity = "0.3";
	      document.querySelector("header").style.opacity = "0.3";
	    })
	  }
	 };
	 refreshList();

moreList_p.addEventListener("click",()=>{
	let list_length = document.querySelectorAll("div.board.item1").length;
	let url_now = location.pathname;
	
	fetch("${rootPath}/list/moreList?moreCount=" + list_length + "&url_now=" + url_now)
	.then(response=>response.json())
	.then(result=>{
		let list = result.moreList
		let count = result.likeCount
		if(list.length < 8) {
			moreList_p.remove();
		} 
		
		for(let i = 0; i < list.length; i++) {
			let content = '';
			console.log(list[i].wr_content);
			let board_box = document.createElement("div");
			board_box.setAttribute("class","board item1");
			content += '<a class="card"> <img class="abc" src="${rootPath}/static/board_white.svg" />';
			content += '<article><div class="profile_div"><img class="profile" src="${rootPath}/static/profile.png" />';
			content += '<p>'+ list[i].wr_nick +'</p></div><h1>'+ list[i].wr_content +'</h1><h5>'+ list[i].wr_origin +'</h5>';
			content += '<span class="modal_span" data-seq="'+ list[i].wr_seq +'">';
			if(count) {
				if(count[i] == 0){
					content += `<div class="heart _black" id="heart_event">♡</div>`;
				} else if (count[i] == 1){
					content += `<div class="heart _red"  id="heart_event">♥</div>`;	
				}
			} else {
				content += `<div class="heart _black" id="heart_event">♡</div>`;	
			}
			content += ' <p class="modal_count">'+ list[i].wr_like_count +' 명이 공감하였어요! </p></span>';
			<c:if test="${USER != null}">
			content += `<img class="modal_siren" src="${rootPath}/static/siren.png" />`;
			</c:if>
			<c:if test="${USER.u_seq == list[i].wr_user}">
			content += `<div class="list_button">`;
			content += '<input type="hidden" name="wr_seq" value="'+ list[i].wr_seq+'"/>';
			content += '<div class="update_btn" >수정</div><div class="delete_btn">삭제</div></div>';
			</c:if>
			content += `</article></a>`;
			board_box.innerHTML = content;
			let board = document.querySelectorAll("div.board.item1")
			board[board.length - 1].after(board_box);
			b_length += 1;
			refreshList();
		}
	})
})

document.querySelector("button#close").addEventListener("click",(e)=>{
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
	url_now2.value = location.pathname
	document.querySelector("form#WARNING").submit()
	
})
})
</script>
</html>	