<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div><a id="timelineLogo" href="#">Marondalgram</a></div>
<div>
	<%-- 로그인 되어있으면 myprofile보여주고, 로그아웃 되어있으면 signin보여주기 --%>
	<div><a id="signinHref" href="/user/sign_in_view">sign in</a></div>
	<div><a id="myprofile" href="/user/profile_view" class="d-none">my profile</a></div> <%-- 내 프로필로 이동 (나중에 img 적용예정) --%>
</div>
