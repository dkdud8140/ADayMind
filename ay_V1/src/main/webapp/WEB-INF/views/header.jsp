<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<link href="${rootPath}/resources/css/header.css?ver-0028"	rel="stylesheet" />

<script defer src="${rootPath}/resources/js/header.js?ver=052"></script>
<style>

	/* 중복된 아이디가 없을 경우 */
	span#idChk_1{
		display:none;
		color: #00f00;
	}
	/* 중복된 아이디가 있을 경우 */
	span#idChk_2{
		display:none;
		color: #ff0000;
	}
</style>
<link href="${rootPath}/static/css/header.css?ver-0031"	rel="stylesheet" />

<script defer src="${rootPath}/static/js/header.js?ver=055"></script>
<!--  헤더 부분 -->
    <header>
      <div class="h_container">
        <img class="logo" src="${rootPath}/resources/logo_white.png" />
        <nav>
          <ul id="menu">
            <li class="items item1" id="mypage">
              <img class="menuimg" src="${rootPath}/resources/profile.png" />
             <c:if test="${USER != null}">${USER.u_nick}님</c:if>
             <c:if test="${USER == null}">로그인후 이용해주세요.</c:if>
            </li>
            <li class="items item2" id="insert">
              <span>하루 생각 입력하기</span>
            </li>
            <li class="items item3" id="ilike">
              <span>나의 공감리스트 보기</span>
            </li>
            <li class="items item4" id="bestlist">
              <span>인기 하루 생각</span>
            </li>
            <li class="items item5" id="iwrite">
              <span>내가 쓴 하루생각 모음</span>
            </li>
            <li class="items item6" id="join">
              <span>회원가입</span>
            </li>
            <li class="items item7" id="login">
              <span>로그인</span> 
            </li>
          </ul>
          <div id="button">
            <span class="top"></span>
            <span class="mid"></span>
            <span class="bot"></span>
          </div>
        </nav>
      </div>
<form name="login" action="${rootPath}/login" method="POST">
      <!-- 회원가입 로그인 컨테이너 시작-->
      <div id="sign_container">
        <div class="sign2">
          <div class="sub create front main">
            <h4 class="items2" >회원가입</h4>
            <button id="ok" class="items2" >가입하기</button>
          </div>
          <div class="sub join front">
            <h4 class="items2">하루생각 로그인</h4>
            <div class="items2">아이디와 비밀번호를 입력하세요</div>
            <input class="items2" name="us_id" id="us_id" type="text" placeholder="ID" />
            <input class="items2" name="us_pw" id="us_pw" type="password" placeholder="Password" />
            <div class="items2">비밀번호를 잊어버리셨나요?</div>
            <button class="items2 btn" type="submit">로그인</button>
            <div class="exit exit1" >
              <span class="right"></span>
              <span class="left"></span>
            </div>
          </div>
   </form>
   <form name="join" action="${rootPath}/member/join" method="POST">
          <div class="sub create back">
            <h4 class="items3">하루생각 회원가입</h4>
            <div class="items3">하루생각에 가입하세요</div>
            <input class="items3" name="u_id" id="u_id" type="text" placeholder="ID" />
            <span id="idChk_1">사용가능한 아이디 </span>
            <span id="idChk_2">사용중인 아이디 </span>
            <input class="items3" name="u_nick" id="u_nick" type="text" placeholder="NickName" />
            <input class="items3" name="u_mail" id="u_mail" type="text" placeholder="Email " />
            <input class="items3" name="u_pw" id="u_pw" type="password" placeholder="Password " />
            <input
              class="items3"
              id="u_pw_confirm"
              type="password"
              placeholder="Confirm Password"
            />
            <span id="msgg"></span>
            
            <button class="items3 btn" type="submit" >가입하기</button>
          </div>
   </form>
          <div class="sub join back main">
            <h4 class="items3">Welcome Back</h4>
            <button id="ok2" class="items3" >로그인</button>
            <div class="exit exit2" >
              <span class="right"></span>
              <span class="left"></span>
            </div>
          </div>
        </div>
      </div>
     
      <!-- 회원가입 로그인 컨테이너 끝-->
    </header>
    <!-- 헤더 끝-->
    
    	<span class="shooting_star"></span>
		<span class="shooting_star"></span>
		<span class="shooting_star"></span>
		<span class="shooting_star"></span>
		<span class="shooting_star"></span>
		

<script>
"use scrict"
//비밀번호, 재 비밀번호 맞는지 검사 
function pass1(){
let password = document.getElementById('u_pw').value;	
let passwordConfirm = document.getElementById('u_pw_confirm').value;
let confirmMsg = document.getElementById('msgg');
let corrColor = '#00ff00'
let WrongColor = '#ff0000'

if(password == passwordConfirm) {
 confirmMsg.style.color = corrColor 
 confirmMsg.innerHTML = "일치"
} else if(password != passwordConfirm) {
 confirmMsg.style.color = WrongColor
 confirmMsg.innerHTML = "불일치"
} else {
	confirmMsg.style.display = none;
}
}
document.querySelector("#u_pw").addEventListener("keyup", ()=>{
	pass1();
})
document.querySelector("#u_pw_confirm").addEventListener("keyup", ()=>{
	pass1();
});
//검사끝

</script>
		
		
		
		