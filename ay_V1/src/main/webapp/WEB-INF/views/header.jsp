<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<link href="${rootPath}/resources/css/header.css?ver-0032"	rel="stylesheet" />

<script defer src="${rootPath}/resources/js/header.js?ver=053"></script>
<style>
	div.msg {
		font-size : 10px;
		color: red;
		display:none;
	}
	div.item2.merror {
		font-size: 10px;
		color:red;
	}
</style>
<!--  헤더 부분 -->
    <header>
    <form method="POST" action="${rootPath}/member/logout">
      <div class="h_container">
        <img class="logo" src="${rootPath}/resources/logo_white.png" />
        <nav>
          <ul id="menu">
            <li class="items item1" id="mypage">
              <img class="menuimg" src="${rootPath}/resources/profile.png" />
              <c:if test="${USER != null}">
              	${USER.u_nick}님
              </c:if>
               <c:if test="${USER == null}">
               	<label>로그인을 해주세요.</label>
               </c:if>
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
            <c:if test="${USER == null}">
            <li class="items item6" id="join">
              <span>회원가입</span>
            </li>
            <li class="items item7" id="login">
              <span>로그인</span> 
            </li>
            </c:if>
            <c:if test="${USER != null}">
            	<button type="submit">로그아웃</button>
            </c:if>
          </ul>
          <div id="button">
            <span class="top"></span>
            <span class="mid"></span>
            <span class="bot"></span>
          </div>
        </nav>
      </div>
</form>
      <!-- 회원가입 로그인 컨테이너 시작-->
      
      <div id="sign_container">
        <div class="sign2">
          <div class="sub create front main">
            <h4 class="items2">회원가입</h4>
            <button id="ok" class="items2" >가입하기</button>
          </div>
<form method="POST" action="${rootPath}/member/login">
          <div class="sub join front">
            <h4 class="items2">하루생각 로그인</h4>
            <div class="items2" id="error_msg" >아이디와 비밀번호를 입력하세요</div>
            <input class="items2" type="text" name="u_id" placeholder="ID" />
            <input class="items2" type="password" name="u_pw" placeholder="Password" />
            <div class="items2">비밀번호를 잊어버리셨나요?</div>
            <button class="items2 btn" type="submit">로그인</button>
            <div class="exit exit1" >
              <span class="right"></span>
              <span class="left"></span>
            </div>
          </div>
</form>
  <form method="POST" action="${rootPath}/member/join">
          <div class="sub create back">
            <h4 class="items3">하루생각 회원가입</h4>
            <div class="items3">하루생각에 가입하세요</div>
            <input class="items3" type="text" name="u_id" id="user_id" placeholder="ID" />
            <div class="msg join id"></div>
            <input class="items3" type="text" name="u_nick" placeholder="NickName" />
            <input class="items3" type="text" name="u_mail" placeholder="Email " />
            <input class="items3" type="password" name="u_pw" id="user_pw" placeholder="Password " />
            <input
              class="items3"
              type="password"
              name="re_pw"
              id="re_pw"
              placeholder="Confirm Password"
            />
            <button class="items3 btn">가입하기</button>
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

	let user_id = document.getElementById("user_id")
	let msg_user_id = document.querySelector("div.join.id")
	
	if(user_id) {
		msg_user_id.innerText = ""
		msg_user_id.style.padding = "0"
		
		user_id.addEventListener("blur",(e)=>{
			let u_id = e.currentTarget.value
			
			if(u_id === ""){
				msg_user_id.innerText = "ID는 반드시 입력하세요."
				msg_user_id.style.display = "inline"
				u_id.focus()
				return false
			}
			fetch("${rootPath}/member/id_check?u_id=" + u_id)
			.then(response=>response.text())
			.then(result=>{
				if(result === "USE_ID"){
					msg_user_id.innerText = "사용중인 아이디"
					user_id.focus()
					return false
				}else if (result === "NOT_USE_ID"){
					msg_user_id.innerText = "사용가능한 아이디"
					msg_user_id.style.color = "#00ff00"
					
					document.querySelector("input[name='u_nick']")
				}else {
					msg_user_id.innerText = "알 수 없는 결과를 수신함"
				}
			})
		})
	}


	
	
	
	
	
	
	

</script>