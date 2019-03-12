package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCsurveyDAO implements SurveyDAO{

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCsurveyDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void save(Survey survey) {
		
		String sqlInsertSurvey = "INSERT INTO survey_result(parkcode, emailaddress, state, activitylevel) VALUES (?,?,?,?)";
		jdbcTemplate.update(sqlInsertSurvey, survey.getFavoriteParkCode(), survey.getEmail(), survey.getStateOfResidence(), survey.getPhysicalActivityLevel());
		
		
	}
	
	/*
	private Long getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_surveyid') FROM survey_result";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		Long id = null;
		if(results.next()) {
			id = results.getLong(1);
		} else {
			throw new RuntimeException("Something strange happened, unable to select next survey id from sequence");
		}
		return id;
	}
	*/
	
	@Override
	public Map<String, Integer> getMostPopularParkCodes() {
		Map<String, Integer> parkCodes = new LinkedHashMap<String, Integer>();
		String sqlGetParkCode = "SELECT parkcode, count(*) FROM survey_result \n" + 
				"        GROUP BY parkcode\n" + 
				"        ORDER BY count(*) DESC, parkcode;";
		
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetParkCode);
		
		while (result.next()) {
			String parkCode = result.getString("parkcode");
			Integer surveyCount = result.getInt("count");
			parkCodes.put(parkCode, surveyCount);
		}

		
		return parkCodes;
	}
	
	
	
}
