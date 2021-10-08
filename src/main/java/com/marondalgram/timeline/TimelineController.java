package com.marondalgram.timeline;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.marondalgram.post.bo.PostBO;
import com.marondalgram.post.model.Post;
import com.marondalgram.timeline.bo.ContentBO;
import com.marondalgram.timeline.model.ContentView;

@Controller
public class TimelineController {
	// 글목록을 가져올때는 autowired-> post bo 가져오기
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private ContentBO contentBO;
	
	
	@RequestMapping("/timeline/list_view")
	public String timelineListView(Model model, HttpServletRequest request) {
//		// 글 목록을 가져온다. (로그인 된 아이디가 쓴 글만 test1/0000 /userId=1)
		 HttpSession session = request.getSession();
//		
//		// session 검증
		 Integer userId = (Integer) session.getAttribute("userId");
//		
//		 // 포스트,좋아요, 댓글가 함께 담긴..!  -> List<ContentView> 객체를 새로 만들어 줌..! -> contentBO

		 
//		 List<Post> postList = postBO.getPostList(); //  DB에 가까운 객체 -> Entity
//		 model.addAttribute("postList", postList);
		 List<ContentView> contentViewList = contentBO.generateContentViewList(userId); 
		 																	// 로그인 된 사용자의 좋아요 상태를 표시하기 위해 userId 파라미터를 추가한다. 
		 model.addAttribute("contentViewList", contentViewList);
		 
		// section부분 바꿔주기(상황에 따라)
		 model.addAttribute("viewName", "timeline/timeline");
		 
		 
		 return "template/layout_timeline";
	}
	
	
}
