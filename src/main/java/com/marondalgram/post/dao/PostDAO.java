package com.marondalgram.post.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.marondalgram.post.model.Post;

@Repository
public interface PostDAO {
	
	// select DB
	public List<Post> selectPostListByUserId(int userId);
	
}
