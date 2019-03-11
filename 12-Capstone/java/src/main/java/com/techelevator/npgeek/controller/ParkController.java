package com.techelevator.npgeek.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDAO;
import com.techelevator.npgeek.model.TemperatureChoice;

@Controller
public class ParkController {

	@Autowired
	ParkDAO parkDao;
	
	@RequestMapping("/home") 
	public String getHome(ModelMap modelMap){
		TemperatureChoice tempKey = new TemperatureChoice();
		tempKey.setScale("F");
		modelMap.put("parks", parkDao.getAllParks());
		modelMap.put("temperatureChoice", tempKey);
		return "homePage";
	}
	
	@RequestMapping("/detail")
	public String showParkDetail(HttpServletRequest request, ModelMap modelMap) {
		String parkCode = request.getParameter("parkCode");
		Park newPark = parkDao.getParkByCode(parkCode);
		modelMap.put("park", newPark);
		modelMap.put("weatherForecast", parkDao.getForecastByCode(parkCode));
		return "detailPage";
	}
	
}
