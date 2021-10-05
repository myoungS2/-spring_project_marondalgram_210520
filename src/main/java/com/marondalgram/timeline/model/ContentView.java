package com.marondalgram.timeline.model;

import java.util.List;

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
	
}
