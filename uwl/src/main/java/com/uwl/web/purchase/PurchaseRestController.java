package com.uwl.web.purchase;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.service.imp.impl.ImpServiceImpl;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {

	@Autowired
	private ImpServiceImpl impServiceImpl;
	
	
	@RequestMapping(value = "rest/impInfo", method = RequestMethod.POST)
	public Map impInfo(@RequestParam String importId) throws Exception{
		return impServiceImpl.impInfo(importId);
		
	}
}
