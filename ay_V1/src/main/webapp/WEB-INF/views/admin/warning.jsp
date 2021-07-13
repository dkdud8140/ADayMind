<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<div class="list_box user">
<h2>신고글조회하기</h2>

<div>
	<select>
		<option>신고번호</option>
		<option>글번호</option>
		<option>유저번호</option>
		<option>신고내용</option>
	</select>
		
	<input></input>
	<button>검색하기</button>
</div>

<table class = "list_table">
	<tr>
		<td>No.</td>
		<td>글번호</td>
		<td>신고내용</td>
		<td>유저번호</td>
		<td>처리여부</td>
		<td>신고일자</td>
		
	</tr>
	
	<c:forEach items="${WARNINGS}" var="WARNING">
		<tr>
			<td>${WARNING.wa_seq}</td>
			<td>${WARNING.wa_writing}</td>
			<td>${WARNING.wa_content}</td>
			<td>${WARNING.wa_user}</td>
			<td>${WARNING.wa_check}</td>
			<td>${WARNING.wa_date}</td>
		</tr>
	
	</c:forEach>
	
</table>
</div>