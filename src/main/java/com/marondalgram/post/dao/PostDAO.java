package com.marondalgram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondalgram.post.model.Post;

@Repository
public interface PostDAO {
	
	// select DB
	public List<Post> selectPostList();
	
	// insert DB
	public int insertPost(
			@Param("userId") int userId,
			@Param("content") String content,
			@Param("imgUrl") String imgUrl);
}
