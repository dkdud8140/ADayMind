<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하루생각 입력하기</title>
<link href="${rootPath}/static/css/insert.css?ver-014"
	rel="stylesheet" />
</head>
<body>
	<%@ include file="header.jsp"%>
	<form id="writing_insert" method="POST" action="${rootPath}/insert">
	<div id="b_container2">
		<section id="b2_con" class="active3">
			<!-- bottom 상자 위로 위동 -->
			<div id="bottom"></div>
			<div id="imgntext">
				<div id="grid">
					<div id="coment">
						<h3>${USER.u_nick}님의 이름으로 하루생각을 보냅니다.</h3>
					</div>
					<div>
						<input type="hidden" name="u_seq" value="${USER.u_seq}"/>
						<input type="hidden" name="u_nick" value="${USER.u_nick}"/>
						<input type="text" name="wr_content" id="text1" class="img0" 
						maxlength="3000" placeholder="하루생각을 입력하세요." />
					</div>
					<div>
						<input type="text" name="wr_origin" id="text2" class="img0" 
						maxlength="50" placeholder="출처를 입력하세요." />
					</div>
				</div>
			</div>
			<div>
			<button type="button" class="save">보내기</button>
			</div>
		</section>
	</div>
	</form>
	<!-- form 끝 -->
</body>
<script>
	let box = document.querySelector("#b2_con");
	setTimeout(function() {
		box.classList.remove("active3");
	}, 1000);
	
	let form_insert = document.querySelector("form#writing_insert")
	let writing_btn = document.querySelector("button.save");
	let wr_content = document.querySelector("input#text1");
	let wr_origin = document.querySelector("input#text2");
	writing_btn.addEventListener("click",()=>{
		
		if(wr_content.value === "") {
			alert("글 내용을 작성해야 합니다")
			wr_content.focus();
			return false;
		}
		if(wr_origin.value === "") {
			alert("출처를 입력해주세요")
			wr_origin.focus();
			return false;
		}
		form_insert.submit();
	})
	
	
</script>
</body>
</html>