package com.marondalgram.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.marondalgram.comment.bo.CommentBO;

@RequestMapping("/comment")
@RestController
public class CommentRestController {
	
	// logger
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// commentBO 연결
	@Autowired
	private CommentBO commentBO;
	
	/**
	 * Create Comment
	 * @param postId
	 * @param comment
	 * @param request
	 * @return
	 */
	@RequestMapping("/create")
	public Map<String, Object> commentCreate(
			@RequestParam("postId") int postId,
			@RequestParam("comment") String comment,
			HttpServletRequest request){
		
		Map<String, Object> result = new HashMap<>();
		
		// 로그인 확인
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		if (userId == null) {
			result.put("result", "error");
			logger.error("[create comment] userId Null");
			return result;
		}
		
		// insert DB
		commentBO.createComment(postId, userId, comment);
		
		result.put("result", "success");
		
		// return
		return result;
	}
	
	/**
	 * Delete Comment
	 * @param commentId
	 * @return
	 */
	@PostMapping("/delete")
	public Map<String, Object> commentDelete(
			@RequestParam("commentId") int commentId){
		
		Map<String, Object> result = new HashMap<>();	
		
		// delete DB
		commentBO.deleteComment(commentId);
		
		
		result.put("result", "success");
		
		// return
		return result;
	}
}
