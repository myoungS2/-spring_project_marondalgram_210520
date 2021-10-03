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
			<%-- file upload 버튼 --%>
			<input type="file" id="file" accept=".jpg,.jpeg,.png,.gif">
			<%-- upload 버튼이 되어야 함 --%>
			<a id="postCreateBtn" class="btn">
				<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAe1BMVEUAAAD///9iYmJMTEw0NDTMzMz39/ff39/X19fQ0NCqqqqFhYXj4+NYWFjHx8fCwsIlJSWRkZEbGxtpaWm0tLRGRkbz8/Otra25ubkUFBTi4uKWlpacnJw/Pz93d3eJiYkuLi4iIiJ7e3tdXV1SUlJBQUGioqIQEBBoaGivrrK3AAAJnElEQVR4nO2dbVviOhCGQV5bKggq6KpYwNX9/7/w2PV4mqaTZJI+yRQPz7fd67LpTdtkMm8ZDH+6BtI3EF0XwvPXhfD8dSE8f10IMZoWs2yyzPN8vVgs1nn+vpxks2KaZOzYhMVqd3wrHweUHsu3Y/5QRL6DeITTIl+MSTJd40U+i/c84xBus/UV/dxM+rhaZ9so9xKBcHZ3OnjRfWtzvZvhbwdNWDyVQXTfOqzRkFDC4vmlE96XyvUv5E3hCKerEwDvS9cPuJkHRbh93cD4Kj0uUKsIhnD+B4r3pVMGuTcE4fI6Al+l0Qpwd90Jl6NIfJV+d2fsSpjF5Kv00pWxG+GvWO+nqlG3FbIL4fY1AV+lYxd7rgPhzs/y7KR3AcLiLR3fp16Cl8dQwvekfJWekhIW98kBPx9j2IwTRHgnwFcp6GsMIJziLGxfjQImVX/Cedj2FqOPSXzCnSBfJe831ZdwLww4GNxGJdzGtkI5evH7GL0Ii1Ka7q8OXsuGD+FcGu0/+cw3HoQraS5FDzEIH6SpGsrxhNKrhK5nNGHfAPmWOJMwl+YhxHyKPMJ+fYPf4n2LLMI+zaKq7lCE/VkHdS0xhIU0h0VzBOG2lMawaOO2Ud2EEg4LvsbdCXHbpcfbu/nfoNn8bo8LVF11JYQthJp3fgl7NVzLooMQNY3etE3lVQm6tmOjYSecgnwye/LqC8zFB/bZxk4ICryYfCsgY/d3OCHoDszrcoYZwPop2ghBS73NfAQZvLaF30aIme7ob/BbmACdbVW0ED5HH7wSxnv3GkIIekddQWrQp2h2v5kJMT/uyAE4HGKiIOZXxUgIMmbcOTEzzEDG+dREuP2AjHtwAg6HiFy4T5mCxCZCUBLCmkEICieb5mwD4S/MqM55phLK9jUsigZCVBoCK8UQNNaLDyFoCh/wPHmokCvt6qfvARVEO7AIUVvFGz4hzHtoeHE0wfICSO8iSfgbNaR7va90hRqOXPYpQpwDODEh+RApQlw+V2pC6iEShEAXd2pCav0lCIEDJie85xAinfjJCQnDpk2I8oBVSk/YzrZpEU6RdRPpCduuxRYhNBgqQNjyXLYIobnpAoStuUYnxAYLBQhbc41O+AQdTYJw4SDk1bVyJUGoE2n/BrmFviVCqDm/NMI1djARQs1hoxGCM5xFCDWk5j/BL6kQYfM1bRKik7tkCJsuzCYhuhRNhrC56DcIt9haXinCpvu7QThBDyVE2HArNgjBa4UY4dFICC/3ESJsfIgq4RQ9khRhY5OoEqJXQzlCNftDJcRXTUoRqjngKuERPhKPEF/tdzIQBu2cPsZmlX9YhPvSco2wWLSB0Pcym9dVnLZATW1X69L31pS4pULoOdHc+xc7hivztCeVe1MIvbxsY4/KI4iWXgkNO5LQZyq1p3LFkY+rWsmRUgg98p35dVVIeZSQX9d/pRDyQ9ucMocY4u8MlDCbQnjD/XOZJ1iJ/RQ39d/UhOwsKIlv8FvsRKZ6i1gTcr3ddMZDKnHzNmrPd03IDf2mXiaaWjLvsvZG1YTMLCEiyppUzKW/XvJrQuZEhWi/1UXMV63OyqgJeSbNhho1qUrWfdbppjUhz1fq27MBL950Whs1NSEvcV12nqnEm2vqGFtNyIscRmgw6qkt6z5rd1tNyHv6EkyaWPdZmyX1LfNMdwkkTT+fkBV6qGfEMyRk2c8U4c//Ds9lLuV55qm59FzWQ551Sa2HPJvmSA2aVLx3jbJpeHbpIT2SJp7fmrJLmXuLlF5SSkyvLrW3YO4P3ySwFN36Pgj/Pb6Uo+1L3Goeao/PLeZyd6KIKa53n/LTsH1tnIq7WGL75SlfG99fKrcmcv1QtL/Uo8CK0fcmivjRMdrn7RG3kJltPGoG6biFT+yJ3Q8OKJ8eFkqicGj88Dr1mzrzOn6Bjh961jvdxj7GSFXhmUWhfEZd4vijHHpcihlv511Np+QXqITs5ULRzenKrJOeN09rbb1GGXBXplwMfI9gXpADn0+jGs8/MydKNbtUQnz3QClCNXz0/8pNhKd5SxE2iuQbhPAzR3qXI8w23bkSImwUrTdz9TFNaWr1LlcfWIn/JRnCZq+KJiF6RZQhbDb+ahKiV0QZwqbDUwu1gA846l/tGnq9ECHUkik0QvBrKkKoZfzoAUFsbVcP64DBr6kEoZ46qRNi62YkCPXQUStsDT1JRoCw1ZqqRQg95kGAsOXnbBFCbVMBwpYHsJ1cgfTWpCc8ta7eJkTONekJ291EiQQZ4AYjOSER3CQIgfXOyQmJhm1UkhOs5V5yQiqDmSLEHeCYmpCqdSET1WBNahIT3lDtUklC2EPk9b6EEZLlSnSyYUiMhhKvvgbVv5SuI6AJYS3NWISo35OuODPcA6gDNY8QNNbBcHX6v1F7fU4WHMqIMqRPmH5lkHXKOf4N1PbHdKSOiRDUmY6TIgbakZqyl41fCqg1nTtlA/RbGs9/MM8FmGW/vZvRhfkeDsbrmwlBE4DrcITow1jmc4zbzWW4eSUCGWWpTbatWJj31D6dYtxCtgPmbISgRdFWdQpq4G/LJLRaHdHnU9BHaE1MsttVIOPN9BRB3oSDlcFOiOpIS3+LqHisvVLJYRujchfe2rP5HJXs5Thv1WX9w7ruXjV/6RmzbsItV3agc3+DS6sbP03+9TJkz6jdGcNR4t7BlbCbqbR5wUYoN86TbNyEBTi2j5U7h5exC+/vgcesogGOn6Gvh1Y3EtY7EfbyZPVKrAPkeb4ifPYwQrwCLGZxNrx3K0C8NHkuIT71tLO4FcnsAvu+PUXmE/QgBB1LihK/CNKjSUKfphvWLOpNiD2gpZM462AI4TBDZ0kHyqv80a+VR1FKw31q41dP5tmsZAovyfDWiHUuZjCh/KrBXiWCCYXtcIfLAkI4LLCn7fjoENAeJ6hpkNSb6v2GBhMOM1To3UePYTXygY2fpvj+7S7tA3uHB7e2mqd9jJvgvjgdmnel/BqNEd6ohMMC5tV16NSlw1i3BmyTMgHfpltT2K4t5nbgU75a+mgd2ZiYcDjMY045h3dPKzQG4XAajXHTnQ9C+KmHGIZc6bPPNQvV6jFDt364RjWGwzWzLIAhs/ETrjUMtF1nhslv2kObNKEbki67WgF/0C3RI7RcnSxCX9eXxQQweWqK01S2uNv7zq7j/S5OW6Z4bXO3qzU3c/R+/RDvWKXIjYG3q/z4VppC94/laJ/HPjMqTevjYp5N8qfF6/620v51sc6Xk2yG/+gI9aG5c1xdCM9fF8Lz14Xw/HUhPH/9A8jfnEetKLKGAAAAAElFTkSuQmCC" 
				 width="20" height="20">
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
			<div>
				<img src="https://www.iconninja.com/files/860/824/939/more-icon.png"
					type="button" alt="delete"  class="mr-3" width="20" height="20">
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
		// 새 게시물
		$('#postCreateBtn').on('click', function(){
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
				if ($.inArray(ext,['jpg', 'jpeg', 'png', 'gif']) == -1) {
					// 배열(허용하고자하는 확장자가 들어있음)에 들어있냐 -> 참이면, 잘못들어 온 확장자 
					alert("잘못된 파일 형식입니다.");
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
			formData.appent('file', $('#file')[0].files[0]);
			
			// ajax(request를 위한 설정)
			$.ajax({
				type: 'post'
				, url: '/post/create'
				, data: 'formData'
				// 업로드 시 -> 필수 파라미터가 있어야함(아래 3개)
				, enctype: 'multipart/form-data'
				, processData: false
				, contentType: false
				, success: function(data){
					if (data.result == 'success'){
						alert('Successfully posted');
					}
				}
				, error: function(e) {
					alert('Failed to post. please try again' + e);
				}
				
			}); // ajax close
			
			
		}); // postCreateBtn close
		
		
	}); // document close

</script>