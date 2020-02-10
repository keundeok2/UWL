package com.uwl.web.matching;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.common.Search;
import com.uwl.service.domain.Item;
import com.uwl.service.domain.Matching;
import com.uwl.service.matching.MatchingService;

@RestController
@RequestMapping("/matching/*")
public class MatchingRestController {
	@Autowired
	@Qualifier("matchingServiceImpl")
	private MatchingService matchingService;
	
	public MatchingRestController() {
		
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "rest/addMatching2/{userId}/{secondUserId}")
	public Map addMatching2(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/addMatching2/{userId}/{secondUserId} 시작");
		Map<String, Object> map = new HashMap();
		if(matchingService.getMatching(userId) == null) {
			map.put("userId", userId);
			map.put("secondUserId", secondUserId);
		} else {
			map.put("userId", userId);
			Matching matching = matchingService.getMatching(userId);
			secondUserId = matching.getSecondUserId();
			map.put("secondUserId", secondUserId);
		}
		System.out.println("rest/addMatching2/{userId}/{secondUserId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteMatching/{userId}/{secondUserId}")
	public Map deleteMatching(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/deleteMatching/{userId}/{secondUserId} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("secondUserId", secondUserId);
		System.out.println("rest/deleteMatching/{userId}/{secondUserId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/updateItem/{userId}/{secondUserId}")
	public Map updateItem(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/updateItem/{userId}/{secondUserId} 시작");
		Map<String, Object> map = new HashMap();
		if(matchingService.getItem(userId, "1") != null) {
			map.put("userId", userId);
			map.put("secondUserId", secondUserId);
		}
		System.out.println("rest/updateItem/{userId}/{secondUserId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/addMatching3/{userId}/{secondUserId}")
	public int addMatching3(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/addMatching3/{userId}/{secondUserId} 시작");
		Matching matching = new Matching();
		matching.setFirstUserId(userId);
		matching.setSecondUserId(secondUserId);
		matchingService.addMatching(matching);
		if(matchingService.getMatching(secondUserId) != null) {
			matching = matchingService.getMatching(userId);
			Matching matching2 = matchingService.getMatching(secondUserId);
			if(matching2.getSecondUserId().equals(userId)) {
				matching.setMatchingStatus("2");
				matching2.setMatchingStatus("2");
				matchingService.updateMatching(matching);
				matchingService.updateMatching(matching2);
			}
		}
		Search search = new Search();
		int totalMatching = matchingService.getTotalMatching(search, secondUserId);
		System.out.println("rest/addMatching3/{userId}/{secondUserId} 끝");
		return totalMatching;
	}
	
	@RequestMapping(value = "rest/deleteMatching2/{userId}/{secondUserId}")
	public Map deleteMatching2(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/deleteMatching/{userId}/{secondUserId} 시작");
		Matching matching = matchingService.getMatching(userId);
		String sendDate = matching.getSendDate().toString();
		System.out.println("sendDate : " + sendDate);
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
		Search search = new Search();
		
		Map<String, Object> map = new HashMap();
		
		if(calDateDays <= 30) {
			map.put("result", false);
		} else {
			matchingService.deleteMatching(matching);
			
			
			map.put("result", true);
		}
		int totalMatching = matchingService.getTotalMatching(search, secondUserId);
		map.put("totalMatching", totalMatching);
		System.out.println("rest/deleteMatching/{userId}/{secondUserId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/addMatching/{userId}/{secondUserId}")
	public Map addMatching(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/addMatching/{userId}/{secondUserId} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("secondUserId", secondUserId);
		System.out.println("userId : " + userId);
		System.out.println("secondUserId : " + secondUserId);
		Search search = new Search();
		int totalMatching = matchingService.getTotalMatching(search, secondUserId);
		map.put("totalMatching", totalMatching);
		if(userId.equals(secondUserId)) {
			int totalItem = matchingService.getTotalItem(search, userId, "1");
			int totalItem2 = matchingService.getTotalItem(search, userId, "2");
			map.put("totalItem", totalItem);
			map.put("totalItem2", totalItem2);
		} else {
			if(matchingService.getMatching(userId) != null) {
				Matching matching = matchingService.getMatching(userId);
				map.put("matching", matching);
				System.out.println("matching.getSecondUserId : " + matching.getSecondUserId());
				System.out.println("secondUserId : " + secondUserId);
			}
		}
		System.out.println("rest/addMatching/{userId}/{secondUserId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/updateItem3/{userId}/{secondUserId}")
	public Map updateItem3(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/updateItem3/{userId}/{secondUserId} 시작");
		Matching matching = matchingService.getMatching(secondUserId);
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("secondUserId", secondUserId);
		Item item = matchingService.getItem(userId, "1");
		item.setSecondUserId(secondUserId);
		if(matchingService.getItem(secondUserId, "2") == null) {
			if(matching.getSecondUserId().equals(userId)) {
				item.setUseResult("1");
				matchingService.updateItem(item);
			} else {
				item.setUseResult("2");
				matchingService.updateItem(item);
			}
		} else {
			item.setUseResult("3");
			matchingService.updateItem(item);
			Item item2 = matchingService.getItem(secondUserId, "2");
			item2.setSecondUserId(userId);
			matchingService.updateItem(item2);
		}
		System.out.println("rest/updateItem3/{userId}/{secondUserId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/updateMatching2/{userId}")
	public void updateMatching2(@PathVariable String userId) throws Exception {
		System.out.println("rest/updateMatching2/{userId} 시작");
		if(matchingService.getMatching(userId) != null) {
			Matching matching = matchingService.getMatching(userId);
			String secondUserId = matching.getSecondUserId();
			Matching matching2 = matchingService.getMatching(secondUserId);
			matching.setMatchingStatus("3");
			matchingService.updateMatching(matching);
			if(matching2.getMatchingStatus().equals("2")) {
				
			} else {
				
			}
		} else {
			
		}
		System.out.println("rest/updateMatching2/{userId} 끝");
	}
	
	@RequestMapping(value = "rest/updateMatching3/{userId}")
	public void updateMatching3(@PathVariable String userId) throws Exception {
		System.out.println("rest/updateMatchig3/{userId} 시작");
		if(matchingService.getMatching(userId) != null) {
			Matching matching = matchingService.getMatching(userId);
			matchingService.deleteMatching(matching);
			Matching matching2 = matchingService.getMatching(matching.getSecondUserId());
			matchingService.deleteMatching(matching2);
		}
		System.out.println("rest/updateMatchig3/{userId} 끝");
	}
	
	@RequestMapping(value = "rest/getMatching/{userId}")
	public String getMatching(@PathVariable String userId) throws Exception {
		System.out.println("rest/getMatching/{userId} 시작");
		System.out.println("userId : " + userId);
		System.out.println("rest/getMatching/{userId} 끝");
		return userId;
	}
	
	@RequestMapping(value = "rest/updateMatching/{userId}")
	public String updateMatching(@PathVariable String userId) throws Exception {
		System.out.println("rest/updateMatching/{userId} 시작");
		System.out.println("userId : " + userId);
		System.out.println("rest/updateMatching/{userId} 끝");
		return userId;
	}
}
