<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하루생각</title>
<link href="${rootPath}/resources/css/home.css?ver-003" rel="stylesheet"/>


<script>
	document.addEventListener("DOMContentLoaded",()=>{
		
		document.querySelector("body").addEventListener("click",(ev)=>{
			location.href="${rootPath}/main";
		})
		
		document.querySelector("svg").addEventListener("click",(ev)=>{
			location.href="${rootPath}/main";
		})
	})
</script>

</head>
<body>
	
		<span></span>
		<span></span>
		<span></span>
		<span></span>
	
	
	<div id="intro">
		<object class="intro_logo" data="resources/logo-white-v2.svg"
			type="image/svg+xml"> </object>
	</div>
</body>
</html>