package com.sunriseclinic.sunrisedentalclinic.dao;

import com.sunriseclinic.sunrisedentalclinic.model.Treatment;
import com.sunriseclinic.sunrisedentalclinic.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TreatmentDAO {

    public List<Treatment> findAllActive() {

        List<Treatment> treatments = new ArrayList<>();

        String sql = """
                SELECT treatment_id, treatment_name,
                       treatment_cost, status
                FROM treatments
                WHERE status = 'ACTIVE'
                ORDER BY treatment_name
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                Treatment treatment = new Treatment();

                treatment.setTreatmentId(
                        resultSet.getInt("treatment_id")
                );

                treatment.setTreatmentName(
                        resultSet.getString("treatment_name")
                );

                treatment.setTreatmentCost(
                        resultSet.getBigDecimal("treatment_cost")
                );

                treatment.setStatus(
                        resultSet.getString("status")
                );

                treatments.add(treatment);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return treatments;
    }
}