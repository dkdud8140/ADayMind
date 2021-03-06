<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<style>
	
	div.detail_box {
		width: 100%;
		height: 100%;
		background-color: #eee;
	}
	
	
	div.detail_content {
		width: 70%;
		height: auto;
		background-color: #FFF;
		border-radius: 10px;
		margin: auto;
		margin-top: 50px;
		box-shadow: 10px 10px 10px 10px rgba(0,0,0,0.1);
		padding: 20px;
	}

</style>



<div class="detail_box">
	<h2>유저 상세보기</h2>
	
	<div class="detail_content">
		<table>
			<tr>
				<td>유저번호</td>
				<td>${USER.u_seq}</td>
			</tr>
			<tr>
				<td>유저id</td>
				<td>${USER.u_id}</td>
				<td>유저pw</td>
				<td >${USER.u_pw}</td>
			</tr>
			
			<tr>
				<td>유저닉네임</td>
				<td>${USER.u_nick}</td>
				<td>유저이메일</td>
				<td>${USER.u_mail}</td>
			</tr>
			<tr>
				<td>유저경고</td>
				<td>${USER.u_warning}</td>
				<td>Level</td>
				<td>${USER.u_level}</td>
			</tr>
		</table>
		
		<div class = "btn_box">
			<button>회원 차단하기</button>
			<button>회원 정보삭제</button>
		</div>
	</div>
	
	<c:if test="${not empty WTLIST }">
	
		<div class="list_box">
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
	
	</c:if>	
	
	
</div>

<script>
document.querySelector("table.list_table").addEventListener("click",(e)=>{
		if(e.target.tagName === "TD") {
				let wr_seq = e.target.closest("TR").dataset.seq
				location.href = "${rootPath}/admin/admin_write/" + wr_seq
			}
})

</script>



