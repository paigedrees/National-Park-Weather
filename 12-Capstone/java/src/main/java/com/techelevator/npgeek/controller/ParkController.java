package com.techelevator.npgeek.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
			ModelMap pageData
			){
		List<SurveyResult> parksInSurvey = new ArrayList<SurveyResult>();
		List<String> keys = new ArrayList<>(surveyDao.getMostPopularParkCodes().keySet());
		
		for (String code : keys) {
			SurveyResult surveyResult = new SurveyResult();
			surveyResult.setPark(parkDao.getParkByCode(code));
			surveyResult.setSurveyCount(surveyDao.getMostPopularParkCodes().get(code));
			parksInSurvey.add(surveyResult);
		}
		
		System.out.println("getPageResult(): " + pageData.get("pageURL"));
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
		pageData.put("weatherForecast", parkDao.getForecastByCode(parkCode));
		
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
			RedirectAttributes flash
	    ) {
		surveyDao.save(parkSurvey);

		flash.addFlashAttribute("pageURL", parkSurvey.getPageURL());
		return "redirect:/survey/result";
	}
}