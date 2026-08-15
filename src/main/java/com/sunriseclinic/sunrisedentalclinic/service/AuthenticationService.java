package com.sunriseclinic.sunrisedentalclinic.service;

import com.sunriseclinic.sunrisedentalclinic.dao.UserDAO;
import com.sunriseclinic.sunrisedentalclinic.model.User;
import com.sunriseclinic.sunrisedentalclinic.util.PasswordUtil;

public class AuthenticationService {

    private final UserDAO userDAO;

    public AuthenticationService() {
        this.userDAO = new UserDAO();
    }

    public User authenticate(String username, String password) {

        if (username == null || username.trim().isEmpty()) {
            return null;
        }

        if (password == null || password.isEmpty()) {
            return null;
        }

        User user = userDAO.findByUsername(username.trim());

        System.out.println("Username entered: " + username);
        System.out.println("User found: " + (user != null));

        if (user != null) {
            System.out.println("Stored username: " + user.getUsername());
            System.out.println("Stored role: " + user.getRole());
        }

        if (user == null) {
            return null;
        }

        boolean passwordMatches =
                PasswordUtil.checkPassword(
                        password,
                        user.getPasswordHash()
                );

        System.out.println("Password matches: " + passwordMatches);

        if (passwordMatches) {
            return user;
        }

        return null;
    }
}