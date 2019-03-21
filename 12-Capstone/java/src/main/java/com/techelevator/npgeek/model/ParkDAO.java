package com.techelevator.npgeek.model;

import java.util.List;

public interface ParkDAO {

	public List<Park> getAllParks();
	
	public Park getParkByCode(String code);
	
	public List<Weather> getForecastByParkcode(String code);
	
}
