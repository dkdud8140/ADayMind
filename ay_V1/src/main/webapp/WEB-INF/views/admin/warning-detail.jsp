<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />


<div class="detail_box">
	<h2>신고글 처리하기</h2>
	
	<div class="detail_content">
		<table>
			<tr>
				<td>신고글번호</td>
				<td>${WARNING.wa_seq}</td>
			</tr>
			<tr class="click" id="wa_writing" data-seq="${WARNING.wa_writing}">
				<td>글번호</td>
				<td>${WARNING.wa_writing}</td>
			</tr>
			<tr class="click"  id="wa_user"  data-seq="${WARNING.wa_user}">
				<td>유저번호</td>
				<td>${WARNING.wa_user}</td>
			</tr>
			<tr>
				<td>신고내용</td>
				<td>${WARNING.wa_content}</td>
			</tr>
			<tr>
				<td>신고일자</td>
				<td><fmt:formatDate value="${WARNING.wa_date}" type="both"/></td>
			</tr>
			<tr class="click" id="wa_reporter"  data-seq="${WARNING.wa_reporter}">
				<td>신고자</td>
				<td>${WARNING.wa_reporter}</td>
			</tr>
			<tr>
				<td>신고처리여부</td>
				<td><input type="checkbox">${WARNING.wa_check}</td>
			</tr>
			
		</table>
		
		<div class = "btn_box">
			<button>회원 정보삭제</button>
		</div>
	</div>
</div>

<script>
	document.querySelector("div.detail_content table").addEventListener("click",(e)=>{
		
		if(e.target.tagName === "TD") {
			let className = e.target.closest("TR").className
			if(className === "click") {
				let seq = e.target.closest("TR").dataset.seq
				let id = e.target.closest("TR").id
				
				if(id === "wa_writing") {
					location.href= "${rootPath}/admin/admin_write/" + seq
				} else if(id === "wa_user") {
					location.href= "${rootPath}/admin/admin_user/" + seq
				} else if(id === "wa_reporter") {
					location.href= "${rootPath}/admin/admin_user/" + seq
				}
				
			}
		}
		
	})
</script>
