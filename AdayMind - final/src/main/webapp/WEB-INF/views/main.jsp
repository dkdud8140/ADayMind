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
<link href="${rootPath}/static/css/main.css?ver-002" rel="stylesheet" />
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

				<label class="siren" for="siren"> <img src="static/siren.png"></label>

				<p class="p1">
					<b>“${WRITING.wr_nick}”</b>님이 보내온 하루 생각입니다.
				</p>

				<p class="p2">${WRITING.wr_content}</p>
				<p class="p3">${WRITING.wr_origin}</p>


				<div class="heart-box">

					<div class="content">
						<span id="like_it">
							<c:choose> 
								<c:when test="${CHECK == 0}">
										<span id="h_black">♡</span>
								</c:when> 
								<c:when test="${CHECK == 1}">
										 <span id="h_red">♥</span>
								</c:when>
								<c:otherwise>
										<span id="h_black">♡</span>
								</c:otherwise>
							</c:choose>
						</span>
						<p id="like_it_text">${WRITING.wr_like_count}명이 공감중</p>
					</div>

				</div>


			</div>

		</div>
	</div>

	<div class="main_modal"></div>

	<!--  0715 신고창 수정-->
	<div id="siren_box" class="siren_box">
		<h3 id="siren_title">신고하기</h3>
		<form  id="WARNING" method="POST" action="${rootPath}/warning/insert" onsubmit="jSubmit">
			<p>신고 사유를 선택하세요.</p>
				<input type="hidden" name="wa_writing" value="${WRITING.wr_seq}">
				<input type="hidden" name="wa_user" value="${WRITING.wr_user}">
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


<script>
	let box = document.querySelector(".main_bubble");
	let modal = document.querySelector("div.main_modal");
	let content = document.querySelector("div.content");
	let like_it = document.querySelector("#like_it");
	let like_it_text = document.querySelector("#like_it_text");
	let main_s_con = document.querySelector("#sign_container");
	let main_front = document.querySelectorAll("div.front");
	let main_back = document.querySelectorAll("div.back");
	let main_sign = document.getElementsByClassName("items2");
	let main_sign2 = document.getElementsByClassName("items3");
	let url_now2 = document.querySelector("input#url_now2")
	
	
	setTimeout(function() {
		box.classList.remove("active3");
	}, 1000);
	
	
	content.addEventListener("click",()=>{
		if(${not empty USER}) {
			fetch(`${rootPath}/like_count?bseq=${WRITING.wr_seq}&useq=${USER.u_seq}`)
			.then(response=>response.json())
			.then(result=>{
				if(result.UPDOWN == 0){
					like_it.innerHTML = `<span id="h_black">♡</span>`;
					like_it_text.innerText = result.WR_COUNT + "명이 공감중";
				}else if (result.UPDOWN == 1){
					like_it.innerHTML = `<span id="h_red">♥</span>`;
					like_it_text.innerText = result.WR_COUNT + "명이 공감중";
				}
			})
		} else {
	        box.classList.add("active2");
	        main_s_con.style.display = "block";
	        for (let i = 0; i < main_back.length; i++) {
	            main_back[i].style.display = "none";
	            main_front[i].style.display = "grid";
	        }
            for (let i = 0; i < main_sign.length; i++) {
                main_sign[i].style.animation = "bounce-in 1s " + i * 0.04 + "s ease-out";
            }
            for (let i = 0; i < main_sign2.length; i++) {
                main_sign2[i].style.animation = "bounce-in 1s " + i * 0.04 + "s ease-out";
            }    
		}
	})
	
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
		url_now2.value = location.pathname;
		document.querySelector("form#WARNING").submit()
		
	})

</script>

</html>