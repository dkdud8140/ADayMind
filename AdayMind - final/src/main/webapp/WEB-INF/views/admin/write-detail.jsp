<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<div class="detail_box">
	<h2>글 상세보기</h2>
	
	<!-- 삭제하기용 form추가 -->
	<form id="form_delete" method="POST" action="${rootPath}/admin/admin_write/delete">
	<div class="detail_content" >
		<table>
			<tr>
				<td>글번호</td>
				<td>${WRITE.wr_seq}</td>
			</tr>
			<tr class="click" id="wr_user" data-seq="${WRITE.wr_user}" >
				<td>유저번호</td>
				<td>${WRITE.wr_user}</td>
				<td>유저닉네임</td>
				<td>${WRITE.wr_nick}</td>
			</tr>
			<tr>
				<td>글내용</td>
				<td colspan="3" align="left" >${WRITE.wr_content}</td>
			</tr>
			<tr>
				<td>글출처</td>
				<td colspan="3" align="left">${WRITE.wr_origin}</td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td><fmt:formatDate value="${WRITE.wr_write_date }" type="both"/></td>
				<td>수정일자</td>
				<td><fmt:formatDate value="${WRITE.wr_last_date }" type="both"/></td>
			</tr>
			<tr>
				<td>공감수</td>
				<td>${WRITE.wr_like_count}</td>
				<td>신고수</td>
				<td>${WRITE.wr_warning_count}</td>
			</tr>
		</table>
		
		<div class = "btn_box">
			<input type="hidden" name="wr_seq" value="${WRITE.wr_seq}"/>
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
				location.href= "${rootPath}/admin/admin_user/" + seq
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