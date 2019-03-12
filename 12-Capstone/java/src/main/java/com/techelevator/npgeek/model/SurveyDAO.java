package com.techelevator.npgeek.model;

import java.util.List;
import java.util.Map;

public interface SurveyDAO {
	
	public void save(Survey survey);
	
	public Map<String, Integer> getMostPopularParkCodes();
}
