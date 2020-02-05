package com.uwl.web.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.community.CommunityService;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Likey;

@RestController
@RequestMapping("/community/*")
public class CommunityRestController {
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	public CommunityRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
//------------------------좋아요----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="rest/addPostLike", method=RequestMethod.POST)	//---------------------------테스트 종료
	public boolean addPostLike(@RequestBody Likey likey) throws Exception{
		System.out.println("rest/addPostLike.POST");
		likey.setUserId("user01");		//session 처리 해야해
		communityService.addPostLike(likey);
		likey = communityService.getLike(likey);
		if(likey != null) {
			return true;
		}else {
			return false;
		}
	}
	
	@RequestMapping(value="rest/addCommentLike", method=RequestMethod.POST)
	public Likey addCommentLike(@RequestBody Likey likey) throws Exception{
		System.out.println("rest/addCommentLike.POST");
		communityService.addCommentLike(likey);
		likey = communityService.getLike(likey);
		return likey;
	}
	
	@RequestMapping(value="rest/deleteLike", method=RequestMethod.POST)	//----------------------------테스트 종료
	public boolean deleteLike(@RequestBody Likey likey) throws Exception{
		System.out.println("rest/deleteLike.GET");
		likey.setUserId("user01");	//session 처리해야해
		likey = communityService.getLike(likey);
		communityService.deleteLike(likey);
		likey = communityService.getLike(likey);	//좀 이상한데...?			
		if(likey != null) {
			return true;
		}else {
			return false;
		}
	}
	
	@RequestMapping(value="rest/getLike", method=RequestMethod.POST)		//------------------------테스트 종료
	public boolean getLikey(@RequestBody Likey likey) throws Exception{
		System.out.println("rest/getLike.POST");
		likey.setUserId("user01"); 		//session처리해야해
		likey = communityService.getLike(likey);
		if(likey != null) {
			return true;
		}else {
			return false;
		}
	}
	
//------------------------좋아요-----------------------------------------------------------------------------------------------------------
	
	
//------------------------댓글-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="rest/addComment", method=RequestMethod.POST)
	public Commentt addComment(@RequestBody Commentt comment) throws Exception{
		System.out.println("rest/addComment.POST");
		comment.setUserId("user01"); //session 처리해야해
		communityService.addComment(comment);
		return comment;
	}
	
	@RequestMapping(value="rest/listComment")		//페이지 넘기기 용?
	public Map<String, Object> getCommentList(@ModelAttribute("search") Search search,
			@RequestParam("postNo") int postNo, @RequestParam("userId") String userId) throws Exception{
		System.out.println("getCommentList.POST or GET");
		if(search.getCurrentPage() == 0) {
		search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = communityService.getCommentList(search, postNo, userId);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		return map;
	}
	
	
//------------------------댓글-----------------------------------------------------------------------------------------------------------
	
}
