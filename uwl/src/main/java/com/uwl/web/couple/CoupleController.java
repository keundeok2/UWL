package com.uwl.web.couple;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.uwl.common.Search;
import com.uwl.service.couple.CoupleService;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Couple;
import com.uwl.service.domain.Post;



@Controller
@RequestMapping("/couple/*")
public class CoupleController {
	
	@Autowired
	@Qualifier("coupleServiceImpl")
	private CoupleService coupleService;
	
	public CoupleController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "login2")
	public String getMatching(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("/couple/login2");
		
		model.addAttribute("userId", userId);
		System.out.println("userId : " + userId);
		
		return "forward:/couple/login2.jsp";
	}
	
	@RequestMapping(value = "getCoupleTimelinePostList")
	public String getCoupleTimelinePostList(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("/couple/getCoupleTimelinePostList");
		
		model.addAttribute("userId", userId);
		
		Search search = new Search();
		Map<String, Object> map = coupleService.getCoupleTimelinePostList(search, userId);
		
		model.addAttribute("list", map.get("list"));
		
		
		
		return "forward:/couple/listCoupleTimelinePost.jsp";
	}
	
	@RequestMapping(value = "addCoupleTimelinePost")
	public String addCoupleTimelinePost(@RequestParam("userId") String userId, Model model, @RequestBody Post post) throws Exception {
		System.out.println("/couple/addCoupleTimelinePost");
		
		model.addAttribute("userId", userId);
		
		
		return "forward:/couple/addCoupleTimelinePost2.jsp";
	}
	
	@RequestMapping(value = "getCoupleTimelinePost")
	public String getCoupleTimelinePost(@RequestParam("userId") String userId, Model model, @RequestParam("postNo") int postNo) throws Exception {
		System.out.println("/couple/getCoupleTimelinePost");
		
		model.addAttribute("userId", userId);
		Post post = coupleService.getCoupleTimelinePost(postNo);
		
		
		
		model.addAttribute("post", post);
		
		
		return "forward:/couple/getCoupleTimelinePost.jsp";
	}
	
	@RequestMapping(value = "updateCoupleTimelinePost")
	public String updateCoupleTimelinePost(@RequestParam("userId") String userId, Model model, @RequestParam("postNo") int postNo) throws Exception {
		System.out.println("/couple/updateCoupleTimelinePost");
		
		model.addAttribute("userId", userId);
		
		Post post = coupleService.getCoupleTimelinePost(postNo);
		
		model.addAttribute("post", post);
		
		return "forward:/couple/updateCoupleTimelinePost.jsp";
	}
	
	@RequestMapping(value = "deleteCoupleTimelinePost")
	public String deleteCoupleTimelinePost(@RequestParam("userId") String userId, Model model, @RequestParam("postNo") int postNo) throws Exception {
		System.out.println("/couple/deleteCoupleTimelinePost");
		
		model.addAttribute("userId", userId);
		
		Post post = coupleService.getCoupleTimelinePost(postNo);
		
		model.addAttribute("post", post);
		return "forward:/couple/deleteCoupleTimelinePost.jsp";
	}
	
	@RequestMapping(value = "deleteCoupleTimelinePost2")
	public String deleteCoupleTimelinePost2(@RequestParam("userId") String userId, Model model, @RequestParam("postNo") int postNo) throws Exception {
		System.out.println("/couple/deleteCoupleTimelinePost2");
		
		model.addAttribute("userId", userId);
		Post post = coupleService.getCoupleTimelinePost(postNo);
		coupleService.deleteCoupleTimelinePost(post);
		
		return "";
	}
	
	@RequestMapping(value = "deleteCouple")
	public String deleteCouple(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("/couple/deleteCouple");
		
		model.addAttribute("userId", userId);
		
		return "forward:/couple/deleteCouple.jsp";
	}
	
	@RequestMapping(value = "deleteCouple2")
	public String deleteCouple2(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("/couple/deleteCouple2");
		
		model.addAttribute("userId", userId);
		
		Couple couple = coupleService.getCouple(userId);
		
		String secondUserId = couple.getSecondUserId();
		
		model.addAttribute("secondUserId", secondUserId);
		return "forward:/couple/deleteCouple3.jsp";
	}
	
	@RequestMapping(value = "deleteCouple3")
	public String deleteCouple3(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("/couple/deleteCouple3");
		
		Couple couple = coupleService.getCouple(userId);
		coupleService.deleteCouple(couple);
		
		return "forward:/couple/deleteCouple3.jsp";
	}
	
	
	
	
	
	

}
