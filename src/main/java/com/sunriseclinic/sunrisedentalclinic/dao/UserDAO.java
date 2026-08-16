package com.sunriseclinic.sunrisedentalclinic.dao;

import com.sunriseclinic.sunrisedentalclinic.model.User;
import com.sunriseclinic.sunrisedentalclinic.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public User findByUsername(String username) {

        String sql = """
                SELECT user_id, username, password_hash, role
                FROM users
                WHERE username = ?
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            System.out.println("Database connection created: " + (connection != null));
            System.out.println("Database URL: " + connection.getMetaData().getURL());
            System.out.println("Searching username: [" + username + "]");

            statement.setString(1, username);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    System.out.println("User FOUND in database");

                    User user = new User();

                    user.setUserId(resultSet.getInt("user_id"));
                    user.setUsername(resultSet.getString("username"));
                    user.setPasswordHash(resultSet.getString("password_hash"));
                    user.setRole(resultSet.getString("role"));

                    return user;

                } else {

                    System.out.println("User NOT FOUND in database");
                }
            }

        } catch (SQLException e) {

            System.out.println("DATABASE ERROR");
            e.printStackTrace();
        }

        return null;
    }
}