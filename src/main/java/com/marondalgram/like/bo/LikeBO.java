package com.marondalgram.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondalgram.like.dao.LikeDAO;

@Service
public class LikeBO {
	// likeDAO 연결
	@Autowired
	private LikeDAO likeDAO;
	
	// 좋아요 여부
	public void LikeYn(int postId, int userId) {
		boolean existLike = existLike(postId, userId);
		if (existLike) {
			likeDAO.deleteLikeByPostIdUserId(postId, userId);
		} else {
			likeDAO.insertLike(postId, userId);
		}
	}
	
	public boolean existLike(int postId, Integer userId) {
		// 로그인 하지 않을 시 좋아요x
		if (userId == null) {
			return false;
		}
		int count = likeDAO.selectLikeCountByPostIdOrUserId(postId, userId);
		return count > 0? true : false; // 이 부분 코드가 무슨 뜻일까...
	}
	
	// select like count 
	public int getLikeCountByPostId(int postId) {
		return likeDAO.selectLikeCountByPostIdOrUserId(postId, null); 
	}
	
	// delete like
	public void deleteLikeByPostIdUserId(int postId, int userId) {
		likeDAO.deleteLikeByPostIdUserId(postId, userId);
	}
}
