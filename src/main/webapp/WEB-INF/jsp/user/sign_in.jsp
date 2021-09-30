<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="form-group">
	<form id="loginForm" action="/user/sign_in" method="post">
		<div class="w-100">
			<input type="text" id="loginIdInput" name="loginId" class="form-control mt-3" placeholder="ID">
			<input type="password" id="passwordInput" name="password" class="form-control mt-3"  placeholder="PASSWORD">
		</div>	
		<div class="d-flex justify-content-center mt-3">	
			<button type="submit" id="signinBtn" class="btn btn-secondary col-5">sign in</button>
		</div>	
		<div class="d-flex justify-content-center mt-3" >
			<a id="signup" type="button" href="/user/sign_up_view">sign up</a>
		</div>
	</form>	
	
	<script>
		$(document).ready(function(){
			// loginForm submit 될 때 동작
			$('#loginForm').submit(function(e){
				e.preventDefault(); // submit 자동 수행 중단
				
				// validation
				let loginId = $('#loginIdInput').val().trim();
				if (loginId == '') {
					alert("ENTER YOUR ID");
					return false; // 그냥 return시 submit되어버림
				}
				
				let password = $('#passwordInput').val();
				if (password == '') {
					alert("ENTER YOUR PASSWORD");
					return false;
				}
				
				let url = $(this).attr('action'); // this = loginForm
				let data = $(this).serialize(); // 쿼리스트링으로 name 값들을 구성하고 request body(post방식)에 넣어 보낸다. 
				console.log("url :" + url);
				console.log("data :" + data);
				
				$.post(url, data)
				.done(function (data) {
					if (data.result == 'success'){ // data중에 key명이 result인것의 value가 success일 때..!
						location.href= '/timeline/list_view';  // 화면이동 시 복잡한 데이터를 들고있을 경우 ajax가 아닌 submit으로 처리하는 것이 낫다.
					} else {
						alert("sign in has failed. try again.");
					}
				}); // post.done close
				
				
			}); // loginForm close
		}); // document close
	
	
	
	</script>
	
</div>	
