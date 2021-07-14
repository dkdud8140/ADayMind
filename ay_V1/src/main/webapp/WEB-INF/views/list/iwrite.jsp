<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />



<c:forEach items="${MYWRITING}" var="WRITING" varStatus="i">
	<div class="board item1">
		<a class="card"> <img class="abc"
			src="${rootPath}/static/board_white.svg" />
			<article>
				<div class="profile_div">
					<img class="profile" src="${rootPath}/static/profile.png" />
					<p>${WRITING.wr_nick}</p>
				</div>
				<h1>${WRITING.wr_content}</h1>
				<span class="modal_span" data-seq="${WRITING.wr_seq}"> 
				<c:choose>
					<c:when test="${LIKECHECK[i.index] == 0}">
					<img class="heart"
							src="${rootPath}/static/heart_black.png" />
					</c:when>
					<c:when test="${LIKECHECK[i.index] == 1}">
					<img class="heart"
							src="${rootPath}/static/heart_red.png" />
					</c:when>
					<c:otherwise>
					<img class="heart"
							src="${rootPath}/static/heart_black.png" />
					</c:otherwise>
				</c:choose>
				<p class="modal_count"> ${WRITING.wr_like_count} 명이 공감하였어요! </p>
				</span>
				<img class="modal_siren" src="${rootPath}/static/siren.png" />
				<c:if test="${USER.u_seq == WRITING.wr_user}">
				<div class="list_button">
					<div class="update_btn">수정</div>
					<div class="delete_btn">삭제</div>
				</div>
				</c:if>
			</article>
		</a>
	</div>
</c:forEach>