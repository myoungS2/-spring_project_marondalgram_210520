package com.marondalgram.comment.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.marondalgram.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	// select DB
	public List<Comment> selectCommentList();
}
