<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div>
	<%-- 새 게시물 작성공간--%>
	<div class="newpostArea border rounded">
		<div>
			<textarea id="writeContentArea" class="w-100 border-0" rows="5" cols="80" placeholder="Enter your content here."></textarea>
		</div>
		<div class="buttons d-flex justify-content-between m-2">
			<div class="d-flex">
				<div>
				<%-- file upload 버튼 --%>
					<input type="file" id="file" class="d-none" accept=".jpg,.jpeg,.png,.gif"> <%-- input file을 d-none으로 숨겨둠 --%>
					<a href="#" id="fileUploadBtn"><img src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png" width="30" height="30"></a>
				</div>
				<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
				<div id="fileName" class="ml-2">
				</div>
			</div>
			<%-- upload 버튼이 되어야 함 --%>
			<a id="postCreateBtn" class="btn">
				<img src="/static/images/upload.jpg" width="30" height="30">
			</a>
		</div>
	</div>
	
	
	<%-- 게시물 --%>
	<div class="border rounded p-2">
		<%-- 반복문으로 post가져오기 --%>
		<c:forEach var="post" items="${postList}">
		<%-- 사용자이름/ 삭제버튼 --%>
		<div class="d-flex justify-content-between">
			<div class="font-weight-bold ml-3">${loginId}</div> <%-- session에서 가져오기 --%>
			<div> <%-- TODO: 게시글 작성자 = 로그인 된 사용자 일때만 나타나기 --%>
				<img src="https://www.iconninja.com/files/860/824/939/more-icon.png" type="button" alt="delete"  class="mr-3 d-none" width="20" height="20">
			</div>
		</div>
		
		<%-- 게시물(사진) --%>
		<div class="postImg mt-3 ml-1" width="600" height="600">
			<img src="${post.imgUrl}" alt="postImg" width="600" height="600">
		</div>
		
		<%-- 좋아요버튼 눌렀을때->♥ 다시눌렀을때->♡ (토글)--%>
		<div class="likeArea mt-3 ml-3">
			<img src="https://www.iconninja.com/files/527/809/128/heart-icon.png"
				class="d-none" alt="fullHeart" width="20" height="20"> 
			<img
				src="https://www.iconninja.com/files/214/518/441/heart-icon.png"
				alt="emptyHeart" width="20" height="20">
		</div>
		
		<%-- 좋아요수 카운트 --%>
		<div class="likeCount ml-3">
			<span><small>126 likes</small></span>
		</div>
		
		<%-- 게시물(내용) --%>
		<div class="postContent ml-3">
			<%-- 사용자 id --%>
			<span class="font-weight-bold">${loginId}</span> 
			<%-- post content --%>
			<span>${post.content}</span>
		</div>
		
		<%-- 댓글달기 --%>
		<div class="getComment ml-3 d-flex justify-content-between">
			<input type="text" id="commentInput" class="w-100 border-0" placeholder="post your comment here."> 
			<a type="button" herf="#" id="commentBtn" class="btn ml-3">Post</a>
		</div>
		</c:forEach>
	</div>
	
</div>

<script>
	$(document).ready(function() {
		// 파일 업로드 이미지 버튼 클릭 -> 파일 선택 창이 뜸
		$('#fileUploadBtn').on('click', function(e) {
			e.preventDefault(); // 제일 위로 올라가는 동작 중지
			// 숨겨두었던 input file이 동작하게
			$('#file').click(); // 사용자가 input file을 클릭한 것과 같은 동작
		
		}); // fileUploadBtn close
		
		// 사용자가 파일을 선택했을 때 -> fileUploadBtn 옆에 파일명을 옆에 노출시킴
		$('#file').on('change', function(e) {
			let fileName = e.target.files[0].name; // 사용자가 선택한 파일 -> fileName변수에 저장
			console.log("fileName:" + fileName);
			
			// 파일 형식 체크 (방법2)
			let fileNameArr = fileName.split('.');
			if (fileNameArr[fileNameArr.length - 1] != 'png'  
				&& fileNameArr[fileNameArr.length - 1] != 'gif'
				&& fileNameArr[fileNameArr.length - 1] != 'jpg'
				&& fileNameArr[fileNameArr.length - 1] != 'jepg') { // fileNameArr의 마지막 인덱스 = 파일 확장자
				// if문이 참이면-> 잘못 된 파일 형식
				alert("The file format is invalid.");
				$(this).val('') // 잘못 된 파일을 비워준다.
				return;
			} 
			// 파일 형식이 제대로 되었다면 -> 파일 이름 노출! (div사이에)
			$('#fileName').text(fileName); // 위에 fileName에 저장 된 값을 가져옴! 
		}); // file close
		
		// 새 게시물
		$('#postCreateBtn').on('click', function(e){
			// 내용 가져오기
			let content = $('#writeContentArea').val();
			console.log(content); // 값 잘 가져와지는지 확인
			if (content == '') {
				alert("Content is empty.");
				return;
			}
			
			// 이미지 가져오기
			let file = $('#file').val();
			console.log("file" + file);
			
			if (file != ''){
				// 1.  파일명을 .을 기준으로 split -> 배열에 저장
				// 확인 : console.log(file.split('.'));
				// 2. pop : 마지막값(확장자) 빼내기 <> push
				let ext = file.split('.').pop().toLowerCase() // 3. toLowerCase : 빼낸 값을 몽땅 소문자로 변경해서 값 비교하기/ 4. ext 변수에 담기
				// 5. if문
				// 파일 형식 체크 (방법1)
				if ($.inArray(ext,['jpg', 'jpeg', 'png', 'gif']) == -1) {
					// 배열(허용하고자하는 확장자가 들어있음)에 들어있냐 -> 참이면, 잘못들어 온 확장자 
					alert("The file format is invalid.");
					// 잘못 된 파일 형식 -> 비워주기
					$('#file').val('');
					return;
				}
			} // if문 close
			
			// 폼태그 만들기
			let formData = new FormData();
			// 객체에 데이터(내용) 넣기 
			formData.append('content', content);
			// 객체에 데이터(이미지파일) 넣기
			formData.append('file', $('#file')[0].files[0]); // 오늘의 error 1 : append -> appent...ㅠㅠ
			
			
			// ajax(request를 위한 설정)
			$.ajax({
				type: 'post'
				, url: '/post/create'
				, data: formData
				// 업로드 시 -> 필수 파라미터가 있어야함(아래 3개)
				, enctype: 'multipart/form-data'
				, processData: false
				, contentType: false
				, success: function(data){
					if (data.result == 'success'){
						alert('Successfully posted');
						location.reload(); // 새로고침
					}
				}
				, error: function(e) {
					alert('Failed to post. please try again' + e);
				}
				
			}); // ajax close
			
			
		}); // postCreateBtn close
		
		
	}); // document close

</script>