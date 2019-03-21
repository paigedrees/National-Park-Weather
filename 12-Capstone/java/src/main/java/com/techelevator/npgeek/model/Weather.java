
package com.techelevator.npgeek.model;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class Weather {

	private String code;
	private LocalDate date;
	private int lowTempF;
	private int highTempF;
	private String forecast;
	
	public Date getDate() {
		return java.sql.Date.valueOf(this.date);
	}
	public void setDay(int day) {
		this.date = LocalDate.now().plusDays(day - 1);
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
			warnings.add("seek shelter");
			warnings.add("avoid hiking on exposed ridges");
			//Fall through
			
		case "rain":
			toPack.add("rain gear");
			toWear.add("waterproof shoes");
			break;
			
		case "sunny":
			toPack.add("sunblock");
			break;
		}	
		
		
		if (highTempF > 75) {
			toPack.add("extra gallon of water");
		}
		if ( (highTempF - lowTempF) > 20) {
			toWear.add("breathable layers");
		}
		if ( lowTempF < 20) {
			warnings.add("danger of exposure to frigid temperatures");
		}
		
		StringBuffer result = new StringBuffer();
		if (toPack.size() > 0) {
			result.append("We recommend that you pack ");
			result.append( toPack.stream().collect(Collectors.joining(", ", "", ".\n")) );
		}
		if (toWear.size() > 0) {
			result.append("We recommend that you wear ");
			result.append( toWear.stream().collect(Collectors.joining(", ", "", ".\n")) );
		}
		if (warnings.size() > 0) {
			result.append("The following warnings are in effect: ");
			result.append( warnings.stream().collect(Collectors.joining("; ", "", ".\n")) );
		}
		
		System.out.println(result.toString());
		return result.toString();
	}
	
	public String forecastFileName() {
		String[] words = forecast.split(" ");
		String result = words[0].toLowerCase();
		for (int n = 1; n < words.length; n++) {
			result += Character.toUpperCase(words[n].charAt(0)) + words[n].substring(1).toLowerCase();
		}
		return result + ".png";
	}
	
	public float getLowTempAs(char scale) {
		switch( Character.toUpperCase(scale)) {
		case 'F':
			return lowTempF;
			
		case 'C':
			return (float)(lowTempF - 32) * 5/9;
		}
		return 0;
	}
	
	public float getHighTempAs(char scale) {
		switch( Character.toUpperCase(scale)) {
		case 'F':
			return highTempF;
			
		case 'C':
			return (float)(highTempF - 32) * 5/9;
		}
		return 0;
	}

	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public void setLowTempF(int low) {
		this.lowTempF = low;
	}
	public void setHighTempF(int high) {
		this.highTempF = high;
	}
	public String getForecast() {
		return forecast;
	}
	public void setForecast(String forecast) {
		this.forecast = forecast;
	}
}
