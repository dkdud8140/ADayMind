<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지</title>
<link href="${rootPath}/static/css/basic.css?ver-002"
	rel="stylesheet" />

<style>
body {
display: flex;
}

nav#admin_nav {
	width: 200px;
	height: 100vh;
	background-color:#092540;
	background-attachment: fixed;
	color : #ddd;
}

nav#admin_nav h1 {
	text-align: center;
	margin-top: 100px;
	color:  #FFF;
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
	background-color: #ddd;
	color: #092540;
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
		width: 85%;
	}
	
	div.list_box table.list_table tr {
		border-top : 1px solid #cccccc;
		cursor: pointer;
		background-color: #FFF;
	}
	
	div.list_box table.list_table tr:first-child {
		background-color: #ddd;
		text-align: center;
		font-weight: 400;
		pointer-events: none;
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



	div.detail_box {
		width: 100%;
		height: 100%;
		background-color: #eee;
	}
	
	
	div.detail_content {
		width: 70%;
		height: 70%;
		background-color: #FFF;
		border-radius: 10px;
		margin: auto;
		margin-top: 50px;
		box-shadow: 10px 10px 10px 10px rgba(0,0,0,0.1);
		padding: 20px;
	}

	div.detail_box	h2 {
		padding: 1rem 3rem ;
		color:  #092540;
		margin-top: 15px;
		border-bottom: 3px solid rgba(200, 200, 200, 0.5);
		background-color: #FFF;
	}
	
	div.detail_content table {
		border: 1px solid #ddd;
		border-collapse: collapse;
		text-align: center;
		width: 80%;
		height: 70%;
		margin: 30px auto;
	}
	
	div.detail_content table tr{
		border-bottom: 1px solid #eee;
		height: 20px;
	}
	
	div.detail_content table td{
		padding: 10px ;
	}
	
	div.detail_content table tr td:nth-child(odd){
		background-color: #eee;
		width: 120px;
	}
	
	div.detail_content table tr td:nth-child(even){
		background-color: #fff;
		width: 350px;
	}
	
	div.btn_box {
		display: flex;
		width: 80%;
		margin: 30px auto;
	}
	
	div.detail_content button{
		background-color: #ccc ;
		padding : 5px 12px;
		outline: none;
		border: none;
		border-radius: 5px;
	}
	
	div.detail_content button:first-child{
		margin-left: auto;
		margin-right: 5px;
	}
	
	div.detail_content button:hover{
		cursor: pointer;
		
	}
	
	
	/* 0716 검색창 style 추가*/
	div.div_search_box {
	margin-top : 10px;
	margin-left : 50px;
	padding : 3px;
}

select#category { 
	display: inline-block;
	padding : 3px;
	margin : 3px;
}

form.frm_search{
	display: inline-block;
	margin : 3px;
	
}

form.frm_search input{
	padding : 5px;
	background-color: #ddd;
	border : none;
}

form.frm_search input.btn_search{
	padding : 5px 10px;;
	border: none;
	outline: none;
	border-radius: 2px;
	background-color: #092540;
	color: #fff;
	font-weight: 400;
	margin : 3px;
	cursor: pointer;
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
			<c:when test="${ADMIN eq 'admin_write_detail' }">
				<%@ include file="/WEB-INF/views/admin/write-detail.jsp"%>
			</c:when>

			<c:when test="${ADMIN eq 'admin_user' }">
				<%@ include file="/WEB-INF/views/admin/user.jsp"%>
			</c:when>
			<c:when test="${ADMIN eq 'admin_user_detail' }">
				<%@ include file="/WEB-INF/views/admin/user-detail.jsp"%>
			</c:when>

			<c:when test="${ADMIN eq 'admin_warning' }">
				<%@ include file="/WEB-INF/views/admin/warning.jsp"%>
			</c:when>
			<c:when test="${ADMIN eq 'admin_warning_detail' }">
				<%@ include file="/WEB-INF/views/admin/warning-detail.jsp"%>
			</c:when>

			<c:otherwise>
				<%@ include file="/WEB-INF/views/admin/write.jsp"%>
			</c:otherwise>
		</c:choose>

	</div>
</body>

<script type="text/javascript">
  	
  		document.querySelector("body").addEventListener("onload",(e)=>{
  			if("${ERROR eq 'NOT_RIGNT' }") {
  				alert("접근 권한이 없습니다")
  				location.href="${rootPath}/main";
  			}
  		})
  	
 		document.querySelector("nav#admin_nav").addEventListener("click",(e)=>{
 			
 			let name = e.target.tagName
 			if(name === "LI") {
 				let menu = e.target.id
 				
 				if(menu === "to_main") {
 					location.href="${rootPath}/main";
 				} else if(menu === "to_admin_write") {
 					location.href="${rootPath}/admin/admin_write";
 				} else if(menu === "to_admin_user") {
 					location.href="${rootPath}/admin/admin_user";
 				} else if(menu === "to_admin_warning") {
 					location.href="${rootPath}/admin/admin_warning";
 				}
 			}
 		})
 		
 		document.querySelector("table.list_table").addEventListener("click",(e)=>{
 			if(e.target.tagName === "TD") {
 				if(${ADMIN eq 'admin_user' }) {
	 				let u_id = e.target.closest("TR").dataset.id
	 				location.href = "${rootPath}/admin/admin_user/" + u_id
 				} else if(${ADMIN eq 'admin_write' }) {
	 				let wr_seq = e.target.closest("TR").dataset.seq
	 				location.href = "${rootPath}/admin/admin_write/" + wr_seq
 				} else if(${ADMIN eq 'admin_warning' }) {
	 				let wa_seq = e.target.closest("TR").dataset.seq
	 				location.href = "${rootPath}/admin/admin_warning/" + wa_seq
 				}
 			} 
 		})
 		
  
  </script>
</html>