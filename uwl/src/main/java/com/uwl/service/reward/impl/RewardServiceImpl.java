package com.uwl.service.reward.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uwl.common.Search;
import com.uwl.service.challenge.ChallengeDAO;
import com.uwl.service.domain.Purchase;
import com.uwl.service.domain.Reward;
import com.uwl.service.reward.RewardDAO;
import com.uwl.service.reward.RewardService;

@Service("rewardServiceImpl")
public class RewardServiceImpl implements RewardService{
	
	//Field
	@Autowired
	@Qualifier("rewardDAOImpl")
	private RewardDAO rewardDAO;
	
//	@Autowired
//	@Qualifier("ChallengeDAOImpl")
//	private ChallengeDAO challengeDAO;
	
	
	//setter
	public void setRewardDAO(RewardDAO rewardDAO) {
		this.rewardDAO = rewardDAO;
	}
	
	
//	public void setChallengeDAO(ChallengeDAO challengeDAO) {
//		this.challengeDAO = challengeDAO;
//	}


	//Constructor
	public RewardServiceImpl() {
		System.out.println(this.getClass());
	}

	//Method
	@Override
	public Map<String,Object> getUserBothPointList(Search search, String userId) throws Exception {
		
		System.out.println("RewardServiceImple getUserBothPointList() 작동 중");
		
		int totalCount = rewardDAO.getTotalCountOne(userId);
		
		Map<String, Object> map = rewardDAO.getUserBothPointList(search, userId);
		
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	

	@Override
	public void increasePoint(Reward reward) throws Exception {
		rewardDAO.increasePoint(reward);
	}




	@Override
	public void decreasePoint(Purchase purchase) throws Exception {
		rewardDAO.decreasePoint(purchase);
	}



}
