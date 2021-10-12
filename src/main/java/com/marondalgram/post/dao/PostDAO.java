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
	
	// select DB
	public Post selectPost(int id);
	
	// delete DB
	public void deletePost(int id);
	
	// select DB
	public List<Post> selectPostImg(int userId);
	
	// select DB
	public int selectPostCountByPostUserId(int userId);
	
}
