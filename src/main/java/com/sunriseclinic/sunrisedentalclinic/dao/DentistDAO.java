package com.sunriseclinic.sunrisedentalclinic.dao;

import com.sunriseclinic.sunrisedentalclinic.model.Dentist;
import com.sunriseclinic.sunrisedentalclinic.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DentistDAO {

    public List<Dentist> findAllActive() {

        List<Dentist> dentists = new ArrayList<>();

        String sql = """
                SELECT dentist_id, dentist_name, specialization,
                       contact_number, status
                FROM dentists
                WHERE status = 'ACTIVE'
                ORDER BY dentist_name
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Dentist dentist = new Dentist();

                dentist.setDentistId(resultSet.getInt("dentist_id"));
                dentist.setDentistName(resultSet.getString("dentist_name"));
                dentist.setSpecialization(resultSet.getString("specialization"));
                dentist.setContactNumber(resultSet.getString("contact_number"));
                dentist.setStatus(resultSet.getString("status"));

                dentists.add(dentist);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dentists;
    }
}