<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<link href="${rootPath}/static/css/header.css?ver-0040"   rel="stylesheet" />
<script defer>let userInfo = "${USER.u_seq}"; </script>
<script defer src="${rootPath}/static/js/header.js?ver=060"></script>
<style>

   /* 07.14 body position 추가 */
   body {
      position : relative;
   }
   div.msg {
      font-size : 13px;
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
   div.join.id {
      position: absolute;
      top:40%;
      left:18%;
   }
   div.join.nick {
      position: absolute;
      top:50%;
      left:18%;
   }
   div.join.mail {
      position: absolute;
      top:60%;
      left:18%;
   }
   div.check.id {
      position:absolute;
      top:35%;
      left:40%;
   }
   div.check.nick {
      position:absolute;
      top:45%;
      left:40%;
   }
   div.check.mail {
      position:absolute;
      top:55%;
      left:40%;
   }
   div.msg.caps {
      font-size : 10px;
      display: none;
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
            <input class="items2" type="text" name="us_id" placeholder="ID" maxlength="125"/>
            <input class="items2" type="password" name="us_pw" placeholder="Password" maxlength="125"/>
            <input id="url_now" type="hidden" name="url_now" />
            <input id="wr_seq" type="hidden" name="wr_seq" value="" />
            <div class="items2">비밀번호를 잊어버리셨나요?</div>
            <button class="items2 btn" type="button" id="nav_login" >로그인</button>
            <div class="exit exit1" >
              <span class="right"></span>
              <span class="left"></span>
            </div>
          </div>
          <div class="sub create back">
            <h4 class="items3">하루생각 회원가입</h4>
            <div class="items3">하루생각에 가입하세요</div>
            <input class="items3" type="text" name="u_id" id="user_id" placeholder="ID" maxlength="125" />
            <div class="check id">중복확인</div>
            <div class="msg join id"></div>
            <input class="items3" type="text" name="u_nick" id="user_nick" placeholder="NickName" maxlength="125"/>
            <div class="msg join nick"></div>
            <div class="check nick">중복확인</div>
            <input class="items3" type="text" name="u_mail" id="user_mail" placeholder="Email " maxlength="125" />
            <div class="msg join mail"></div>
            <div class="check mail">중복확인</div>
            <input class="items3" type="password" name="u_pw" id="user_pw"  placeholder="password"  maxlength="125" />
            <div class="msg caps"></div>
            <input
              class="items3"
              type="password"
              name="re_pw"
              id="re_pw"
              placeholder="Confirm Password"
              
              maxlength="125"
            />
            <button class="items3 btn" type="button" id="nav_join" >가입하기</button>
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
   /* 7.15 추가한거 많음 */
   let url_now = document.querySelector("input#url_now")
   let wr_seq = document.querySelector("input#wr_seq");
   let click_login = document.querySelector("button#nav_login")
   let click_join = document.querySelector("button#nav_join")
   let com_id =""
   let com_nick = ""
   let com_mail = ""
   let login_join = document.querySelector("form#login_join") // 회원가입,로그인 폼

   /* 7.15 추가함수 로그인 유효성검사 */
   click_login.addEventListener("click",()=>{
      let login_id = document.querySelector("input[name='us_id']")
      let login_pw = document.querySelector("input[name='us_pw']")
      const id_login = login_id.value
      const pw_login = login_pw.value
      if(id_login == "" || id_login == null) {
         alert("아이디를 입력해주세요.")
         login_id.focus()
         return false
      }
      if(pw_login == "" || pw_login == null){
         alert("비밀번호를 입력해주세요.")
         login_pw.focus()
         return false
      }
      if( id_login != "" || pw_login != "" ) {
         fetch("${rootPath}/member/login_check?u_id=" + id_login + "&u_pw=" + pw_login)
         .then(response=>response.text())
         .then(result=>{
            if(result === "USE_LOGIN"){
               alert("로그인 성공하였습니다.")
               login_join.action = "${rootPath}/member/login"
               url_now.value = location.pathname;
               wr_seq.value = `${WRITING.wr_seq}`
               login_join.submit()
            }else {
               alert("로그인정보가 틀렸습니다.")
               return false
            }   
         })
      }
   })
   /* 7.15 추가함수 로그인 유효성검사 끝 */
   /* fetch 아이디 중복검사 */
   let user_id = document.getElementById("user_id")
   let msg_user_id = document.querySelector("div.join.id")
   let chk_id = document.querySelector("div.check.id")
   
   let flag_id = false
      if(user_id) {
         msg_user_id.innerText = ""
         msg_user_id.style.padding = "0"
         
         chk_id.addEventListener("click",()=>{
            let u_id = user_id.value
            msg_user_id.style.display = "inline"
            if(u_id === ""){
               msg_user_id.innerText = "ID는 반드시 입력하세요."
               user_id.focus()
               return false
            }
            if(u_id.length < 4) {
               alert("아이디는 4글자 이상 입력해주세요.")
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
                  flag_id = true
                  com_id = u_id
                  
               }else {
                  msg_user_id.innerText = "알 수 없는 결과를 수신함"
                  flag_id = false
               }
            })
         })
      }
   /* fetch 아이디 중복검사 끝 */

   let join_nick = document.getElementById("user_nick")
   let msg_join_nick = document.querySelector("div.join.nick")
   let chk_nick = document.querySelector("div.check.nick")
   let flag_nick = false
   /* fetch 닉네임 중복검사 */
   if(join_nick) {
      msg_join_nick.innerText = ""
      msg_join_nick.padding = "0"
      
      chk_nick.addEventListener("click", ()=>{
         let u_nick = join_nick.value
         
         msg_join_nick.style.display = "inline"
         if(u_nick === ""){
            msg_join_nick.innerText = "닉네임을 입력해주세요."
            msg_join_nick.style.color = "#ff0000"
            join_nick.focus()
            return false
         }
         fetch("${rootPath}/member/nick_check?u_nick=" + u_nick)
         .then(response=>response.text())
         .then(result=>{
            if(result === "USE_NICK"){
               msg_join_nick.innerText = "사용중인 닉네임"
               msg_join_nick.style.color = "#ff0000"
               return false;
            }else if(result === "NOT_USE_NICK"){
               msg_join_nick.innerText = "사용가능한 닉네임"
               msg_join_nick.style.color = "#00ff00"
               flag_nick = true
               com_nick = u_nick
               
            }else {
               msg_join_nick.innerText = "사용중인 닉네임(1)"
               flag_nick = false
               return false
            }
         })
      })
   }
   /* fetch 닉네임 중복검사 끝 */

   let join_mail = document.getElementById("user_mail")
   let msg_join_mail = document.querySelector("div.join.mail")
   let chk_mail = document.querySelector("div.check.mail")
   let flag_mail = false
   /* fetch 이메일 중복검사 */
   if(join_mail) {
      msg_join_mail.innerText = ""
      msg_join_mail.padding = "0"
      
      chk_mail.addEventListener("click", ()=>{
         let u_mail = join_mail.value
         
         msg_join_mail.style.display = "inline"
         if(u_mail === ""){
            msg_join_mail.innerText = "이메일을 입력해주세요."
            msg_join_mail.style.color = "#ff0000"
            join_mail.focus()
            return false
         }
         fetch("${rootPath}/member/mail_check?u_mail=" + u_mail)
         .then(response=>response.text())
         .then(result=>{
            if(result === "USE_MAIL"){
               msg_join_mail.innerText = "사용중인 이메일"
               msg_join_mail.style.color = "#ff0000"
               flag_mail = false
               return false;
            }else if(result === "NOT_USE_MAIL"){
               msg_join_mail.innerText = "사용가능한 이메일"
               msg_join_mail.style.color = "#00ff00"
               flag_mail = true
               com_mail = u_mail
            }
         })
      })
   }
   /* fetch 이메일 중복검사 끝 */

   /* 7.15 추가함수 회원가입 유효성검사 */

      let join_pw = document.getElementById("user_pw")
      let join_pw2 = document.getElementById("re_pw")
   click_join.addEventListener("click",()=>{
      let join_id = document.getElementById("user_id")
   
      
      const chk_id = join_id.value
      const chk_pw = join_pw.value
      const chk_pw2 = join_pw2.value
      const chk_nick = join_nick.value
      const chk_mail = join_mail.value

      if(chk_id == null || chk_id == ""){
         alert("아이디는 반드시 입력해야 합니다.")
         join_id.focus()
         return false
      }
      if(chk_id.length < 4 ) {
         alert("아이디는 4글자 이상 입력해주세요.")
         join_id.focus()
         return false
      }
      if(chk_nick == null || chk_nick == "") {
         alert("닉네임은 반드시 입력해야 합니다.")
         join_nick.focus()
         return false
      }
      if(chk_mail == null || chk_mail == "") {
         alert("이메일은 반드시 입력해야 합니다.")
         join_mail.focus()
         return false
      }
      if(chk_pw == null || chk_pw == "") {
         alert("비밀번호는 반드시 입력해야 합니다.")
         join_pw.focus()
         return false
      }
      
      if(fr_pw.value.length < 6) {
         alert("패스워드는 6글자 이상 입력해주세요.")
         return false
      }
      if(chk_pw2 == null || chk_pw2 == "") {
         alert("확인 비밀번호는 반드시 입력해야 합니다.")
         join_pw2.focus()
         return false
      }
      if(tw_pw.value.length < 6) {
         alert("확인비밀번호는 6글자 이상 입력해주세요.")
         return false
      }
      if(chk_pw != chk_pw2) {
         alert("패스워드를 확인해주세요.")
         return false
      }
      if(flag_id == false || flag_nick == false || flag_mail == false){
         alert("중복확인해주세요.")
         return false
      }
   
      if(chk_id != "" || chk_pw != "" || chk_pw2 != "" || chk_nick != "" || chk_mail != ""){
         login_join.action = "${rootPath}/member/join"
         url_now.value = location.pathname;
         wr_seq.value = `${WRITING.wr_seq}`
         if(com_id != user_id.value) {
            alert("아이디 중복확인을 다시해주세요.")
            msg_user_id.style.display = "none"
            user_id.focus()
            return false
         }else if(com_nick != join_nick.value) {
            alert("닉네임 중복확인을 다시해주세요.")
            msg_join_nick.style.display = "none"
            join_nick.focus()
            return false
         }else if(com_mail != join_mail.value){
            alert("이메일 중복확인을 다시해주세요.")
            msg_join_mail.style.display = "none"
            join_mail.focus()
            return false
         }
         alert("회원가입을 축하드립니다.")
         login_join.submit()
      }
      
   })
   /* 7.15 추가함수 회원가입 유효성검사 끝  */
   /* 7.18 비밀번호 유효성검사 */

/* 캡스락 */

let msg_caps = document.querySelector("div.msg.caps")
join_pw.addEventListener("keyup", (e)=>{
    if (event.getModifierState("CapsLock")) {
         msg_caps.style.display = 'inline'
         msg_caps.innerText = "CapsLock ON"
        }else {
           msg_caps.style.display = 'none'
      }   
})
join_pw2.addEventListener("keyup",(e)=>{
       if (event.getModifierState("CapsLock")) {
          msg_caps.style.display = 'inline'
         msg_caps.innerText = "CapsLock ON"
        }else {
           msg_caps.style.display = 'none'
      }   
})
 
   
/* 캡스락 끝 */
let fr_pw = document.getElementById("user_pw")
let tw_pw = document.getElementById("re_pw")
let spc_lang = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
const f_pw = fr_pw.value
const t_pw = tw_pw.value

function checkPw(obj) {
   if(spc_lang.test(obj.value)) {
      alert("특수문자 입력 불가능합니다.")
      obj.value = obj.value.substring( 0, obj.value.length - 1);
   }
}

   /* 7.16 비밀번호 유효성검사 끝 */
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