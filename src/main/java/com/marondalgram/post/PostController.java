package com.marondalgram.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PostController {
	
	@RequestMapping("/timeline/list_view")
	public String timelineListView() {
		// section부분 바꿔주기(상황에 따라)
		
		return "template/layout_timeline";
	}
}
