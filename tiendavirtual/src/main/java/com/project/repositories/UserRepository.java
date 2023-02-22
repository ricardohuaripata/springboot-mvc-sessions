package com.project.repositories;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.project.objects.User;
import com.project.entities.UserMapper;

@Repository
public class UserRepository {

	@Autowired
	protected JdbcTemplate template;

	// devuelve un lista de objetos <User> con todos los usuarios en la bbdd
	public List<User> obtenerUsuarios() {
		String sql = "select id, username, password, name, lastname, birthdate, isAdmin from users";
		return template.query(sql, new UserMapper());

	}

	// devuelve un usuario con el nombre de usuario y contraseña introducidos
	public User getUser(String username, String password) {

		User user = new User();

		String sqlFindUser = "select count(*) from users where username='" + username + "' and password='" + password
				+ "';";

		String sqlGetUser = "select id, username, password, name, lastname, birthdate, isAdmin from users where username='"
				+ username + "' and password='" + password + "';";
		// si existe un usuario con ese usuario y contraseña
		if (template.queryForObject(sqlFindUser, Integer.class) > 0) {
			user = template.query(sqlGetUser, new UserMapper()).get(0);

			// si no existe, se define como nulo
		} else {
			user = null;
		}

		return user;

	}

	public void registerUser(User user) {
		// ID AUTO_INCREMENT
		String sql = "insert into users(username, password, name, lastname, birthdate, isAdmin) values('"
				+ user.getUsername() + "', '" + user.getPassword() + "', '" + user.getName().toUpperCase() + "', '"
				+ user.getLastname().toUpperCase() + "', '" + user.getBirthdate() + "', 0);";
		template.update(sql);
	}

	public boolean existingUsername(String username) {

		boolean exists = false;
		String sql = "select count(*) from users where username='" + username + "';";

		if (template.queryForObject(sql, Integer.class) > 0) {
			exists = true;
		}

		return exists;

	}

}
