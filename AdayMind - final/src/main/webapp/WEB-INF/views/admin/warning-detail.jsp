<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />


<div class="detail_box">
	<h2>신고글 처리하기</h2>
	
	<!-- 삭제하기용 form추가 -->
	<form id="form_delete" method="POST" action="${rootPath}/admin/admin_warning/delete">
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
				<c:choose>
					<c:when test="${WARNING.wa_check eq 0 }">
						<td><input type="checkbox">신고접수됨</td>
					</c:when>
					<c:when test="${WARNING.wa_check eq 1 }">
						<td><input type="checkbox">신고접수취소</td>
					</c:when>
					<c:otherwise>
						<td><input type="checkbox">신고접수됨</td>
					</c:otherwise>
				</c:choose>
			</tr>
			
		</table>
		
		<div class = "btn_box">
			<input type="hidden" name="wa_seq" value="${WARNING.wa_seq}"/>
			<button id="delete" >삭제하기</button>
		</div>
	</div>
	</form>
	
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
	
		// 0720 삭제추가
	document.querySelector("button#delete").addEventListener("click",(e)=>{
		
		if(confirm("삭제하시겠습니까?")) {
			document.querySelector("form#form_delete").submit();
  		} else {
  			return false;
  		}
	})
	
	
</script>