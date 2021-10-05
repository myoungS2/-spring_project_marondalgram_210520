<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="ml-3 mt-3">
	<a id="timelineLogo" href="/timeline/list_view">Marondalgram</a>
</div>
<div class="mr-3 mt-3">
	<%-- 로그인 되어있으면 myprofile보여주고, 로그아웃 되어있으면 sign in보여주기 -> 로그인 시에만 timeline이 접근 가능하므로, 아마 안보여짐..ㅎ.. --%>
	<c:if test="${empty userId}">
		<a id="signinHref" href="/user/sign_in_view">sign in</a>
	</c:if>
	<c:if test="${not empty userId}">
		<a id="myprofile" href="/user/profile_view"> <img
			src="/static/images/profile.jpg" width="35" height="35" alt="profile">
		</a>
	</c:if>
</div>
