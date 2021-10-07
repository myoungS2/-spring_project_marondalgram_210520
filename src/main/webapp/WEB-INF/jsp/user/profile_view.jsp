<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-between">    

	<%-- 사용자 정보(loginId, name, website, introduce) --%>
	<div>
		<div class="font-weight-bold ml-3">${loginId}</div>
	
		<div class="font-weight-bold ml-3">${name}</div>
		<div>
			<a href="${website}"></a>
		</div>
		<div>${introduce}</div>
	</div>
	
	<%-- 게시물 수 (count) --%>
	<div>
		<div class="font-weight-bold">647</div>
		<span><small>게시물</small></span>
	</div>
</div>	

<%-- 프로필 편집 버튼 --%>
<div>
	<a href="/user/profile_update" type="button" id="profileBtn" class="btn btn-secondary w-100">프로필 편집</a>
</div>

<%-- 사용자가 올린 게시물(사진만) --%>
<div>
	
</div>