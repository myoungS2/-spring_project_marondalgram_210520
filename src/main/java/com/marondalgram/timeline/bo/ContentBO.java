package com.marondalgram.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondalgram.comment.bo.CommentBO;
import com.marondalgram.comment.model.Comment;
import com.marondalgram.like.bo.LikeBO;
import com.marondalgram.post.bo.PostBO;
import com.marondalgram.post.model.Post;
import com.marondalgram.timeline.model.ContentView;

@Service
public class ContentBO {
	// postBO 연결
	@Autowired
	private PostBO postBO;
	// commentBO 연결
	@Autowired
	private CommentBO commentBO;
	// likeBO 연결
	@Autowired
	private LikeBO likeBO;
	
	// post 가져오기
	public List<ContentView> generateContentViewList(Integer userId) { // 가공 된 객체는 관례적으로 get이 아닌 generate를 사용..!
		List<ContentView> contentViewList = new ArrayList<>();
		
		List<Post> postList = postBO.getPostList();
		// postList-> 반복문돌려서 post 1개를 꺼냄
		for (Post post: postList) {
			// post 1개와 맵핑 될 1개의 content를 만들기
			ContentView content = new ContentView();
			
			// 글
			content.setPost(post);
			
			List<Comment> commentList = commentBO.getCommentList(post.getId());	
				// 댓글들
				// CommentBO로 댓글목록 가져오기 -> 글 id에 해당하는..!
				content.setCommentList(commentList);
			
			
			// (내가 누른) 좋아요
			// 좋아요 -> userId, postId -> 좋아요 여부
			 content.setLikeYn(likeBO.existLike(post.getId(), userId));
			
			// 좋아요 count
			// 좋아요 -> postId -> 좋아요 개수
			content.setLikeCount(likeBO.getLikeCountByPostId(post.getId()));
			
			
			// contentViewList에 위의 것들 add..!
			contentViewList.add(content);
			
		}
		
		return contentViewList;
	}

	public int userId() {
		// TODO Auto-generated method stub
		return 0;
	}
}
