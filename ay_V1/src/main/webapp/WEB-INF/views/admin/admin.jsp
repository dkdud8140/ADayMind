<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지</title>
<link href="${rootPath}/resources/css/basic.css?ver-002"
	rel="stylesheet" />

<style>
body {
display: flex;
}

nav#admin_nav {
	width: 200px;
	height: 100vh;
	background-color: #eee;
	background-attachment: fixed;
}

nav#admin_nav h1 {
	text-align: center;
	margin-top: 100px;
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
	width: 100%;
	height: 100vh;
	overflow: auto;
}

	div.list_box	h2 {
		padding: 1rem 3rem ;
		color:  #092540;
		margin-top: 15px;
		border-bottom: 3px solid rgba(200, 200, 200, 0.5);
	}
	div.list_box table.list_table {
		margin : 50px auto ;
		border-collapse: collapse;
		width: 70%;
	}
	
	div.list_box table.list_table tr {
		border-top : 1px solid #cccccc;
	}
	
	div.list_box table.list_table tr:first-child {
		background-color: #ddd;
		text-align: center;
		font-weight: 400;
	}
	div.list_box table.list_table tr:last-child {
		border-bottom : 1px solid #cccccc;
	}
	
	div.list_box table.list_table td {
		padding: 0.5rem ;
		overflow: hidden;
		white-space: nowrap;
	}
	
	div.list_box table.list_table tr td:nth-child(1){
		text-align : center;
		width: 5%
	}
	div.list_box table.list_table tr td:nth-child(2){
		text-align : center;
		width: 10%
	}
	div.list_box table.list_table tr td:nth-child(3){
		width: 65%
	}
	div.list_box table.list_table tr td:nth-child(4){
		width: 20%
	}
	

	div.list_box.user table.list_table tr td:nth-child(1){
		text-align : center;
		width: 5%
	}
	div.list_box.user table.list_table tr td:nth-child(2){
		text-align : center;
		width: 20%
	}
	div.list_box.user table.list_table tr td:nth-child(3){
		width: 35%
	}
	div.list_box.user table.list_table tr td:nth-child(4){
		width: 20%
	}
	div.list_box.user table.list_table tr td:nth-child(5){
		width: 10%
	}
	div.list_box.user table.list_table tr td:nth-child(6){
		width: 10%
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