<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h1>FORM</h1>

	<button id="btn2">전송</button>
	<form id="user_form" method="POST">
		<div>
			<label>USER ID</label>
			<input name="user_id">
		</div>
		<div>
			<label>이름</label>
			<input name="name">
		</div>
		<div>
			<label>전화번호</label>
			<input name="tel">
		</div>
		<div>
			<label>나이</label>
			<input name="age">
		</div>
		
		
	</form>


</body>
<script>
	var rootPath = "${rootPath}"
</script>

<script type="text/javascript" src="${rootPath}/resources/form.js?ver-001"></script>
</html>