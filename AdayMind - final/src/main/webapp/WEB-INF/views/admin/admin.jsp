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
<link href="${rootPath}/static/css/basic.css?ver-101" rel="stylesheet" />
<link href="${rootPath}/static/css/admin.css?ver-101" rel="stylesheet" />
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
	
	<%@ include file="/WEB-INF/views/paging_nav.jsp" %>
	</div>
	
	
	
</body>


<script type="text/javascript">
		
const admin_nav = document.querySelector("nav#admin_nav")
const list_table = document.querySelector("table.list_table")

	if(admin_nav) {
		admin_nav.addEventListener("click",(e)=>{
 			
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
	}
 		
 	if(list_table) {
 		list_table.addEventListener("click",(e)=>{
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
 	}
 		
  </script>
</html>