package com.techelevator.npgeek.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCparkDAO implements ParkDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCparkDAO(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	
	@Override
	public List<Park> getAllParks() {
		List<Park> result = new ArrayList<Park>();
		String sql = "SELECT * FROM park";
		SqlRowSet row = jdbcTemplate.queryForRowSet(sql);
		
		while (row.next()) {
			result.add(createParkObject(row));
		}
		return result;
	}
	
	private Park createParkObject(SqlRowSet row) {
		Park thisPark = new Park();
		thisPark.setCode(row.getString("parkcode"));
		thisPark.setName(row.getString("parkname"));
		thisPark.setDescription(row.getString("parkdescription"));
		thisPark.setState(row.getString("state"));
		thisPark.setAcreage(row.getInt("acreage"));
		thisPark.setElevationInFeet(row.getInt("elevationinfeet"));
		thisPark.setMilesOfTrail(row.getDouble("milesoftrail"));
		thisPark.setNumberOfCampsites(row.getInt("numberofcampsites"));
		thisPark.setClimate(row.getString("climate"));
		thisPark.setYearFounded(row.getInt("yearfounded"));
		thisPark.setAnnualVisitorCount(row.getInt("annualvisitorcount"));
		thisPark.setInspirationalQuote(row.getString("inspirationalquote"));
		thisPark.setQuoteSource(row.getString("inspirationalquotesource"));
		thisPark.setEntryFee(row.getInt("entryfee"));
		thisPark.setNumberOfAnimalSpecies(row.getInt("numberofanimalspecies"));
		
		return thisPark;
	}
	
	@Override
	public Park getParkByCode(String code) {
		String sql = "SELECT * FROM park WHERE parkcode = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sql, code.toUpperCase());
		Park thisPark = null;
		if( result.next() ) {
			thisPark = createParkObject(result);
		} 
		return thisPark;
	}
	
	@Override
	public List<Weather> getForecastByParkcode(String code) {
		List<Weather> allWeathers = new ArrayList<Weather>();
		String sql = "SELECT * FROM weather WHERE parkcode = ? ORDER by fivedayforecastvalue";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sql, code);
		while (result.next()) {
			allWeathers.add(createWeatherObject(result));
		}
		return allWeathers;
		
	}
	
	private Weather createWeatherObject(SqlRowSet row) {
		Weather thisWeather = new Weather();
		thisWeather.setCode(row.getString("parkcode"));
		thisWeather.setDay(row.getInt("fivedayforecastvalue"));
		thisWeather.setLowTempF(row.getInt("low"));
		thisWeather.setHighTempF(row.getInt("high"));
		thisWeather.setForecast(row.getString("forecast"));
		
		return thisWeather;
	}
	
	
}
