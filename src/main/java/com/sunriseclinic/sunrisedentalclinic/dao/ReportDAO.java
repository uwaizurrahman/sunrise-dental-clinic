package com.sunriseclinic.sunrisedentalclinic.dao;

import com.sunriseclinic.sunrisedentalclinic.model.AppointmentDetails;
import com.sunriseclinic.sunrisedentalclinic.util.DBConnection;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReportDAO {

    public List<AppointmentDetails> getTodayAppointments() {

        List<AppointmentDetails> appointments = new ArrayList<>();

        String sql = """
                SELECT
                    a.appointment_id,
                    a.appointment_number,
                    p.patient_name,
                    p.address,
                    p.contact_number,
                    d.dentist_name,
                    d.specialization,
                    t.treatment_name,
                    t.treatment_cost,
                    a.appointment_date,
                    a.appointment_time,
                    a.status
                FROM appointments a
                INNER JOIN patients p
                    ON a.patient_id = p.patient_id
                INNER JOIN dentists d
                    ON a.dentist_id = d.dentist_id
                INNER JOIN treatments t
                    ON a.treatment_id = t.treatment_id
                WHERE a.appointment_date = CURDATE()
                ORDER BY a.appointment_time
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                AppointmentDetails details = new AppointmentDetails();

                details.setAppointmentId(
                        resultSet.getInt("appointment_id")
                );

                details.setAppointmentNumber(
                        resultSet.getString("appointment_number")
                );

                details.setPatientName(
                        resultSet.getString("patient_name")
                );

                details.setAddress(
                        resultSet.getString("address")
                );

                details.setContactNumber(
                        resultSet.getString("contact_number")
                );

                details.setDentistName(
                        resultSet.getString("dentist_name")
                );

                details.setSpecialization(
                        resultSet.getString("specialization")
                );

                details.setTreatmentName(
                        resultSet.getString("treatment_name")
                );

                details.setTreatmentCost(
                        resultSet.getBigDecimal("treatment_cost")
                );

                details.setAppointmentDate(
                        resultSet.getDate("appointment_date").toLocalDate()
                );

                details.setAppointmentTime(
                        resultSet.getTime("appointment_time").toLocalTime()
                );

                details.setStatus(
                        resultSet.getString("status")
                );

                appointments.add(details);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return appointments;
    }


    public BigDecimal getTodayRevenue() {

        String sql = """
                SELECT COALESCE(SUM(b.total_amount), 0)
                FROM bills b
                WHERE DATE(b.bill_date) = CURDATE()
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {

            if (resultSet.next()) {
                return resultSet.getBigDecimal(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return BigDecimal.ZERO;
    }


    public BigDecimal getTotalRevenue() {

        String sql = """
                SELECT COALESCE(SUM(total_amount), 0)
                FROM bills
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {

            if (resultSet.next()) {
                return resultSet.getBigDecimal(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return BigDecimal.ZERO;
    }


    public int getTotalBills() {

        String sql = """
                SELECT COUNT(*)
                FROM bills
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}