<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="w-50"> 
		<div>
			 <label for="nameInput">name</label>
			 <input type="text" name="name" id="nameInput" class="form-control" >
		</div>
		<div>
			 <label for="websiteInput">website</label>
			 <input type="text" name="website" id="websiteInput" class="form-control">
		</div>
		<div>
			 <label for="introductionInput">introduction</label>
			 <input type="text" name="introduce" id="introduceInput" class="form-control" >
		</div>
	<%-- 프로필 업데이트 버튼 --%>
	<div class="mt-3">
		<a href="#" type="button" id="pfUpdateBtn" data-user-id="${user.id}" class="btn btn-secondary w-100 mb-3">update profile</a>
	</div>
	<%-- 로그아웃 버튼 --%>
	<div class="mt-1">
		<a href="/user/sign_out" type="button" id="signOutBtn" class="btn btn-secondary w-100 mb-3">sign out</a>
	</div>
</div>	

<script>
	$(document).ready(function() {
		// pfUpdateBtn 눌렀을 때
		$("#pfUpdateBtn").on('click', function(e){
			e.preventDefault(); 
			
			let name = $('#nameInput').val().trim();
			let website = $('#websiteInput').val().trim();
			let introduce = $('#introduceInput').val();
			
			// 동적 폼태그
			// let formData = new FormData();
			// formData.append("userId", $(this).data('post-id')); 못가져와..ㅜ
			//formData.append("name", name);
			//formData.append("website", website);
			//formData.append("introduce", introduce);
			
			// console.log($(this).data('post-id')); 안넘어가..ㅜ
			
			// 동적 폼태그
			var formData = new FormData();
			console.log($(this).data('user-id'));
			formData.append("userId", $(this).data('user-id'));
			formData.append("name", name);
			formData.append("website", website);
			formData.append("introduce", introduce);
			
			
			// ajax로 보내기
			$.ajax({
				type: 'post'
				, url: '/user/profile_update'
				, data: formData
				,enctype: 'multipart/form-data' // 파일 업로드를 위한 필수 설정
				,processData: false 			// 파일 업로드를 위한 필수 설정
	           	,contentType: false 
				, success: function(data){
					if (data.result == 'success'){
						location.href= '/user/profile_view';
					}
				}
				, error: function(e){
					alert("Profile update has failed." + e);
				} 
			});  // ajax close
			
			
			
		}); // pfUpdateBtn close
		
		
		
	}); //  document close

</script>