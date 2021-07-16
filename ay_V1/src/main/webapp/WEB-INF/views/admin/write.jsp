<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<div class="list_box">
<h2>전체글조회하기</h2>


<!-- 글 검색창 -->
<div>
	
	<select name="category" id="category" >
		<option value="seq" <c:if test="${CAT == 'seq'}">selected="selected"</c:if>>글번호</option>
		<option value="user"<c:if test="${CAT == 'user'}">selected="selected"</c:if>>유저</option>
		<option value="content"<c:if test="${CAT == 'content'}">selected="selected"</c:if>>글내용</option>
		<option value="date"<c:if test="${CAT == 'date'}">selected="selected"</c:if>>날짜별</option>
	</select>
	<form >
		<c:choose>
			<c:when test="${CAT == 'date' }">
				<input type="date" name="search">부터 <input type="date" name="search">
			</c:when>
			<c:otherwise>
				<input name="search" id="search">
			</c:otherwise>
			
		</c:choose>
			<input type="button" class="btn_search" value="검색하기">
	</form>
	
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

<script>
	
	let category = document.querySelector("select[name='category']")
	category.addEventListener("change",(e)=>{
		let value = category.value
		location.href="${rootPath}/admin/write_search/" + value
	})

	document.querySelector("input.btn_search").addEventListener("click",(e)=>{
		document.querySelector("form").submit()
	})
	
	
</script>

