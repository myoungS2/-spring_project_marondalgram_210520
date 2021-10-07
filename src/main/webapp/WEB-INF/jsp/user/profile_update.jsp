<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="w-50"> 
	<div>
		 <label for="nameInput">name</label>
		 <input type="text" id="nameInput" class="form-control">
	</div>
	<div>
		 <label for="websiteInput">web site</label>
		 <input type="text" id="websiteInput" class="form-control">
	</div>
	<div>
		 <label for="introductionInput">introduction</label>
		 <input type="textarea" id="introductionInput" class="form-control">
	</div>
	
	<%-- 프로필 업데이트 버튼 --%>
	<div class="mt-3">
		<a href="#" type="button" id="pfUpdateBtn" class="btn btn-secondary w-100 mb-3">update profile</a>
	</div>
	
	<div class="mt-1">
		<a href="#" type="button" id="signOutBtn" class="btn btn-secondary w-100 mb-3">sign out</a>
	</div>
</div>	