package com.techelevator.npgeek.model;
import java.time.LocalDateTime;
import java.time.format.TextStyle;
import java.util.Locale;


public class Weather {

	private String code;
	private int day;
	private int low;
	private int high;
	private String forecast;
	//private static final DateFormatSymbols dayNames= new DateFormatSymbols();
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDayName() {
	
		return LocalDateTime.now().plusDays(day - 1).getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ROOT);
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getLow() {
		return low;
	}
	public void setLow(int low) {
		this.low = low;
	}
	public int getHigh() {
		return high;
	}
	public void setHigh(int high) {
		this.high = high;
	}
	public String getForecast() {
		return forecast;
	}
	public void setForecast(String forecast) {
		this.forecast = forecast;
	}
	
	
	
}
