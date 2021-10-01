package com.marondalgram.timeline;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TimelineController {
	// 글목록을 가져올때는 autowired-> postbo 가져오기
	// 좋아요를 가져올때는 autowired-> likebo 가져오기
	
	@RequestMapping("/timeline/list_view")
	public String timelineListView(Model model, HttpServletRequest request) {
		// 글 목록을 가져온다. (로그인 된 아이디가 쓴 글만 test1/0000 /userId=1)
		HttpSession session = request.getSession();
		
		// session 검증
		Integer userId = (Integer) session.getAttribute("userId");
		
		// section부분 바꿔주기(상황에 따라)
		return "template/layout_timeline";
	}
	
	
}
