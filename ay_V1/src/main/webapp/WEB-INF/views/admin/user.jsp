<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<div class="list_box user">
<h2>전체회원 보기</h2>

<div>
	<select>
		<option>유저번호</option>
		<option>아이디</option>
		<option>닉네임</option>
		<option>이메일</option>
	</select>
		
	<input></input>
	<button>검색하기</button>
</div>

<table class = "list_table">
	<tr>
		<td>No.</td>
		<td>아이디</td>
		<td>닉네임</td>
		<td>이메일</td>
		<td>경고횟수</td>
		<td>유저레벨</td>
	</tr>
	
	<c:forEach items="${USERS}" var="USER">
		<tr>
			<td>${USER.u_seq}</td>
			<td>${USER.u_id}</td>
			<td>${USER.u_nick}</td>
			<td>${USER.u_mail}</td>
			<td>${USER.u_warning}</td>
			<td>${USER.u_level}</td>
		</tr>
	
	</c:forEach>
	
</table>
</div>