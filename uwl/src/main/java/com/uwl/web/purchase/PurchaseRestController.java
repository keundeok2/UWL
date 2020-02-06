package com.uwl.web.purchase;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.service.domain.Purchase;
import com.uwl.service.imp.impl.ImpServiceImpl;
import com.uwl.service.matching.MatchingService;
import com.uwl.service.purchase.PurchaseService;
import com.uwl.service.reward.RewardService;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {

	@Autowired
	private ImpServiceImpl impServiceImpl;
	
	@Autowired
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("rewardServiceImpl")
	private RewardService rewardService;
	
	@Autowired
	private MatchingService matchingService;
	
	@RequestMapping(value = "rest/impInfo", method = RequestMethod.POST)
	public Map impInfo(@RequestParam String importId) throws Exception{
		return impServiceImpl.impInfo(importId);
	}
	
	@RequestMapping(value = "rest/addPurchase", method=RequestMethod.POST)
	public Map addPurchase(@RequestBody Purchase purchase) throws Exception{
		System.out.println(purchase);
		purchaseService.addPurchase(purchase);
		// point로 구매시 REWARD TABLE에 INSERT
		if (purchase.getPaymentOption().equals("2")) {
			System.out.println("if문 내부::::::::::::::::");
			rewardService.decreasePoint(purchase);
		}
		
		//	ITEM TABLE에 INSERT 추가하기
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		return map;
	}
}
