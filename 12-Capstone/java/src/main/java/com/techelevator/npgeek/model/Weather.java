package com.techelevator.npgeek.model;
import java.time.LocalDateTime;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;


public class Weather {

	private String code;
	private int day;
	private int low;
	private int high;
	private String forecast;
	//private static final DateFormatSymbols dayNames= new DateFormatSymbols();
	
	public String getDayName() {
		
		return LocalDateTime.now().plusDays(day - 1).getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ROOT);
	}
	
	public String getRecommendation() {
		List<String> toPack = new ArrayList<String>();
		List<String> toWear = new ArrayList<String>();
		List<String> warnings = new ArrayList<String>();
		
		switch(forecast) {
		
		case "snow":
			toPack.add("snowshoes");
			break;
			
		case "thunderstorms":
			warnings.add("Seek shelter.");
			warnings.add("Avoid hiking on exposed ridges.");
			//Fall through
			
		case "rain":
			toPack.add("rain gear");
			toWear.add("waterproof shoes");
			break;
			
		case "sunny":
			toPack.add("sunblock");
			break;
		}	
		
		
		if (high > 75) {
			toPack.add("Extra gallon of Water");
		}
		if ( (high - low) > 20) {
			toWear.add("breathable layers");
		}
		if ( low < 20) {
			warnings.add("Danger of exposure to frigid temperatures.");
		}
		
		StringBuffer result = new StringBuffer();
		if (toPack.size() > 0) {
			result.append("We recommend that you pack ");
			result.append( toPack.stream().collect(Collectors.joining(", ", null, ".\n")) );
		}
		if (toWear.size() > 0) {
			result.append("We recommend that you wear ");
			result.append( toWear.stream().collect(Collectors.joining(", ", null, ".\n")) );
		}
		if (warnings.size() > 0) {
			result.append("The following warnings are in effect: ");
			result.append( warnings.stream().collect(Collectors.joining("; ", null, ".\n")) );
		}
		
		
		return result.toString();
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
