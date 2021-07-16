<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />



<c:forEach items="${LIKELIST}" var="WRITING" varStatus="i">
	<div class="board item1">
		<a class="card"> <img class="abc"
			src="${rootPath}/static/board_white.svg" />
			<article>
				<div class="profile_div">
					<img class="profile" src="${rootPath}/static/profile.png" />
					<p>${WRITING.wr_nick}</p>
				</div>
				<h1>${WRITING.wr_content}</h1>
				<h5>${WRITING.wr_origin}</h5>

				<%-- 조아영 - 0715 : 하트모양변경 --%>
				<span class="modal_span" data-seq="${WRITING.wr_seq}"> 	

					<c:choose>
					
						<c:when test="${LIKECHECK[i.index] == 0}">
							<div class="heart _black" id="heart_event">♡</div>
						</c:when>
						<c:when test="${LIKECHECK[i.index] == 1}">
							 <div class="heart _red"  id="heart_event">♥</div>
						</c:when>
						<c:otherwise>
							<div class="heart _black" id="heart_event">♡</div>
						</c:otherwise>
						
					</c:choose> 
					
					<p class="modal_count"> ${WRITING.wr_like_count} 명이 공감하였어요! </p>
				</span>
				<%-- 조아영 - 0715 : 하트모양변경 끝--%>
				
				<img class="modal_siren" src="${rootPath}/static/siren.png" />
				<c:if test="${USER.u_seq == WRITING.wr_user}">
				<div class="list_button">
					<input type="hidden" name="wr_seq" value="${WRITING.wr_seq}"/>
					<div class="update_btn">수정</div>
					<div class="delete_btn">삭제</div>
				</div>
				</c:if>
			</article>
		</a>
	</div>
</c:forEach>