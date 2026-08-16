package com.sunriseclinic.sunrisedentalclinic.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/sunrise_dental_clinic"
                    + "?useSSL=false"
                    + "&allowPublicKeyRetrieval=true"
                    + "&serverTimezone=Asia/Colombo";

    private static final String USERNAME = "root";

    /*
     * Read the database password from an environment variable.
     * Do NOT store the real password in source code.
     */
    private static final String PASSWORD =
            System.getenv("SUNRISE_DB_PASSWORD");

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError(
                    "MySQL JDBC Driver could not be loaded."
            );
        }
    }

    private DBConnection() {
        // Prevent object creation
    }

    public static Connection getConnection()
            throws SQLException {

        if (PASSWORD == null || PASSWORD.isBlank()) {
            throw new SQLException(
                    "Database password environment variable "
                            + "SUNRISE_DB_PASSWORD is not configured."
            );
        }

        return DriverManager.getConnection(
                URL,
                USERNAME,
                PASSWORD
        );
    }
}