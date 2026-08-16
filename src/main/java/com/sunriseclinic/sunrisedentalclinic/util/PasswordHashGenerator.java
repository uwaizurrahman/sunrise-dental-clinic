package com.sunriseclinic.sunrisedentalclinic.util;

public class PasswordHashGenerator {

    public static void main(String[] args) {

        String password = "Admin123";

        String hashedPassword = PasswordUtil.hashPassword(password);

        System.out.println("Password: " + password);
        System.out.println("Hash: " + hashedPassword);
    }
}
