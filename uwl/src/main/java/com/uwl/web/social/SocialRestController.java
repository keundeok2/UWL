package com.uwl.web.social;

import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.community.CommunityService;
import com.uwl.service.domain.Post;
import com.uwl.service.social.SocialService;

@RestController
@RequestMapping("/social/*")
public class SocialRestController {

	@Autowired
	private SocialService socialService;

	@Autowired
	private CommunityService communityService;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "rest/getCommentList") // 페이지 넘기기 용?
	public Map<String, Object> getCommentList(@RequestBody HashMap<String, Object> dataMap) throws Exception {
		System.out.println("rest/getCommentList.POST or GET");
		Search search = new Search();
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);
		search.setSearchCondition("1");

		System.out.println("dataMap" + dataMap);
		System.out.println(dataMap.get("postNo"));

		int postNo = Integer.parseInt((String) dataMap.get("postNo"));
		String userId = (String) dataMap.get("userId");

		Map<String, Object> map = communityService.getCommentList(search, postNo, userId);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		return map;
	}

}
