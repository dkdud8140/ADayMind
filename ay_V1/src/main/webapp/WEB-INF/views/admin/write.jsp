<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	<c:forEach items="${WTLIST}" var="WRITE">
		<tr data-seq="${WRITE.wr_seq}">
			<td>${WRITE.wr_seq}</td>
			<td>${WRITE.wr_nick}</td>
			<td>${WRITE.wr_content}</td>
			<td><fmt:formatDate value="${WRITE.wr_write_date }" type="both"/></td>
		</tr>
	
	</c:forEach>
	
</table>
</div>