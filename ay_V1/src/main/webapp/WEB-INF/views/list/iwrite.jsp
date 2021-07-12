<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />


<c:forEach items="${MYWRITING}" var="WRITE" varStatus="i">
	<div class="board item1">
		<a class="card"> <img class="abc"
			src="${rootPath}/resources/board_white.svg" />
			<article>
				<div>
					<img class="profile" src="${rootPath}/resources/profile.png" />
					<p>${WRITE.wr_nick}</p>
				</div>
				<h1>${WRITE.wr_content}</h1>
				<span> 
				<c:choose>
					<c:when test="${LIKECHECK[i.index] == 0}">
					<img class="heart"
							src="${rootPath}/resources/heart_black.png" />
					</c:when>
					<c:when test="${LIKECHECK[i.index] == 1}">
					<img class="heart"
							src="${rootPath}/resources/heart_red.png" />
					</c:when>
					<c:otherwise>
					<img class="heart"
							src="${rootPath}/resources/heart_black.png" />
					</c:otherwise>
				</c:choose> ${WRITE.wr_like_count} 명이 공감하였어요!
				</span>
			</article>
		</a>
	</div>
</c:forEach>