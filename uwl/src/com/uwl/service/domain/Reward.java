package com.uwl.service.domain;

import java.sql.Date;

public class Reward {
	
	//field
	//구매시 구매자 아이디
	//private Purchsae purchaseName //Purchase class 에서 가져올것.
	
	//일반 포인트 적립시
	private String userId;
	private int rewardNo;
	private Purchase purchaseItem;
	private Challenge challenge;
	
	//바인딩문제로 인해 2개를 분류하였음
	private int variablePoint;
	private int variableActivityPoint;
	private Date variableDate;
	
	//Constructor
	public Reward() {
		// TODO Auto-generated constructor stub
	}
	
		
	//Method
	public int getVariablePoint() {
		return variablePoint;
	}

	public void setVariablePoint(int variablePoint) {
		this.variablePoint = variablePoint;
	}

	public int getVariableActivityPoint() {
		return variableActivityPoint;
	}

	public void setVariableActivityPoint(int variableActivityPoint) {
		this.variableActivityPoint = variableActivityPoint;
	}

	
	

//	public User getUser() {
//		return user;
//	}
//
//
//	public void setUser(User user) {
//		this.user = user;
//	}

	public String getUserId() {
		return userId;
	}




	public void setUserId(String userId) {
		this.userId = userId;
	}




	public int getRewardNo() {
		return rewardNo;
	}

	public void setRewardNo(int rewardNo) {
		this.rewardNo = rewardNo;
	}



	public Date getVariableDate() {
		return variableDate;
	}

	public void setVariableDate(Date variableDate) {
		this.variableDate = variableDate;
	}

	public Purchase getPurchaseItem() {
		return purchaseItem;
	}

	public void setPurchaseItem(Purchase purchaseItem) {
		this.purchaseItem = purchaseItem;
	}




	public Challenge getChallenge() {
		return challenge;
	}




	public void setChallenge(Challenge challenge) {
		this.challenge = challenge;
	}




	@Override
	public String toString() {
		return "Reward [userId=" + userId + ", rewardNo=" + rewardNo + ", purchaseItem=" + purchaseItem + ", challenge="
				+ challenge + ", variablePoint=" + variablePoint + ", variableActivityPoint=" + variableActivityPoint
				+ ", variableDate=" + variableDate + "]";
	}






	
	
	
}
