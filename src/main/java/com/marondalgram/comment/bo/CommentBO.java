package com.marondalgram.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondalgram.comment.dao.CommentDAO;
import com.marondalgram.comment.model.Comment;

@Service
public class CommentBO {
	// dao 연결
	@Autowired
	private CommentDAO commentDAO;
	
	// insert DB
	public List<Comment> addCommentList();
		
	
	
	// select DB
	public List<Comment> getCommentList(){
		return commentDAO.selectCommentList();
	}
	
	
}
