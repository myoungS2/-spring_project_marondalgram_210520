package com.marondalgram.timeline.model;

import java.util.List;

import com.marondalgram.comment.model.Comment;
import com.marondalgram.post.model.Post;

public class ContentView {
	// 게시글 1개
	private Post post; //  게시글 그 자체
	// 댓글 n개
	private List<Comment> commentList; 
	// 내가 한 좋아요 -> 로그인 된 상태에서 좋아요를 눌렀거나, 안눌렀거나 -> boolean
	private boolean likeYn; //  true -> ♥, flase-> ♡
	// 좋아요 총 개수
	private int likeCount;

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public List<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

	public boolean isLikeYn() {
		return likeYn;
	}

	public void setLikeYn(boolean likeYn) {
		this.likeYn = likeYn;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
}
