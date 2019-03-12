package com.techelevator.npgeek.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDAO;
import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.SurveyDAO;
import com.techelevator.npgeek.model.TemperatureChoice;


@Controller
public class ParkController {

	@Autowired
	ParkDAO parkDao;
	
	@Autowired
	SurveyDAO surveyDao;
	
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
	
	@RequestMapping(path="/survey", method=RequestMethod.GET)
	public String getSurveyPage(ModelMap modelMap) {
		if (modelMap.containsAttribute("survey") == false) {
			Survey survey = new Survey();
			modelMap.put("survey", survey);
			
		}
		modelMap.put("parks", parkDao.getAllParks());
		return "survey";
	}
	
	@RequestMapping(path="/survey", method=RequestMethod.POST)
	public String processRegistrationPage(@Valid @ModelAttribute Survey survey, BindingResult result, 
								RedirectAttributes flash, ModelMap modelMap) {
		flash.addFlashAttribute("survey", survey);
		
		if (result.hasErrors()) {
			
			for(ObjectError error : result.getAllErrors()) {
				System.out.println(error.getDefaultMessage());
			}
			
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "survey", result);
			
			return "redirect:/survey";
		}
		
		surveyDao.save(survey);
		
		return "redirect:/surveyResults";
	}
	
	@RequestMapping(path="/surveyResults", method=RequestMethod.GET)
	public String getSurveyResults(ModelMap modelMap){
		modelMap.put("topPark", parkDao.getParkByCode(surveyDao.getMostPopularParkCode()));
		
		return "surveyResults";
	}
		
}
