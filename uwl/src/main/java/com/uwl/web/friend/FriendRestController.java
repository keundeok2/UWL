package com.uwl.web.friend;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.common.Search;
import com.uwl.service.domain.Friend;
import com.uwl.service.domain.User;
import com.uwl.service.friend.FriendService;

@RestController
@RequestMapping("/friend/*")
public class FriendRestController {

	@Autowired
	private FriendService friendService;

	@RequestMapping(value = "rest/requestFriend", method = RequestMethod.POST)
	public Map requestFriend(@RequestBody Friend friend) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		friendService.requestFriend(friend);
		map.put("success", true);
		return map;
	}

	@RequestMapping(value = "rest/acceptFriend", method = RequestMethod.POST)
	public Map acceptFriend(@RequestBody Friend friend) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		friendService.acceptFriend(friend);
		map.put("success", true);
		return map;
	}

	@RequestMapping(value = "rest/deleteFriend", method = RequestMethod.POST)
	public Map deleteFriend(@RequestBody Friend friend) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		friendService.deleteFriend(friend);
		map.put("success", true);

		return map;
	}

	@RequestMapping(value = "rest/getAskedList", method = RequestMethod.POST)
	public Map getAskedList(@RequestBody User user) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", friendService.getAskedList(user.getUserId()));

		return map;
	}
	
	@RequestMapping(value = "rest/getRequestList", method = RequestMethod.POST)
	public Map getRequestList(@RequestBody User user) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", friendService.getRequestList(user.getUserId()));
		
		return map;
	}
	
	@RequestMapping(value = "rest/getFriendListForSearch", method = RequestMethod.POST)
	public Map getFriendListForSearch(@RequestBody User user) throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(10000);
		
		return friendService.getFriendList(user.getUserId(), search);
	}
	
	
	
	
}
