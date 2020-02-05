package com.uwl.service.reward.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.uwl.common.Search;
import com.uwl.service.domain.Purchase;
import com.uwl.service.domain.Reward;
import com.uwl.service.reward.RewardDAO;

@Repository("rewardDAOImpl")
public class RewardDAOImpl implements RewardDAO{
	
	//field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	@Value("#{commonProperties['price']}")
	int price;
	
	//constructor
	public RewardDAOImpl() {
		// TODO Auto-generated constructor stub
	}
	
	//setSqlSession
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//포인트, 활동점수 둘 다 이 method를 이용함
	@Override
	public Map<String, Object> getUserBothPointList(Search search, String userId) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("RewardDAOImpl getUserBothPointList() 작동 중");
		System.out.println("RewardDAOImpl search : " + search);
		System.out.println("RewardDAOImpl userId : " + userId);
		
		map.put("search", search);
		map.put("userId", userId);
		
		List<Reward> list = sqlSession.selectList("RewardMapper.getUserBothPointList", map);
		
		map.put("totalCount", sqlSession.selectOne("RewardMapper.getTotalCountOne", userId));
//		map.put("totalCount", sqlSession.selectOne("RewardMapper.getTotalCountOne", userId));
		map.put("list", list);
		
		System.out.println("totalCount : " + map.get("totalcount"));
		System.out.println("list : " + map.get("list"));
		
		return map;
	}

	@Override
	public void increasePoint(Reward reward) throws Exception {
		sqlSession.insert("RewardMapper.increasePoint", reward);
	}

	@Override
	public void decreasePoint(Purchase purchase) throws Exception {
		
		
		
//		Map<String, Object> map = new HashMap<String,Object>();
//		map.put("purchase", sqlSession.selectOne("PurchaseMapper.getPurchase", purchase.getPurchaseNo()));
//		map.get("price");
//		System.out.println("purchase 값 : " + map.get("purchase") + "price : " + map.get("price"));
//		
		sqlSession.insert("RewardMapper.decreasePoint", purchase);
		
	}

	@Override
	public int getTotalCountOne(String userId) throws Exception {
		return sqlSession.selectOne("RewardMapper.getTotalCountOne", userId);
	}

	
	
	


}
