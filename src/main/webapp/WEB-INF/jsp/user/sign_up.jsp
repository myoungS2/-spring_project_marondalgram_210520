<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="form-group">
	<div class="w-100">
		<form id="signupForm" method="post" action="/user/sign_up">
			<div class="d-flex">
				<input type="text" id="loginIdInput" name="loginId" class="form-control mt-3"  placeholder="ID">
				<a id="idCheckHref" href="#" class="mt-3 ml-3">IDcheck</a>
			</div>
			<div id="idCheckDuplicated" class="small text-danger d-none">this ID has already been used.</div><br>
			<div id="idCheckOk" class="small text-success d-none">you can create account with this ID.</div>
			<div>
				<input type="password" id="passwordInput" name="password"class="form-control mt-3" placeholder="PASSWORD">
			</div>
			<div class="d-flex justify-content-center mt-3"  >	
				<button type="button" id="signupBtn" class="btn btn-secondary col-5">sign up</button>
			</div>
		</form>		
	</div>
	
	<script>
		$(document).ready(function() {
			
			// 아이디 중복확인
			$('#idCheckHref').on('click', function(e) {
				// loginIdInput 값 가져오기
				let loginId = $('#loginIdInput').val().trim();
				// loginIdInput 값 가져와지는 것 체크
				// alert(loginId);
				
				// idCheckDuplicated, idCheckOk 상태값
				// 1) id 중복 여부 -> ajax 서버 호출
				$.ajax({
					// request info
					type: 'get'
					, url: '/user/is_duplicated_id' // api -> view화면x (주의!!!)
					, data: {"loginId":loginId}
					// 응답값
					, success: function(data) {
						alert(data.result); // true of false
						
						if (data.result) {
							// true = 중복
							$('#idCheckDuplicated').removeClass('d-none'); // 경고 문구 노출
							$('#idCheckOk').addClass('d-none'); 
						} else {
							// false = 사용가능
							$('#idCheckDuplicated').addClass('d-none'); 
							$('#idCheckOk').removeClass('d-none'); // 문구 노출
						}
					} // success close
					, error: function(e) {
						alert("ID Check has failed.");
					} // error close
					
				}); // ajax close
				
			}); // idCheckHref close			
			
			// signupBtn
			$('#signupBtn').on('click', function(){
				let loginId = $('#loginIdInput').val().trim();
				if (loginId == '') {
					alert("ENTER YOUR ID");
				}
				let password = $('#passwordInput').val();
				let confirmPassword = $('#passwordConfirmInput').val();
				if (password == '' || confirmPassword == ''){
					alert(" ENTER YOUR PASSWORD");
					return;
				}	
				
				// idCheckDuplicated 여부 확인
				// #idCheckOk가 <div> 클래스에 d-none이 없으면 중복확인 완료
				if ($('#idCheckOk').hasClass('d-none')) {
					alert("FINISH ID CHECKING");
				}
				
				// 서버에 요청
				let url = $('#signUpForm').attr('action');
				// alert(url);
				let data = $('#signUpForm').serialize(); // serialize : 도메인객체(model)에 있는 필드-> String 구성하는 것..? (다른서버한테 필드에 있는 값을 보낼 때 사용함)
				console.log(data);		
				// 폼 태그에 있는 데이터를 한번에 보낼 수 있게 구성한다. 그렇지 않으면 json으로 구성해야한다.
				
				$.post(url, data)
				.done(function(data) {
					if (data.result == 'success'){
						alert("welcome Marondalgram. sign in now")
						location.href = '/user/sign_in_view';
					} else { // ajax 통신은 성공, 로직상 실패
						alert("sign up has failed.")					
					}
				}); // post ajax close
				
			});// signupBtn close
			
		}); // document close 
	</script>
	
</div>	
