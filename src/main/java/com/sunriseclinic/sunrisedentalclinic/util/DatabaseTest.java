package com.sunriseclinic.sunrisedentalclinic.util;

import java.sql.Connection;

public class DatabaseTest {

    public static void main(String[] args) {

        System.out.println("1. Program started");

        try {

            System.out.println("2. Calling DBConnection.getConnection()...");

            Connection connection = DBConnection.getConnection();

            System.out.println("3. Connection method returned");

            if (connection != null) {
                System.out.println("4. Connection is NOT null");
                System.out.println("5. Database connection successful!");
            } else {
                System.out.println("4. Connection is NULL");
            }

            if (connection != null) {
                connection.close();
                System.out.println("6. Connection closed");
            }

        } catch (Exception e) {

            System.out.println("ERROR OCCURRED!");
            e.printStackTrace();
        }

        System.out.println("7. Program finished");
    }
}