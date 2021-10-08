package com.marondalgram.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondalgram.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	// insert DB
	public void insertComment(
			@Param("postId")int postId, 
			@Param("userId")int userId, 
			@Param("comment")String comment);
	
	// select DB
	public List<Comment> selectCommentList(int postId);
	
	// delete DB
	public void deleteComment(int id);
}
