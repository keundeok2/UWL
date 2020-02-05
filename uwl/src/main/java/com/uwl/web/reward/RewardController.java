package com.uwl.web.reward;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.purchase.PurchaseService;
import com.uwl.service.reward.RewardService;

@Controller
@RequestMapping("/reward/*")
public class RewardController {
	
	//Field
	@Autowired
	@Qualifier("rewardServiceImpl")
	private RewardService rewardService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	
	//Constructor
	public RewardController() {
		// TODO Auto-generated constructor stub
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	@Value("#{commonProperties['price']}")
	int price;
	
	@Value("#{commonProperties['spear']}")
	String spear;
	@Value("#{commonProperties['shield']}")
	String shield;
	
	
	//GET / POST 둘 다
	@RequestMapping(value = "getUserBothPointList/{userId}")
	public String getUserBothPointList(@ModelAttribute("search") Search search, @RequestParam(value = "userId", required = false)String userId, 
														Model model, HttpServletRequest request ) throws Exception{
		
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		userId = "user41";
		
		
		Map<String, Object> map = rewardService.getUserBothPointList(search, userId);
		System.out.println("RewardController getUserBothPointList()의 Map : " + map);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("포인트목록보기 resultPage : " + resultPage);
		
		model.addAttribute("list",map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		//얘는 필요한가?
		model.addAttribute("userId", userId);
		
		System.out.println("price : " + price);
		
		return "forward:/reward/getUserBothPointList.jsp";
		
	}
	
//	@RequestMapping(value = "increasePoint", method = RequestMethod.GET)
//	public String increasePoint() throws Exception{
//		
//		System.out.println("/reward/increasePoint : GET");
//		
//		return null;
//	}
//	
//	
//	
//	@RequestMapping(value = "decreasePoint", method = RequestMethod.GET)
//	public String decreasePoint() throws Exception{
//		
//		System.out.println();
//		return null;
//	}
	
	
	
	

}
