<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%-- 가운데 정렬을 위한 div --%>
<div class="w-50"> 
	<%-- 끝으로 분리를 위한 div --%>   
	<div class="d-flex justify-content-between">    
		
		<%-- 사용자 정보(loginId, name, website, introduce) --%>
		
			<div>
				<div class="font-weight-bold ml-3">${userInfo.loginId}</div>
				<div class="font-weight-bold ml-3">${userInfo.name}</div>
				<div class="ml-3">
					<a href="${userInfo.website}">${userInfo.website}</a>
				</div>
				<div class="ml-3">${userInfo.introduce}</div>
			</div>
		
		<%-- 게시물 수 (count) --%>
		<div>
			<!-- <div class="font-weight-bold">647</div>
			<span><small>게시물</small></span> -->
		</div>
	</div>	
	
	<%-- 프로필 편집 버튼 --%>
	<div>
		<a href="/user/profile_update" type="button" id="profileBtn" class="btn btn-secondary w-100 mb-3">edit profile</a>
	</div>
	
	<%-- 사용자가 올린 게시물(사진만) --%>
	<div class="d-flex felx-wrap">
			<div class="postImg w-100" width="170" height="170">
			<c:if test="${userId eq userInfo.id}">
				<c:forEach var="content" items="${contentViewList}">
					<img src="${content.post.imgUrl}" class="m-1" alt="postImg" width="170" height="170">
				</c:forEach>
			</c:if>	
			</div>
	</div>
</div>	