<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet"
	href="${rootPath}/resources/css/mypage.css?ver-007" />
<script defer src="${rootPath}/resources/js/mypage.js?ver-006"></script>

</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
	<div class="b_container">
		<section class="a active3">
			<div class="a1">
				<div class="profile">
					<img src="${rootPath}/resources/profile.png" />
				</div>
				<div class="proname">
					<h2>익명000님</h2>
				</div>
				<p class="bt"></p>
				<div class="id">
					<p>아 이 디</p>
					<div>
						<input type="text" id="id_input" placeholder="아이디를 입력하세요" />
					</div>
				</div>
				<div class="pw">
					<p>비 밀 번 호</p>
					<div>
						<input type="password" id="pw_input" placeholder="패스워드를 입력하세요" />
					</div>
				</div>
				<div class="nick">
					<p>닉 네 임</p>
					<div>
						<input type="text" id="nick_input" placeholder="닉네임을 입력하세요" />
					</div>
				</div>
				<div class="email">
					<p>이 메 일</p>
					<div>
						<input type="email" id="email_input" placeholder="이메일을 입력하세요" />
					</div>
				</div>
				<div class="infos">
					<button>정보 수정</button>
				</div>
				<div class="pws">
					<button type="button" id="modal_btn">비밀번호 변경</button>
				</div>
			</div>
		</section>
		<section class="b">
			<div class="main_newpage">
				<div class="pw_title">
					<h2>비밀번호 수정</h2>
				</div>
				<div class="now_pw">
					<p>현재 비밀번호</p>
					<div>
						<input type="text" id="now_input" placeholder="입력하세요" />
					</div>
				</div>
				<div class="new_pw">
					<p>변경 비밀번호</p>
					<div>
						<input type="password" id="new_input" placeholder="변경할 비밀번호" />
					</div>
				</div>
				<div class="ag_pw">
					<p>비밀번호 확인</p>
					<div>
						<input type="password" id="ag_input" placeholder="비밀번호 다시입력" />
					</div>
				</div>
				<div class="pw_ok">
					<button>
						<a href="#" id="change_ok">변경하기</a>
					</button>
				</div>
			</div>
			<div class="quit">
				<button id="modal_x">취소</button>
			</div>
		</section>
	</div>
</body>
<script>
let box = document.querySelector(".a");

setTimeout(function () {
    box.classList.remove("active3");
  }, 1000);
	
</script>
</html>