package com.uwl.service.schoolRank.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uwl.common.Search;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.SchoolRank;
import com.uwl.service.schoolRank.SchoolRankDAO;
import com.uwl.service.schoolRank.SchoolRankService;

@Service("schoolRankServiceImpl")
public class SchoolRankServiceImple implements SchoolRankService {
	
	//field
	@Autowired
	@Qualifier("schoolRankDAOImpl")
	private SchoolRankDAO schoolRankDAO;
	
	//Setter
	public void setSchoolRankDAO(SchoolRankDAO schoolRankDAO) {
		this.schoolRankDAO = schoolRankDAO;
	}
	
	//Constructor
	public SchoolRankServiceImple() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void addSchoolRank(SchoolRank schoolRank) throws Exception {
		schoolRankDAO.addSchoolRank(schoolRank);
	}

	@Override
	public void updateSchoolRank(SchoolRank schoolRank) throws Exception {
		schoolRankDAO.updateSchoolRank(schoolRank);
	}
	
	@Override
	public void updateSchoolTotalUser(SchoolRank schoolRank) throws Exception {
		schoolRankDAO.updateSchoolTotalUser(schoolRank);
		
	}
	
	//Method
	@Override
	public Map<String, Object> getSchoolRankingList(Search search, int schoolNo) throws Exception {
//	public List<SchoolRank> getSchoolRankingList(Search search) throws Exception {
		
				;
		Map<String, Object> map = schoolRankDAO.getSchoolRankingList(search, schoolNo);
		
		int totalCount = schoolRankDAO.getTotalCount(map);
		System.out.println("schoolRankServiceImpl의 getSchoolRankingList() map : " + map);
		map.put("totalCount", totalCount);
		map.put("list", map.get("list"));
		
		return map;
	}
	
	@Override
	public Map<String, Object> getIndividualRankingList(Search search) throws Exception {
		
		List<SchoolRank> list = schoolRankDAO.getIndividualRankingList(search);
		int totalCount = schoolRankDAO.getTotalCountIndividual(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public SchoolRank getSearchRank(int schoolNo) throws Exception {
		return schoolRankDAO.getSearchRank(schoolNo);
	}

	@Override
	public SchoolRank getMySchool(String userId) throws Exception {
		return schoolRankDAO.getMySchool(userId);
	}

	

	



}
