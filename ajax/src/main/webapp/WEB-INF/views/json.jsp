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
	<h1>JSON</h1>
	<button id="jason1">JSON 문자열</button>

</body>
<script type="text/javascript">
	var rootPath
</script>
<script type="text/javascript" src="${rootPath}/resources/json.js?ver-001"></script>
</html>