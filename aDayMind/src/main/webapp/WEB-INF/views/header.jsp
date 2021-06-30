<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<link href="${rootPath}/resources/css/header.css?ver-0028"	rel="stylesheet" />

<script defer src="${rootPath}/resources/js/header.js?ver=052"></script>

<!--  헤더 부분 -->
    <header>
      <div class="h_container">
        <img class="logo" src="${rootPath}/resources/logo_white.png" />
        <nav>
          <ul id="menu">
            <li class="items item1" id="mypage">
              <img class="menuimg" src="${rootPath}/resources/profile.png" />
              익명000님
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

      <!-- 회원가입 로그인 컨테이너 시작-->
      <div id="sign_container">
        <div class="sign2">
          <div class="sub create front main">
            <h4 class="items2">회원가입</h4>
            <button id="ok" class="items2" >가입하기</button>
          </div>
          <div class="sub join front">
            <h4 class="items2">하루생각 로그인</h4>
            <div class="items2">아이디와 비밀번호를 입력하세요</div>
            <input class="items2" type="text" placeholder="ID" />
            <input class="items2" type="password" placeholder="Password" />
            <div class="items2">비밀번호를 잊어버리셨나요?</div>
            <button class="items2 btn">로그인</button>
            <div class="exit exit1" >
              <span class="right"></span>
              <span class="left"></span>
            </div>
          </div>
          <div class="sub create back">
            <h4 class="items3">하루생각 회원가입</h4>
            <div class="items3">하루생각에 가입하세요</div>
            <input class="items3" type="text" placeholder="ID" />
            <input class="items3" type="text" placeholder="NickName" />
            <input class="items3" type="text" placeholder="Email " />
            <input class="items3" type="password" placeholder="Password " />
            <input
              class="items3"
              type="password"
              placeholder="Confirm Password"
            />
            <button class="items3 btn">가입하기</button>
          </div>
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