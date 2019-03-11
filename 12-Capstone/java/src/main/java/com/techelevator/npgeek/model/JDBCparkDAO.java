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
		List<Park> allParks = new ArrayList<Park>();
		String sql = "SELECT parkcode, parkname, state, parkdescription FROM park";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sql);
		
		while (result.next()) {
			allParks.add(createParkObject(result));
		}
		return allParks;
	}
	
	private Park createParkObject(SqlRowSet row) {
		Park thisPark = new Park();
		thisPark.setCode(row.getString("parkcode"));
		thisPark.setName(row.getString("parkcode"));
		thisPark.setDescription(row.getString("parkdescription"));
		thisPark.setState(row.getString("state"));
		return thisPark;
	}
	
	
}
