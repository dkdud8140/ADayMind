<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<style>
	h1 {
		padding: 1rem 3rem ;
	}
	table.list_table {
		margin : 50px auto;
		border-collapse: collapse;
		width: 80%;
	}
	
	table.list_table tr {
		border-top : 1px solid #cccccc;
	}
	
	table.list_table tr:first-child {
		background-color: #ddd;
		text-align: center;
		font-weight: 400;
	}
	table.list_table tr:last-child {
		border-bottom : 1px solid #cccccc;
	}
	
	table.list_table td {
		padding: 0.5rem ;
		overflow: hidden;
	}
	
	table.list_table tr td:nth-child(1){
		text-align : center;
		width: 5%
	}
	table.list_table tr td:nth-child(2){
		text-align : center;
		width: 10%
	}
	table.list_table tr td:nth-child(3){
		width: 65%
	}
	table.list_table tr td:nth-child(4){
		width: 20%
	}
	
	
	
</style>

<h1>전체글조회하기</h1>

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