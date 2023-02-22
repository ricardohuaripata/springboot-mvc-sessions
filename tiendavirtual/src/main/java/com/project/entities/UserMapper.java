package com.project.entities;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.project.objects.User;

public class UserMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User user = new User();
		user.setId(rs.getInt("id"));
		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setName(rs.getString("name"));
		user.setLastname(rs.getString("lastname"));
		user.setBirthdate(rs.getDate("birthdate"));
		user.setAdmin(rs.getBoolean("isAdmin"));

		return user;
	}

}
