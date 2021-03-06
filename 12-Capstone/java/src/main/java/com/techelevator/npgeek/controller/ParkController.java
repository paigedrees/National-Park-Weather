package com.techelevator.npgeek.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.npgeek.model.ParkDAO;
import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.SurveyDAO;
import com.techelevator.npgeek.model.SurveyResult;

@Controller
public class ParkController {

	@Autowired
	ParkDAO parkDao;
	
	@Autowired
	SurveyDAO surveyDao;
	
	@RequestMapping(value={"", "/", "/home"}, method=RequestMethod.GET)
	public String getPageHome(ModelMap pageData){
	
	    // three pieces of data for survey form
	    pageData.put("parks", parkDao.getAllParks());
	    pageData.addAttribute("pageURL", "/home");
	    pageData.addAttribute("parkSurvey", new Survey());
	
	    return "homePage";
	}

	@RequestMapping(path="/survey/result", method=RequestMethod.GET)
	public String getPageResult(
	        HttpSession session,
	        ModelMap pageData
	        ){
		//TODO rewrite this
	    List<SurveyResult> parksInSurvey = new ArrayList<SurveyResult>();
	    List<String> keys = new ArrayList<>(surveyDao.getMostPopularParkCodes().keySet());
	    
	    for (String code : keys) {
	        SurveyResult surveyResult = new SurveyResult();
	        surveyResult.setPark(parkDao.getParkByCode(code));
	        surveyResult.setSurveyCount(surveyDao.getMostPopularParkCodes().get(code));
	        parksInSurvey.add(surveyResult);
	    }
	    
	    session.setAttribute("isSurveyPosted", true);
	    pageData.put("surveys", parksInSurvey);
	
	    // three pieces of data for survey form
	    pageData.put("parks", parkDao.getAllParks());
	    pageData.addAttribute("pageURL", "/home");
	    pageData.addAttribute("parkSurvey", new Survey());
	
	    return "resultPage";
	}

	@RequestMapping(path="/detail", method=RequestMethod.GET)
	public String getPageDetail(
	        @RequestParam(required = true, defaultValue = "CVNP") String parkCode,
	        ModelMap pageData
	        ) {
	    pageData.put("park", parkDao.getParkByCode(parkCode));
	    pageData.put("weatherForecast", parkDao.getForecastByParkcode(parkCode));
	    
	    // three pieces of data for survey form
	    pageData.put("parks", parkDao.getAllParks());
	    pageData.addAttribute("pageURL", "/detail?parkCode=" + parkCode);
	    pageData.addAttribute("parkSurvey", new Survey());
	
	    return "detailPage";
	}

	@RequestMapping(path="/survey/save", method=RequestMethod.POST)
	public String postSurvey(
	        @Valid @ModelAttribute Survey parkSurvey,
	        BindingResult result,
	        RedirectAttributes flash) {
		 flash.addFlashAttribute("parkSurvey", parkSurvey);
		
		if (result.hasErrors()) {
			for(ObjectError error : result.getAllErrors()) {
				System.out.println(error.getDefaultMessage());
			}
			
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "parkSurvey", result);
			
			return "redirect:/home";
		}
		
	    surveyDao.save(parkSurvey);

	 
	    return "redirect:/survey/result";
	}
	
	@RequestMapping(path="/temperature/flipScale", method=RequestMethod.POST)
	public String postTemperatureFlip(
	        @RequestParam(required = true, defaultValue = "F") String tempScale,
	        @RequestParam(required = true, defaultValue = "/home") String pageURL,
	        HttpSession session
	        ) {
		System.out.println("postTemperatureFlip(): " + tempScale);
		switch( tempScale ) {
		case "F":
			session.setAttribute("tempScale", "C");
			break;
		case "C":
			session.setAttribute("tempScale", "F");
		}
		
		System.out.println("postTemperatureFlip(): " + pageURL);
		return "redirect:" + pageURL;
	}
}
