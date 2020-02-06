package com.uwl.web.matching;

import java.text.SimpleDateFormat;
import java.util.Date;

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

import com.uwl.common.Search;
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

	@RequestMapping(value = "addMatching2")
	public String addMatching2(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId, Model model) throws Exception {
		System.out.println("/matching/addMatching");
		
		if(matchingService.getMatching(userId) == null) {
			model.addAttribute("userId", userId);
			model.addAttribute("secondUserId", secondUserId);
			
			return "forward:/matching/addMatching2.jsp";
		} else {
			model.addAttribute("userId", userId);
			
			Matching matching = matchingService.getMatching(userId);
			secondUserId = matching.getSecondUserId();
			
			model.addAttribute("secondUserId", secondUserId);
			
			return "forward:/matching/deleteMatching.jsp";
		}
		
	}
	
	@RequestMapping(value = "deleteMatching")
	public String deleteMatching(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId, Model model) throws Exception {
		System.out.println("/matching/deleteMatching");
		
		model.addAttribute("userId", userId);
		model.addAttribute("secondUserId", secondUserId);
		
		return "forward:/matching/deleteMatching.jsp";
	}
	
	@RequestMapping(value = "updateItem")
	public String updateItem(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId, Model model) throws Exception {
		System.out.println("/matching/updateItem");
		
		if(matchingService.getItem(userId, "1") != null) {
			model.addAttribute("userId", userId);
			model.addAttribute("secondUserId", secondUserId);
			
			return "forward:/matching/updateItem.jsp";
		} else {
			return "forward:/matching/updateItem2.jsp";
		}
		
	}
	
	@RequestMapping(value = "addMatching3")
	public String addMatching3(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId, Model model) throws Exception {
		System.out.println("/matching/addMatching3");
		
		Matching matching = new Matching();
		
		matching.setFirstUserId(userId);
		matching.setSecondUserId(secondUserId);
		
		matchingService.addMatching(matching);
		
		Matching matching2 = matchingService.getMatching(secondUserId);
		if(matching2.getSecondUserId() == userId) {
			matching.setMatchingStatus("2");
			matching2.setMatchingStatus("2");
			
			matchingService.updateMatching(matching);
			matchingService.updateMatching(matching2);
		}
		
		return "forward:/matching/addMatching3.jsp";
	}
	
	@RequestMapping(value = " deleteMatching2")
	public String deleteMatching2(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId, Model model) throws Exception {
		System.out.println("/matching/deleteMatching2");
		
		Matching matching = matchingService.getMatching(userId);
		//꽃 보낸 시간
		String sendDate = matching.getSendDate().toString();
		System.out.println("sendDate : " + sendDate);
		
		//꽃 보내기 취소한 시간
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		
		Date time = new Date();
		
		String time1 = format1.format(time);
		
		System.out.println("time1 : " + time1);
		
		
		Date firstDate = format1.parse(sendDate);
		Date secondDate = format1.parse(time1);
		
		long calDate = firstDate.getTime() - secondDate.getTime();
		
		long calDateDays = calDate / (24 * 60 * 60 * 1000);
		
		calDateDays = Math.abs(calDateDays);
		
		System.out.println("두 날짜의 날짜 차이(calDateDays) : " + calDateDays);
			
			
		
		
		if(calDateDays <= 30) {
			return "forward:/matching/deleteMatching3.jsp";
		} else {
			matchingService.deleteMatching(matching);
			
			return "forward:/matching/deleteMatching2.jsp";
		}
		
	}
	
	@RequestMapping(value = "getMatching")
	public String getMatching(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId, Model model) throws Exception {
		System.out.println("/matching/getMatching");
		
		model.addAttribute("userId", userId);
		model.addAttribute("secondUserId", secondUserId);
		
		Search search = new Search();
		int totalMatching = matchingService.getTotalMatching(search, secondUserId);
		
		model.addAttribute("totalMatching", totalMatching);
		
		if(userId == secondUserId) {
			
			
			
			
			int totalItem = matchingService.getTotalItem(search, userId, "1");
			int totalItem2 = matchingService.getTotalItem(search, userId, "2");
			
			model.addAttribute("totalItem", totalItem);
			model.addAttribute("totalItem2", totalItem2);
			
			return "forward:/matching/getMatching2.jsp";
		} else {
			Matching matching = matchingService.getMatching(userId);
			
			model.addAttribute("matching", matching);
			
			return "forward:/matching/addMatching.jsp";
		}
		
		
		
		
		
		
		
		
	}
	
	@RequestMapping(value = "updateMatching3")
	public String updateMatching3(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId, Model model) throws Exception {
		System.out.println("/matching/updateMatching3");
		
		Matching matching = matchingService.getMatching(secondUserId);
		
		if(matchingService.getItem(userId, "1") != null) {
			model.addAttribute("userId", userId);
			model.addAttribute("secondUserId", secondUserId);
			if(matchingService.getItem(secondUserId, "2") == null) {
				
				if(matching.getSecondUserId() == userId) {
					
					
					return "forward:/matching/updateItem3.jsp";
				} else {
					return "forward:/matching/updateItem4.jsp";
				}
			} else {
				return "forward:/matching/updateItem5.jsp";
			}
		} else {
			return "forward:/matching/updateItem2.jsp";
		}
		
		
		
		
	}
}
