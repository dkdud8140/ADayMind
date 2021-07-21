<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="${rootPath}/static/css/mypage.css?ver-009" />
<script defer src="${rootPath}/static/js/mypage.js?ver-005"></script>
<style>
div.msg.change.pw {
	display: none;
}

div.check {
	font-size: 10px;
	color: red;
	display: none;
}

div.update {
	white-space: nowrap;
}
/* 7.15 추가 */
div.msg.update {
	font-size: 15px;
}

div.update.nick {
	position: absolute;
	top: 60%;
	left: 46%;
}

div.update.mail {
	position: absolute;
	top: 73%;
	left: 46%;
}

div#chk_pw {
	position: absolute;
	top: 25%;
	right: 5%;
}
/* 7.15 끝 */
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
							<input type="hidden" name="u_seq" value="${USER.u_seq}" /> <input
								type="hidden" name="u_level" value="${USER.u_level}" /> <input
								type="hidden" name="u_warning" value="${USER.u_warning}" /> <input
								type="text" name="u_id" id="id_input" value="${USER.u_id}"
								readonly />
						</div>
					</div>

					<div class="pw">
						<p>비 밀 번 호</p>
						<div>
							<input type="password" id="pw_input" name="u_pw" onkeyup="update_chkpw(this)"/> <input
								id="url_now" type="hidden" name="url_now" />
								 <input
								id="url_now2" type="hidden" name="url_now2" />
						</div>
						<div class="msg update pw"></div>
					</div>
					<!-- 7.14 div class msg update 닉,이메일 추가함 -->
					<div class="nick">
						<p>닉 네 임</p>
						<div>
							<input type="text" id="nick_input" name="u_nick"
								value="${USER.u_nick}" />
						</div>
						<!-- c:if 없앰 닉넴,메일  -->
					</div>
					<div class="msg update nick"></div>
					<div class="email">
						<p>이 메 일</p>
						<div>
							<input type="email" id="email_input" name="u_mail"
								value="${USER.u_mail}" />
						</div>
					</div>
					<div class="msg update mail"></div>
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
		<!--  section.b 수정 7.14 -->
		<form method="POST" class="pw_update_form"
			action="${rootPath}/member/pw_change">
			<section class="b">
				<div class="main_newpage">
					<div class="pw_title">
						<h2>비밀번호 수정</h2>
					</div>
					<div class="now_pw">
						<p>현재 비밀번호</p>
						<input type="hidden" name="u_id" value="${USER.u_id}" />
						<div>
							<input type="password" id="now_input" name="u_pw"
								onkeyup="update_chkpw(this)" placeholder="입력하세요" />
						</div>
					</div>
					<div class="new_pw">
						<p>변경 비밀번호</p>
						<div>
							<input type="password" id="new_input"
								onkeyup="update_chkpw(this)" name="us_pw" placeholder="변경할 비밀번호" />
						</div>
					</div>
					<div class="ag_pw">
						<p>비밀번호 확인</p>
						<div>
							<input type="password" id="ag_input" onkeyup="update_chkpw(this)"
								name="re_pw" placeholder="비밀번호 다시입력" />
						</div>
					</div>
					<div class="pw_ok">
						<button type="button" id="ok_pw">변경하기</button>
					</div>
				</div>
				<div class="quit">
					<button type="button" id="modal_x">취소</button>
				</div>
			</section>
			<!-- 수정끝  -->
		</form>
	</div>
</body>
<script>
let user_pw = document.getElementById("now_input")
let url_now = document.querySelector("input#url_now")
let url_now2 = document.querySelector("input#url_now2")
let u_pw1 = document.getElementById("pw_input")
let box = document.querySelector(".a");
let ok = `${OK}`
let flag_n = false
let flag_m = false
let cop_nick = ""
let cop_mail = ""
let user_nick = document.getElementById("nick_input")
let user_mail = document.getElementById("email_input")
if(ok) {
	
	if(ok > 0) {
		alert("비밀번호 변경되었습니다.")
	}
}
setTimeout(function () {
    box.classList.remove("active3");
  }, 1000);
//7.14 수정
/* 비번변경할때 새로운비번과 컨핌이 일치한가 */

/* 비번변경할때 새로운비번과 컨핌이 일치한가 끝 */
/* 7.18 비밀번호 특수문자 유효성검사 및 최소글자수 */
function update_chkpw(obj) {
	const sp_lang = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
	if(sp_lang.test(obj.value)) {
		alert("특수문자는 사용할 수 없습니다.")
		obj.value = obj.value.substring(0, obj.value.length - 1)
	}
}


/* 7.18 비밀번호 특수문자 유효성검사 및 최소글자수 끝 */
/* 회원탈퇴와 정보수정 눌렀을때 전송 */
let expireBtn = document.getElementById("expire_btn")
let acform = document.getElementById("u_update")
let updateBtn = document.getElementById("update_btn")

	expireBtn.addEventListener("click", (e)=>{
		if(confirm("정말 회원탈퇴 하시겠습니까??")){
			if(u_pw1.value == null || u_pw1.value == "" || u_pw1.value != ${USER.u_pw}){
				alert("비밀번호를 확인해주세요.")
				return false
			}else {
				alert()
				acform.action = "${rootPath}/member/expire"
				url_now.value = location.pathname;
				acform.submit()		
			}
		}
	})
	updateBtn.addEventListener("click", ()=>{
		
		if(u_pw1.value == null || u_pw1.value == "" || u_pw1.value != ${USER.u_pw}){
			alert("비밀번호를 확인해주세요.")
			return false
		}else if(flag_n == false || flag_m == false){
			alert("중복확인을 해주세요.")
		}
		else{
			if(cop_nick != user_nick.value){
				alert("닉네임을 다시 입력해주세요")
				user_nick.focus()
				return false
			}else if(cop_mail != user_mail.value) {
				alert("이메일을 다시 입력해주세요")
				user_mail.focus()
				return false
			}
			alert("수정이 완료되었습니다.")
			acform.action = "${rootPath}/member/mypage"
			url_now2.value = location.pathname;
			acform.submit()	
		}
		
	})
/* 회원탈퇴와 정보수정 눌렀을때 전송 끝 */
// 7.15 수정 추가함
/* 7.15 정보수정 비번 유효성검사 */

/* 7.15 정보수정 비번 유효성검사 끝 */
/* 7.19 비밀번호변경버튼 검사 */

let btn_pw_change = document.getElementById("ok_pw")
let pw_form = document.querySelector("form.pw_update_form")
let new_pw = document.getElementById("new_input")
let again_pw = document.getElementById("ag_input")

btn_pw_change.addEventListener("click", ()=>{
	vone_pw = new_pw.value
	vtwo_pw = again_pw.value
	if(user_pw.value < 6) {
		alert("패스워드는 6글자 이상 입력해주세요.")
		return false
	}
	if(new_input.value < 6){
		alert("패스워드는 6글자 이상 입력해주세요.")
		return false
	}
	if(again_pw.value < 6) {
		alert("패스워드는 6글자 이상 입력해주세요.")
		return false
	}
	if(vone_pw != vtwo_pw){
		alert("변경할 비밀번호와 확인 비밀번호가 일치하지 않습니다.")
		new_pw.focus()
		return false
	}
	if( user_pw.value != `${USER.u_pw}` || user_pw.value == "" || user_pw.value == null ){
		alert("현재 비밀번호를 확인해주세요.")
		return false
	}else {
		alert("변경된 비밀번호로 다시 로그인해주세요.")
		pw_form.submit()
	}
})




/* 7.19 비밀번호변경버튼 검사 끝 */
/* 7.15 정보수정 닉네임 유효성검사 */

let msg_update_nick = document.querySelector("div.update.nick")
	if(user_nick) {
		msg_update_nick.innerText = ""
		msg_update_nick.style.padding = "0"
		
		user_nick.addEventListener("blur",(e)=>{
			let u_nick = e.currentTarget.value
			msg_update_nick.style.display = "inline"
			if(u_nick === ""){
				msg_update_nick.innerText = "닉네임은 반드시 입력하세요."
				msg_update_nick.style.color = "#ff0000"
				user_nick.focus()
				return false
			}
			fetch("${rootPath}/member/nick_check?u_nick=" + u_nick)
			.then(response=>response.text())
			.then(result=>{
				if(result === "USE_NICK"){
					msg_update_nick.innerText = "사용중인 닉네임"
					msg_update_nick.style.color = "#ff0000"
					flag_n = false
					return false
				}else if (result === "NOT_USE_NICK"){
					msg_update_nick.innerText = "사용가능한 닉네임"
					msg_update_nick.style.color = "#00ff00"
					flag_n = true
					cop_nick = u_nick
					
				}else {
					msg_update_nick.innerText = "사용중인 닉네임(1)"
					flag_n = false
					
				}
			})
		})
	}
/* 7.15 정보수정 닉네임 유효성검사 끝 */

let msg_update_mail = document.querySelector("div.update.mail")

/* 7.15 정보수정 이메일 유효성검사 */
if(user_mail) {
	msg_update_mail.innerText = ""
	msg_update_mail.padding = "0"
	
	user_mail.addEventListener("blur", (e)=>{
		let u_mail = e.currentTarget.value
		msg_update_mail.style.display = "inline"
		if(u_mail === ""){
			msg_update_mail.innerText = "이메일을 입력해주세요."
			msg_update_mail.style.color = "#ff0000"
			user_mail.focus()
			return false
		}
		fetch("${rootPath}/member/mail_check?u_mail=" + u_mail)
		.then(response=>response.text())
		.then(result=>{
			if(result === "USE_MAIL"){
				msg_update_mail.innerText = "사용중인 이메일입니다"
				msg_update_mail.style.color = "#ff0000"
				flag_m = false
				return false;
			}else if(result === "NOT_USE_MAIL"){
				msg_update_mail.innerText = "사용가능한 이메일"
				msg_update_mail.style.color = "#00ff00"
				flag_m = true
				cop_mail = u_mail
			}else {
				flag_m = false
				msg_update_mail.innerText = "사용중인 이메일입니다(1)"
				return false
			}
		})
	})
}
/* 7.15 정보수정 이메일 유효성검사 */
// 추가끝 
</script>
</html>