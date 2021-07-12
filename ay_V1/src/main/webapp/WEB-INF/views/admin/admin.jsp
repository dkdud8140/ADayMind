<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<link href="${rootPath}/resources/css/basic.css?ver-001"
	rel="stylesheet" />

<style>
body {
	display: flex;
}

nav#admin_nav {
	width: 200px;
	height: 100vh;
	background-color: #eee;
}

nav#admin_nav h1 {
	text-align: center;
	margin-top: 200px;
	color:  #092540;
	font-family: "cafe24s";
	padding: 0;
	font-size: 34px;
}

nav#admin_nav p {
	text-align: center; 
	top : -10px;
}

nav#admin_nav ul {
	list-style: none;
	position: relative;
}

nav#admin_nav li {
	padding: 10px;
	padding-left: 20px;
}

nav#admin_nav li:hover {
	cursor: pointer;
}

nav#admin_nav li:nth-of-type(1) {
	text-align: center;
}

nav#admin_nav li:nth-of-type(2) {
	margin-top: 50px;
}

nav#admin_nav li:nth-of-type(5) {
	margin-top: 400px;
	text-align: center; 
	font-weight: 600;
	color:  #092540;
	padding: 10px;
}

div#admin_body {
	top: 300px;
	width: 100%;
	height: 100vh;
}
</style>
</head>
<body>

	<nav id="admin_nav">
		<h1>하루생각</h1>
		<p>관리자페이지</p>
		<ul>
			<li></li>
			<li id="to_admin_write">모든 글 보기</li>
			<li id="to_admin_user">모든 회원 보기</li>
			<li id="to_admin_warning">신고 처리하기</li>
			<li id="to_main">메인페이지</li>
		</ul>
	</nav>

	<div id="admin_body">

		<c:choose>
			<c:when test="${ADMIN eq 'admin_write' }">
				<%@ include file="/WEB-INF/views/admin/write.jsp"%>
			</c:when>

			<c:when test="${ADMIN eq 'admin_user' }">
				<%@ include file="/WEB-INF/views/admin/user.jsp"%>
			</c:when>

			<c:when test="${ADMIN eq 'admin_warning' }">
				<%@ include file="/WEB-INF/views/admin/warning.jsp"%>
			</c:when>

			<c:otherwise>
				<%@ include file="/WEB-INF/views/admin/write.jsp"%>
			</c:otherwise>
		</c:choose>

	</div>
</body>

<script type="text/javascript">
  	
 		document.querySelector("nav#admin_nav").addEventListener("click",(e)=>{
 			
 			let name = e.target.tagName
 			if(name === "LI") {
 				let menu = e.target.id
 				
 				if(menu === "to_main") {
 					location.href="${rootPath}/main";
 				} else if(menu === "to_admin_write") {
 					location.href="${rootPath}/admin";
 				} else if(menu === "to_admin_user") {
 					location.href="${rootPath}/admin/admin_user";
 				} else if(menu === "to_admin_warning") {
 					location.href="${rootPath}/admin/admin_warning";
 				}
 			}
 			
 		})
  
  </script>
</html>