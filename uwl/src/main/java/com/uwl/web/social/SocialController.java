package com.uwl.web.social;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.community.CommunityService;
import com.uwl.service.domain.Ask;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.User;
import com.uwl.service.social.SocialService;

@Controller
@RequestMapping("/social/*")
public class SocialController {
	
	public SocialController() {
		System.out.println("SocialController");
	}
	
	@Autowired
	private SocialService socialService;
	
	@Autowired
	private CommunityService communityService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	/////////////////	ASK
	
	@RequestMapping(value = "addQuestion/{userId}", method = RequestMethod.GET)
	public String addQuestion(@PathVariable String userId, Model model) throws Exception{
		model.addAttribute("targetUserId", userId);
		return "forward:/social/addQuestion.jsp";
	}
	@RequestMapping(value = "addQuestion", method = RequestMethod.POST)
	public String addQuestion(@ModelAttribute Ask ask) throws Exception{
		socialService.addQuestion(ask);
		return "forward:/social/listAsk.jsp";
	}

	@RequestMapping(value = "replyQuestion", method = RequestMethod.POST)
	public String replyQuestion(@ModelAttribute Ask ask) throws Exception{
		socialService.replyQuestion(ask);
		return "forward:/social/getAskQuestionList";
	}
	
	@RequestMapping(value = "rejectQuestion", method = RequestMethod.POST)
	public String rejectQuestion(@RequestParam int questionPostNo) throws Exception{
		socialService.rejectQuestion(questionPostNo);
		return "forward:/social/getAskQuestionList";
	}
	
	@RequestMapping(value = "getAskQuestionList", method = RequestMethod.POST)
	public String getQuestionList(@ModelAttribute Search search, HttpSession session, Model model) throws Exception{
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println("search : " + search);
		System.out.println("userId : " + ((User)(session.getAttribute("user"))).getUserId());
		search.setPageSize(pageSize);
		Map<String, Object> map = socialService.getAskQuestionList(((User)(session.getAttribute("user"))).getUserId(), search, "1");
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		map.put("resultPage", resultPage);
		model.addAttribute("map", map);
		return "forward:/social/listAskQuestion.jsp";
		
	}
	
	@RequestMapping(value = "getAskList/{targetUserId}", method = RequestMethod.GET)
	public String getAskList(@ModelAttribute Search search,@PathVariable String targetUserId, Model model) throws Exception{
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = socialService.getAskList(targetUserId, search, "2");
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		map.put("resultPage", resultPage);
		model.addAttribute("map", map);
		return "forward:/social/listAsk.jsp";
	}
	
	////////////////// TL
	
	@RequestMapping(value = "getTimelineList/{targetUserId}", method = RequestMethod.GET)
	public String getTimelineList(@ModelAttribute Search search, @PathVariable String targetUserId, HttpSession session ,Model model) throws Exception{
		String sessionId = ((User)session.getAttribute("user")).getUserId();
	
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		if (sessionId.equals(targetUserId)) {
			search.setSearchCondition("1");
		} else {
			search.setSearchCondition("0");
		}
		
		//	TL 게시글 가져오기
		Map<String, Object> map = socialService.getTimelineList(targetUserId, search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		map.put("search", search);
		map.put("resultPage", resultPage);
		
		// TL 댓글 가져오기
		
		model.addAttribute("map", map);
		
		return "forward:/social/listTimeline.jsp";
	}
	
	
	@RequestMapping(value = "addTimeline", method = RequestMethod.POST)
	public String addTimeline(@ModelAttribute Post post, Model model, HttpSession session) throws Exception{
		System.out.println("addTiemline post : " + post);
		socialService.addTimeline(post);
		
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		
		return "redirect:/social/getTimelineList/"+sessionId;
	}
	
	
}
