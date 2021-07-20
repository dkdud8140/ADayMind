<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<style>
	section.page_box {
		display: flex;
		justify-content: center;
		align-items: center;
		margin-bottom: 30px;
	}
	
	section.page_box ui{
		list-style: none;
		margin: 10px auto ;
		display: flex;
	}
	
	section.page_box li{
		cursor: pointer;
		display: inline-block;
		width: 30px;
		height: 30px;
		border-radius: 50%;
	}
	section.page_box li:first-of-type,
	section.page_box li:last-of-type{
		width: 40px;
		height: 30px;
		border-radius: 50%;
	}
	
</style>

<section class = "page_box">

	<ul class="page_nav">
	
		<li data-num="1">처음</li>

		<c:forEach begin="${PAGE_NAV.startPage}" end="${PAGE_NAV.endPage}" var="pageNum">
						
			<li data-num="${pageNum}" class=
			" <c:if test="${PAGE_NUM == pageNum}">active</c:if>" >
			${pageNum}</li>
			
		</c:forEach>
		
		<li data-num="${PAGE_NAV.totalPages}">끝</li>
		
	</ul>
	
</section>

<script>
	const page_nav = document.querySelector("ul.page_nav")
	if(page_nav) {
		page_nav.addEventListener("click",(e)=>{
			const li = e.target
			
			if(li.tagName === "LI") {
				const pageNum = e.target.dataset.num
				if( ${ADMIN eq 'admin_write' } ) {
					location.href = "${rootPath}/admin/admin_write?pageNum=" + pageNum
				} else if( ${ADMIN eq 'admin_user' } ) {
					location.href = "${rootPath}/admin/admin_user?pageNum=" + pageNum
				} else if( ${ADMIN eq 'admin_warning' } ) {
					location.href = "${rootPath}/admin/admin_warning?pageNum=" + pageNum
				}
			}
		})
	}

</script>

