<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<c:forEach items="${LIKELIST}" var="LIKE">
	<div class="board item1">
		<a class="card"> <img class="abc"
			src="${rootPath}/resources/board_white.svg" />
			<article>
				<div>
					<img class="profile" src="${rootPath}/resources/profile.png" />
					<p>${LIKE.wr_nick}</p>
				</div>
				<h1>${LIKE.wr_content}</h1>
				<span> <img class="heart"
					src="${rootPath}/resources/heart_red.png" /> ${LIKE.wr_like_count}
					명이 공감하였어요!
				</span>
			</article>
		</a>
	</div>
</c:forEach>