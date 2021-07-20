<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<div class="list_box user">
<h2>전체회원 보기</h2>


<!--  0716 : 글 검색창 -->
<div class="div_search_box">
	
	<select name="category" id="category" >
		<option>-</option>
		<option value="seq" <c:if test="${CAT == 'seq'}">selected="selected"</c:if>>유저번호</option>
		<option value="id"<c:if test="${CAT == 'id'}">selected="selected"</c:if>>아이디</option>
		<option value="nick"<c:if test="${CAT == 'nick'}">selected="selected"</c:if>>닉네임</option>
		<option value="mail"<c:if test="${CAT == 'mail'}">selected="selected"</c:if>>이메일</option>
	</select>
	<form class="frm_search" >
		<input name="search" id="search">
		<input type="button" class="btn_search" value="검색하기">
	</form>
	
</div>
<!--  0716 : 끝-->



<table class = "list_table">
	<tr>
		<td>No.</td>
		<td>아이디</td>
		<td>닉네임</td>
		<td>이메일</td>
		<td>경고횟수</td>
		<td>유저레벨</td>
	</tr>
	
	<!-- 0716 검색결과없을 때 추가 -->
	<c:choose>
		<c:when test="${empty USERS}">
			<tr>
				<td colspan="6">검색결과가 없습니다</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${USERS}" var="USER">
				<tr data-id="${USER.u_seq}">
					<td>${USER.u_seq}</td>
					<td>${USER.u_id}</td>
					<td>${USER.u_nick}</td>
					<td>${USER.u_mail}</td>
					<td>${USER.u_warning}</td>
					<td>${USER.u_level}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</div>

<script>
	
	// 0716 셀렉트 선택하기 
	let category = document.querySelector("select[name='category']")
	category.addEventListener("change",(e)=>{
		let value = category.value
		location.href="${rootPath}/admin/user_search/" + value
	})

	// 0716 search 내용 뿌리기
	document.querySelector("input.btn_search").addEventListener("click",(e)=>{
		document.querySelector("form").submit()
	})
	
	
</script>

