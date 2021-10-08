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
	public void createComment(int postId, int userId, String comment){
		commentDAO.insertComment(postId, userId, comment);
	}
	
	// select DB
	public List<Comment> getCommentList(int postId){
		return commentDAO.selectCommentList(postId);
	}
	
	// delete DB
	public void deleteComment(int commentId) {
		commentDAO.deleteComment(commentId);
	}
}
