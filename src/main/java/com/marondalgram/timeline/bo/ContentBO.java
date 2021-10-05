package com.marondalgram.timeline.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondalgram.post.bo.PostBO;
import com.marondalgram.timeline.model.ContentView;

@Service
public class ContentBO {
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	
	
	public List<ContentView> generateContentViewList() { // 가공 된 객체는 get이 아닌..generate
		
	}
	

}
