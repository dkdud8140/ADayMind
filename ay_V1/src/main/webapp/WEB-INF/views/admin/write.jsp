<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<div class="list_box">
<h2>전체글조회하기</h2>

<div>
	<select>
		<option>글번호</option>
		<option>작성자</option>
		<option>글내용</option>
		<option>작성시간</option>
	</select>
		
	<input></input>
	<button>검색하기</button>
</div>

<table class = "list_table">
	<tr>
		<td>No.</td>
		<td>작성자</td>
		<td>글내용</td>
		<td>작성시간</td>
	</tr>
	
	<c:forEach items="${WTLIST}" var="WRITIE">
		<tr>
			<td>${WRITIE.wr_seq}</td>
			<td>${WRITIE.wr_nick}</td>
			<td>${WRITIE.wr_content}</td>
			<td>${WRITIE.wr_write_date}</td>
		</tr>
	
	</c:forEach>
	
</table>
</div>