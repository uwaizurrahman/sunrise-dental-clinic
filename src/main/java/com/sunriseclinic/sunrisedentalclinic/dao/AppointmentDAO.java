package com.sunriseclinic.sunrisedentalclinic.dao;

import com.sunriseclinic.sunrisedentalclinic.model.Appointment;
import com.sunriseclinic.sunrisedentalclinic.model.AppointmentDetails;
import com.sunriseclinic.sunrisedentalclinic.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class AppointmentDAO {


    // =====================================================
    // CHECK DOUBLE BOOKING
    // =====================================================

    public boolean isDentistBooked(
            int dentistId,
            java.time.LocalDate appointmentDate,
            java.time.LocalTime appointmentTime
    ) {

        String sql = """
                SELECT appointment_id
                FROM appointments
                WHERE dentist_id = ?
                  AND appointment_date = ?
                  AND appointment_time = ?
                  AND status <> 'CANCELLED'
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, dentistId);

            statement.setDate(
                    2,
                    java.sql.Date.valueOf(appointmentDate)
            );

            statement.setTime(
                    3,
                    java.sql.Time.valueOf(appointmentTime)
            );

            try (ResultSet resultSet =
                         statement.executeQuery()) {

                return resultSet.next();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =====================================================
    // CREATE APPOINTMENT - NORMAL VERSION
    // =====================================================

    public boolean createAppointment(
            Appointment appointment
    ) {

        String sql = """
                INSERT INTO appointments
                (
                    appointment_number,
                    patient_id,
                    dentist_id,
                    treatment_id,
                    appointment_date,
                    appointment_time,
                    status
                )
                VALUES (?, ?, ?, ?, ?, ?, ?)
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            setAppointmentParameters(
                    statement,
                    appointment
            );

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =====================================================
    // CREATE APPOINTMENT - TRANSACTION VERSION
    // =====================================================

    public boolean createAppointment(
            Connection connection,
            Appointment appointment
    ) throws SQLException {

        String sql = """
                INSERT INTO appointments
                (
                    appointment_number,
                    patient_id,
                    dentist_id,
                    treatment_id,
                    appointment_date,
                    appointment_time,
                    status
                )
                VALUES (?, ?, ?, ?, ?, ?, ?)
                """;

        try (
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            setAppointmentParameters(
                    statement,
                    appointment
            );

            return statement.executeUpdate() > 0;
        }
    }


    // Helper method so we don't repeat parameter code
    private void setAppointmentParameters(
            PreparedStatement statement,
            Appointment appointment
    ) throws SQLException {

        statement.setString(
                1,
                appointment.getAppointmentNumber()
        );

        statement.setInt(
                2,
                appointment.getPatientId()
        );

        statement.setInt(
                3,
                appointment.getDentistId()
        );

        statement.setInt(
                4,
                appointment.getTreatmentId()
        );

        statement.setDate(
                5,
                java.sql.Date.valueOf(
                        appointment.getAppointmentDate()
                )
        );

        statement.setTime(
                6,
                java.sql.Time.valueOf(
                        appointment.getAppointmentTime()
                )
        );

        statement.setString(
                7,
                appointment.getStatus()
        );
    }


    // =====================================================
    // SEARCH APPOINTMENTS
    // =====================================================

    public List<AppointmentDetails> searchAppointments(
            String searchType,
            String searchValue
    ) {

        List<AppointmentDetails> appointments =
                new ArrayList<>();

        String baseSql = """
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
                """;

        if (searchType == null) {
            return appointments;
        }

        String condition;

        switch (searchType) {

            case "appointmentNumber":
                condition =
                        " WHERE a.appointment_number = ?";
                break;

            case "patientName":
                condition =
                        " WHERE p.patient_name LIKE ?";
                break;

            case "contactNumber":
                condition =
                        " WHERE p.contact_number = ?";
                break;

            default:
                return appointments;
        }

        String sql =
                baseSql
                        + condition
                        + " ORDER BY a.appointment_date DESC, "
                        + "a.appointment_time DESC";

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            if ("patientName".equals(searchType)) {

                statement.setString(
                        1,
                        "%" + searchValue.trim() + "%"
                );

            } else {

                statement.setString(
                        1,
                        searchValue.trim()
                );
            }

            try (
                    ResultSet resultSet =
                            statement.executeQuery()
            ) {

                while (resultSet.next()) {

                    appointments.add(
                            mapAppointmentDetails(resultSet)
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return appointments;
    }


    // =====================================================
    // FIND APPOINTMENT BY ID
    // =====================================================

    public AppointmentDetails findById(
            int appointmentId
    ) {

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
                WHERE a.appointment_id = ?
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(
                    1,
                    appointmentId
            );

            try (
                    ResultSet resultSet =
                            statement.executeQuery()
            ) {

                if (resultSet.next()) {

                    return mapAppointmentDetails(
                            resultSet
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    // =====================================================
    // FIND BY APPOINTMENT NUMBER - API
    // =====================================================

    public AppointmentDetails findByAppointmentNumber(
            String appointmentNumber
    ) {

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
                WHERE a.appointment_number = ?
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setString(
                    1,
                    appointmentNumber
            );

            try (
                    ResultSet resultSet =
                            statement.executeQuery()
            ) {

                if (resultSet.next()) {

                    return mapAppointmentDetails(
                            resultSet
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    // =====================================================
    // UPDATE STATUS
    // =====================================================

    public boolean updateStatus(
            int appointmentId,
            String status
    ) {

        String sql = """
                UPDATE appointments
                SET status = ?
                WHERE appointment_id = ?
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setString(
                    1,
                    status
            );

            statement.setInt(
                    2,
                    appointmentId
            );

            return statement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }


    // =====================================================
    // MAPPING HELPER
    // =====================================================

    private AppointmentDetails mapAppointmentDetails(
            ResultSet resultSet
    ) throws SQLException {

        AppointmentDetails details =
                new AppointmentDetails();

        details.setAppointmentId(
                resultSet.getInt(
                        "appointment_id"
                )
        );

        details.setAppointmentNumber(
                resultSet.getString(
                        "appointment_number"
                )
        );

        details.setPatientName(
                resultSet.getString(
                        "patient_name"
                )
        );

        details.setAddress(
                resultSet.getString(
                        "address"
                )
        );

        details.setContactNumber(
                resultSet.getString(
                        "contact_number"
                )
        );

        details.setDentistName(
                resultSet.getString(
                        "dentist_name"
                )
        );

        details.setSpecialization(
                resultSet.getString(
                        "specialization"
                )
        );

        details.setTreatmentName(
                resultSet.getString(
                        "treatment_name"
                )
        );

        details.setTreatmentCost(
                resultSet.getBigDecimal(
                        "treatment_cost"
                )
        );

        details.setAppointmentDate(
                resultSet
                        .getDate(
                                "appointment_date"
                        )
                        .toLocalDate()
        );

        details.setAppointmentTime(
                resultSet
                        .getTime(
                                "appointment_time"
                        )
                        .toLocalTime()
        );

        details.setStatus(
                resultSet.getString(
                        "status"
                )
        );

        return details;
    }
}