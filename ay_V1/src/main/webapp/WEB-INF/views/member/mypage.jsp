<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="${rootPath}/static/css/mypage.css?ver-010" />
<script defer src="${rootPath}/static/js/mypage.js?ver-006"></script>
<style>
div.msg.change.pw {
	display: none;
}
div.check {
		font-size : 10px;
		color: red;
		display:none;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div class="b_container">
		<form method="POST" id="u_update" action="${rootPath}/member/mypage">
			<section class="a active3">
				<div class="a1">
					<div class="profile">
						<img src="${rootPath}/static/profile.png" />
					</div>
					<div class="proname">
						<h2>${USER.u_nick}</h2>
					</div>
					<p class="bt"></p>
					<div class="id">
						<p>아 이 디</p>
						<div>
							<input type="hidden" name="u_seq" value="${USER.u_seq}" /> 
							<input type="hidden" name="u_level" value="${USER.u_level}" />
							<input type="hidden" name="u_warning" value="${USER.u_warning}" />
							<input type="text" name="u_id" id="id_input" value="${USER.u_id}" readonly />
						</div>
					</div>
					<div class="pw">
						<p>비 밀 번 호</p>
						<div>
							<input type="password" id="pw_input" name="u_pw" />
						</div>
						<div class="msg update pw"></div>
					</div>
					<div class="nick">
						<p>닉 네 임</p>
						<div>
							<input type="text" id="nick_input" name="u_nick"
								value="${USER.u_nick}" />
						</div>
						<div class="nick check"></div>
						<c:if test="${USER.u_nick eq U.u_nick}">
							<input type="text" id="nick_input" name="u_nick" value="${U.u_nick}" />
						</c:if>
					</div>
					<div class="email">
						<p>이 메 일</p>
						<div>
							<input type="email" id="email_input" name="u_mail"
								value="${USER.u_mail}" />
						</div>
						<div class="mail check"></div>
						<c:if test="${USER.u_mail eq U.u_mail}">
							<input type="text" id="nick_input" name="u_nick" value="${U.u_nick}" />
						</c:if>
					</div>
					<div class="infos">
						<button type="button" id="update_btn">정보 수정</button>
					</div>
					<div class="pws">
						<button type="button" id="modal_btn">비밀번호 변경</button>
					</div>
					<div class="expire">
						<button type="button" id="expire_btn">회원탈퇴</button>
					</div>
				</div>
			</section>
		</form>
		<form method="POST" action="${rootPath}/member/pw_change">
			<section class="b">
				<div class="main_newpage">
					<div class="pw_title">
						<h2>비밀번호 수정</h2>
					</div>
					<div class="now_pw">
						<p>현재 비밀번호</p>
						<div>
							<input type="hidden" name="u_seq" value="${USER.u_seq}"/>
							<input type="hidden" name="u_id" value="${USER.u_id}"/>
							<input type="hidden" name="u_nick" value="${USER.u_nick}" />
							<input type="hidden" name="u_mail" value="${USER.u_mail}" />
							<input type="hidden" name="u_warning" value="${USER.u_warning}" />
							<input type="hidden" name="u_level" value="${USER.u_level}" />
							<input type="password" id="now_input" name="u_pw"
								placeholder="입력하세요" />
						</div>
						<div class="msg change pw"></div>
					</div>
					<div class="new_pw">
						<p>변경 비밀번호</p>
						<div>
							<input type="password" id="new_input" name="us_pw"
								placeholder="변경할 비밀번호" />
						</div>
					</div>
					<div class="ag_pw">
						<p>비밀번호 확인</p>
						<div>
							<input type="password" id="ag_input" name="re_pw"
								placeholder="비밀번호 다시입력" />
						</div>
					</div>
					<div class="pw_ok">
						<button type="submit" id="ok_pw">변경하기</button>
					</div>
				</div>
				<div class="quit">
					<button type="button" id="modal_x">취소</button>
				</div>
			</section>
		</form>
	</div>
</body>
<script>
let box = document.querySelector(".a");
let ok = `${OK}`
if(ok) {
	
	if(ok > 0) {
		alert("비밀번호 변경되었습니다.")
	}
}
setTimeout(function () {
    box.classList.remove("active3");
  }, 1000);
let btn_ok = document.getElementById("ok_pw")
let user_pw = document.getElementById("now_input")
let msg_user_pw = document.querySelector("div.change.pw")

if(user_pw) {
	msg_user_pw.innerText = ""
	msg_user_pw.style.padding = "0"
	
	btn_ok.addEventListener("click", (e)=>{
		let u_pw = e.currentTarget.value
		
		if(u_pw === ""){
			msg_user_pw.innerText = "기존 비밀번호를 입력해주세요."
			msg_user_pw.style.display = "inline"
			user_pw.focus()
			return false 
		}
		fetch("${rootPath}/member/pw_check?u_pw=" + u_pw)
		.then(response=>response.text())
		.then(result=>{
				
			if(result === "NOT_USE_PW"){
				alert("현재 비밀번호를 확인해주세요.")
				user_pw.focus()
				return false
			} else {
				// db에 저장된게 아무것도 일치하지않을때 
				msg_user_pw.innerText = "비밀번호를 확인해주세요(1)"
				return false
			}
		})
	})
}

let new_pw = document.getElementById("new_input")
let again_pw = document.getElementById("ag_input")

again_pw.addEventListener("blur", (e)=>{
	vone_pw = new_pw.value
	vtwo_pw = e.currentTarget.value
	
	if(vone_pw != vtwo_pw){
		alert("변경할 비밀번호와 확인 비밀번호가 일치하지 않습니다.")
		new_pw.focus()
		return false
	}
})

let expireBtn = document.getElementById("expire_btn")
let acform = document.getElementById("u_update")
let updateBtn = document.getElementById("update_btn")

	expireBtn.addEventListener("click", (e)=>{
		if(confirm("정말 회원탈퇴 하시겠습니까??")){
		acform.action = "${rootPath}/member/expire"
		acform.submit()
		}
	})
	updateBtn.addEventListener("click", (e)=>{
		acform.action = "${rootPath}/member/mypage"
		acform.submit()
	})
</script>
</html>