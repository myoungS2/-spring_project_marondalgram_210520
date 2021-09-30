<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Marondalgram</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- AJAX를 사용하기 위해 slim 아닌 풀버전의 jquery로 교체 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- css 연결 -->
<link rel="stylesheet" type="text/css" href="/static/css/marondalgram_style.css"> <!-- application.yml에 새로운 설정을 해주었기 때문에 기존과 다르게 /static/을 포함 -->
</head>
<body>
	<div id="wrap" class="container">
		<header id="timelineHeader" class="d-flex justify-content-between">
			<jsp:include page="../include/gnb_timeline.jsp" />
		</header>
		<section class="postArea d-flex justify-content-center">
			<%-- 새 게시물 작성공간--%>
			<div class="newpostArea">
				
			</div>
			<%-- 게시물 --%>
			<div>
				<%-- 사용자이름/ 삭제버튼 --%>
				<div class="d-flex justify-content-between">
					<div class="font-weight-bold">myoung.e</div>
					<div>
						<img src="https://www.iconninja.com/files/860/824/939/more-icon.png" type="button" alt="delete" width="20" height="20">
					</div>
				</div>
				<%-- 게시물(사진) --%>
				<div class="postImg"> <%-- 자체적인 사이즈 정해주기 --%>
					<img src="https://cdn.pixabay.com/photo/2015/12/04/14/05/code-1076536_960_720.jpg" alt="postImg" width="600" height="600">
				</div>
				<%-- 좋아요버튼 눌렀을때->♥ 다시눌렀을때->♡ (토글)--%>
				<div class="likeArea">
					<img src="https://www.iconninja.com/files/527/809/128/heart-icon.png" class="d-none" alt="fullHeart" width="20" height="20">
					<img src="https://www.iconninja.com/files/214/518/441/heart-icon.png" alt="emptyHeart" width="20" height="20">
					
				</div>
				<%-- 좋아요수 카운트 --%>
				<div class="likeCount">
					<span><small>126 likes</small></span>
				</div>
				<%-- 게시물(내용) --%>
				<div class="postContent">
					<span class="font-weight-bold">myoung.e</span>
					<span>java하기 딱 좋은 날씨네...</span>
				</div>
				<%-- 댓글달기 --%>
				<div class="getComment">
					<input type="text" id="commentInput" placeholder="post your comment here.">
					<a type="button" herf="#" id="commentBtn">Post</a>
				</div>
			</div>
		</section>
	</div>

</body>
</html>