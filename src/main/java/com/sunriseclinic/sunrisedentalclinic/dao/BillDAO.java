package com.sunriseclinic.sunrisedentalclinic.dao;

import com.sunriseclinic.sunrisedentalclinic.model.Bill;
import com.sunriseclinic.sunrisedentalclinic.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class BillDAO {

    public Bill findByAppointmentId(int appointmentId) {

        String sql = """
                SELECT bill_id,
                       appointment_id,
                       consultation_fee,
                       treatment_cost,
                       total_amount,
                       bill_date
                FROM bills
                WHERE appointment_id = ?
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setInt(1, appointmentId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    Bill bill = new Bill();

                    bill.setBillId(resultSet.getInt("bill_id"));
                    bill.setAppointmentId(resultSet.getInt("appointment_id"));
                    bill.setConsultationFee(
                            resultSet.getBigDecimal("consultation_fee")
                    );
                    bill.setTreatmentCost(
                            resultSet.getBigDecimal("treatment_cost")
                    );
                    bill.setTotalAmount(
                            resultSet.getBigDecimal("total_amount")
                    );

                    if (resultSet.getTimestamp("bill_date") != null) {
                        bill.setBillDate(
                                resultSet.getTimestamp("bill_date")
                                        .toLocalDateTime()
                        );
                    }

                    return bill;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public int createBill(Bill bill) {

        String sql = """
                INSERT INTO bills
                (
                    appointment_id,
                    consultation_fee,
                    treatment_cost,
                    total_amount
                )
                VALUES (?, ?, ?, ?)
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(
                                sql,
                                Statement.RETURN_GENERATED_KEYS
                        )
        ) {

            statement.setInt(
                    1,
                    bill.getAppointmentId()
            );

            statement.setBigDecimal(
                    2,
                    bill.getConsultationFee()
            );

            statement.setBigDecimal(
                    3,
                    bill.getTreatmentCost()
            );

            statement.setBigDecimal(
                    4,
                    bill.getTotalAmount()
            );

            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {

                try (ResultSet generatedKeys =
                             statement.getGeneratedKeys()) {

                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }

    public Bill findById(int billId) {

        String sql = """
                SELECT bill_id,
                       appointment_id,
                       consultation_fee,
                       treatment_cost,
                       total_amount,
                       bill_date
                FROM bills
                WHERE bill_id = ?
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setInt(1, billId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    Bill bill = new Bill();

                    bill.setBillId(resultSet.getInt("bill_id"));
                    bill.setAppointmentId(resultSet.getInt("appointment_id"));
                    bill.setConsultationFee(
                            resultSet.getBigDecimal("consultation_fee")
                    );
                    bill.setTreatmentCost(
                            resultSet.getBigDecimal("treatment_cost")
                    );
                    bill.setTotalAmount(
                            resultSet.getBigDecimal("total_amount")
                    );

                    if (resultSet.getTimestamp("bill_date") != null) {
                        bill.setBillDate(
                                resultSet.getTimestamp("bill_date")
                                        .toLocalDateTime()
                        );
                    }

                    return bill;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}