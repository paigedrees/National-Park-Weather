package com.techelevator.npgeek.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class Survey {
	private String pageURL;
	public String getPageURL() {
		return pageURL;
	}

	public void setPageURL(String pageURL) {
		this.pageURL = pageURL;
	}


	private long surveyId;

	@NotBlank(message="please enter valid park")
	@Size(min=1, max=50)
	private String favoriteParkCode;

	@Email(message="please enter a valid email")
	@NotBlank(message="please enter a valid email")
	private String email;

	@NotBlank(message="please enter a state of residency")
	@Size(min=1, max=25)
	private String stateOfResidence;

	@NotBlank(message="please enter your physical activity level")
	@Size(min=1, max=20)
	private String physicalActivityLevel;


	public String getFavoriteParkCode() {
		return favoriteParkCode;
	}

	public void setFavoriteParkCode(String favoriteParkCode) {
		this.favoriteParkCode = favoriteParkCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStateOfResidence() {
		return stateOfResidence;
	}

	public void setStateOfResidence(String stateOfResidence) {
		this.stateOfResidence = stateOfResidence;
	}

	public String getPhysicalActivityLevel() {
		return physicalActivityLevel;
	}

	public void setPhysicalActivityLevel(String physicalActivityLevel) {
		this.physicalActivityLevel = physicalActivityLevel;
	}

	public long getSurveyId() {
		return surveyId;
	}

	public void setSurveyId(long surveyId) {
		this.surveyId = surveyId;
	}



}
