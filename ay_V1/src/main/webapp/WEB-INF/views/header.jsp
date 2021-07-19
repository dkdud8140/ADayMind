<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<link href="${rootPath}/static/css/header.css?ver-0040"	rel="stylesheet" />
<script defer>let userInfo = "${USER.u_seq}"; </script>
<script defer src="${rootPath}/static/js/header.js?ver=060"></script>
<style>

	/* 07.14 body position 추가 */
	body {
		position : relative;
	}
	div.msg {
		font-size : 10px;
		color: red;
		display:none;
	}
	div.item2.merror {
		font-size: 10px;
		color:red;
	}
	span.ban {
		text-decoration: line-through;
	}

</style>
<!--  헤더 부분 -->
    <header>
      <div class="h_container">
        <img class="logo" src="${rootPath}/static/logo_white.png" />
        <nav>
          <ul id="menu">
            <li class="items item1">
              <img class="menuimg" src="${rootPath}/static/profile.png" />
              <c:if test="${USER.u_level < 9}">
              	${USER.u_nick}님
              </c:if>
              <c:if test="${USER.u_level == 9}">
              	<label>아이디 ban</label>
              </c:if>
               <c:if test="${USER == null}">
               	<label>로그인 필요</label>
               </c:if>
            </li>
            <c:choose>
            <c:when test="${USER.u_level == 9 }">
            <li class="items item2" id="ban_insert">
              <span class="ban">하루 생각 입력하기</span>
            </li>
            <li class="items item3" id="ban_ilike">
              <span class="ban">나의 공감리스트 보기</span>
            </li>
            <li class="items item4" id="ban_bestlist">
              <span class="ban">인기 하루 생각</span>
            </li>
            <li class="items item5" id="ban_iwrite">
              <span class="ban">내가 쓴 하루생각 모음</span>
            </li>
            <li></li>
            </c:when>
     		<c:when test="${USER.u_level == 0 }">
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
			<li class="items item5" id="admin">
			   <span>관리자 페이지</span>
			</li>
            </c:when>
            <c:otherwise>
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
             <li></li>
     		</c:otherwise>
     		</c:choose>
     		
            <c:if test="${USER == null}">
            <li class="items item6" id="join">
              <span>회원가입</span>
            </li>
            <li class="items item7" id="login">
              <span>로그인</span> 
            </li>
            </c:if>
            <c:if test="${USER != null}">
            <li class="items item6" id="mypage">
              <span>정보수정</span>
            </li>
            <li class="items item7" id="logout">
              <span>로그아웃</span> 
            </li>
            </c:if>
          </ul>
          <div id="button">
            <span class="top"></span>
            <span class="mid"></span>
            <span class="bot"></span>
          </div>
        </nav>
      </div>
      <!-- 회원가입 로그인 컨테이너 시작-->
  <form method="POST" action="${rootPath}/member/login" id="login_join">    
      <div id="sign_container">
        <div class="sign2">
          <div class="sub create front main">
            <h4 class="items2">회원가입</h4>
            <button id="ok" class="items2" type="button" >가입하기</button>
          </div>
          <div class="sub join front">
            <h4 class="items2">하루생각 로그인</h4>
            <div class="items2" id="error_msg" >아이디와 비밀번호를 입력하세요</div>
            <input class="items2" type="text" name="us_id" placeholder="ID" />
            <input class="items2" type="password" name="us_pw" placeholder="Password" />
            <input id="url_now" type="hidden" name="url_now" />
            <input id="wr_seq" type="hidden" name="wr_seq" value="" />
            <div class="items2">비밀번호를 잊어버리셨나요?</div>
            <button class="items2 btn" type="button" id="nav_login">로그인</button>
            <div class="exit exit1" >
              <span class="right"></span>
              <span class="left"></span>
            </div>
          </div>
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
            <button class="items3 btn" type="button" id="nav_join">가입하기</button>
          </div>

          <div class="sub join back main">
            <h4 class="items3">Welcome Back</h4>
            <button id="ok2" class="items3" type="button">로그인</button>
            <div class="exit exit2" >
              <span class="right"></span>
              <span class="left"></span>
            </div>
          </div>
        </div>
      </div>
     </form>
      <!-- 회원가입 로그인 컨테이너 끝-->
    </header>
    <!-- 헤더 끝-->
    
    <div class ="star_box">
    	<span class="shooting_star"></span>
		<span class="shooting_star"></span>
		<span class="shooting_star"></span>
		<span class="shooting_star"></span>
		<span class="shooting_star"></span>
	</div>
	
	
<script>
document.addEventListener("DOMContentLoaded", () => {
	let user_id = document.getElementById("user_id")
	let msg_user_id = document.querySelector("div.join.id")
	let nav_login = document.querySelector("#nav_login")
	let nav_join = document.querySelector("#nav_join")
	let login_join = document.querySelector("form#login_join")
	let url_now = document.querySelector("input#url_now")
	let wr_seq = document.querySelector("input#wr_seq");


	
	nav_login.addEventListener("click",()=>{
		login_join.action = "${rootPath}/member/login";
		url_now.value = location.pathname;
		wr_seq.value = `${WRITING.wr_seq}`;
		login_join.submit();
	})
	
	nav_join.addEventListener("click",()=>{
		login_join.action = "${rootPath}/member/join";
		url_now.value = location.pathname;
		wr_seq.value = `${WRITING.wr_seq}`
		login_join.submit();
	})
	
	
	if(user_id) {
		msg_user_id.innerText = ""
		msg_user_id.style.padding = "0"
		
		user_id.addEventListener("blur",(e)=>{
			let u_id = e.currentTarget.value
			
			if(u_id === ""){
				msg_user_id.innerText = "ID는 반드시 입력하세요."
				msg_user_id.style.display = "inline"
				user_id.focus()
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
	// 밴당한 사람 리스트이용못하게하기

	let b_li_insert = document.getElementById("ban_insert")
	let b_li_ilike = document.getElementById("ban_ilike")
	let b_li_best = document.getElementById("ban_bestlist")
	let b_li_iwrite = document.getElementById("ban_iwrite")

	b_li_insert.addEventListener("click", ()=>{
		alert("이용할 수 없습니다.")
		return false
	})
	b_li_ilike.addEventListener("click", ()=>{
		alert("이용할 수 없습니다.")
		return false
	})
	b_li_best.addEventListener("click", ()=>{
		alert("이용할 수 없습니다.")
		return false
	})
	b_li_iwrite.addEventListener("click", ()=>{
		alert("이용할 수 없습니다.")
		return false
	})
})
</script>