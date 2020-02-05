package com.uwl.web.matching;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.uwl.service.domain.Matching;
import com.uwl.service.domain.User;
import com.uwl.service.matching.MatchingService;

@Controller
@RequestMapping("/matching/*")
public class MatchingController {

	@Autowired
	@Qualifier("matchingServiceImpl")
	private MatchingService matchingService;

	public MatchingController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "addMatching", method = RequestMethod.GET)
	public String addMatchingView(HttpServletRequest request, @RequestParam("secondUserId") String secondUserId) throws Exception {
		System.out.println("/matching/addMatching : GET");
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		String userId = user.getUserId();
		
		if(matchingService.getMatching(userId) == null) {
			Matching matching = new Matching();
			
			matching.setFirstUserId(userId);
			matching.setSecondUserId(secondUserId);
			
			matchingService.addMatching(matching);
			
			Matching matching2 = matchingService.getMatching(secondUserId);
			if(matching2 != null && matching2.getSecondUserId() == userId) {
				matching.setMatchingStatus("2");
				matching2.setMatchingStatus("2");
				
				matchingService.updateMatching(matching);
				matchingService.updateMatching(matching2);
			}
		}
		
		
		return "";
	}
	
	

	

	@RequestMapping(value = "getMatching", method = RequestMethod.POST)
	public String getMatchingView() throws Exception {
		System.out.println("/matching/getMatching : POST");
		return "";
	}
	
	

	@RequestMapping(value = "updateMatching", method = RequestMethod.GET)
	public String updateMatching() throws Exception {
		System.out.println("/matching/updateMatching : GET");

		return "";
	}
	
	@RequestMapping(value = "deleteMatching", method = RequestMethod.GET)
	public String deleteMatching() throws Exception {
		System.out.println("/matching/deleteMatching : GET");
		return "";
	}

	@RequestMapping(value = "getMatchingList")
	public String getMatchingList() throws Exception {
		System.out.println("/matching/getMatchingList : GET");

		return "";
	}

	@RequestMapping(value = "getAllMatchingList")
	public String getAllMatchingList() throws Exception {
		System.out.println("/matching/getAllMatchingList : GET");

		return "";
	}
	
	@RequestMapping(value = "getTotalMatching", method = RequestMethod.GET)
	public String getTotalMatching() throws Exception {
		System.out.println("/matching/getTotalMatching : GET");
		return "";
	}

	@RequestMapping(value = "getItem", method = RequestMethod.GET)
	public String getItem() throws Exception {
		System.out.println("/matching/getItem : GET");

		return "";
	}

	@RequestMapping(value = "updateItem", method = RequestMethod.GET)
	public String updateItemView() throws Exception {
		System.out.println("/matching/updateItem : GET");
		return "";
	}
	
	

	@RequestMapping(value = "getItemList")
	public String getItemList() throws Exception {
		System.out.println("/matching/getItemList : GET");
		return "";
	}

	@RequestMapping(value = "getAllItemList")
	public String getAllItemList() throws Exception {
		System.out.println("/matching/getAllItemList : GET");
		return "";
	}
	
	@RequestMapping(value = "getTotalItem", method = RequestMethod.GET)
	public String getTotalItem() throws Exception {
		System.out.println("/matching/getTotalItem : GET");
		return "";
	}
}
