package com.techelevator.npgeek.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.techelevator.npgeek.model.ParkDAO;

@Controller
public class ParkController {

	@Autowired
	ParkDAO parkDao;
	
	@RequestMapping("/home") 
	public String getHome(ModelMap modelMap){
		
		modelMap.put("parks", parkDao.getAllParks());
		return "homePage";
	}
}
