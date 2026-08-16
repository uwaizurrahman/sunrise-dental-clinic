package com.sunriseclinic.sunrisedentalclinic.service;

import com.sunriseclinic.sunrisedentalclinic.dao.AppointmentDAO;
import com.sunriseclinic.sunrisedentalclinic.dao.PatientDAO;
import com.sunriseclinic.sunrisedentalclinic.model.Appointment;
import com.sunriseclinic.sunrisedentalclinic.model.Patient;
import com.sunriseclinic.sunrisedentalclinic.util.DBConnection;

import java.sql.Connection;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Year;

public class AppointmentService {

    private final AppointmentDAO appointmentDAO;
    private final PatientDAO patientDAO;

    public AppointmentService() {

        appointmentDAO =
                new AppointmentDAO();

        patientDAO =
                new PatientDAO();
    }

    public AppointmentService(
            AppointmentDAO appointmentDAO,
            PatientDAO patientDAO
    ) {
        this.appointmentDAO = appointmentDAO;
        this.patientDAO = patientDAO;
    }


    public String registerAppointment(
            Patient patient,
            int dentistId,
            int treatmentId,
            LocalDate appointmentDate,
            LocalTime appointmentTime
    ) {


        // ==========================================
        // VALIDATION
        // ==========================================

        if (patient == null) {
            return null;
        }


        if (patient.getPatientName() == null ||
                patient.getPatientName()
                        .trim()
                        .isEmpty()) {

            return null;
        }


        if (patient.getAddress() == null ||
                patient.getAddress()
                        .trim()
                        .isEmpty()) {

            return null;
        }


        if (patient.getContactNumber() == null ||
                !patient.getContactNumber()
                        .matches("\\d{10}")) {

            return null;
        }


        if (dentistId <= 0) {
            return null;
        }


        if (treatmentId <= 0) {
            return null;
        }


        if (appointmentDate == null ||
                appointmentDate.isBefore(
                        LocalDate.now()
                )) {

            return null;
        }


        if (appointmentTime == null) {
            return null;
        }


        // ==========================================
        // DOUBLE BOOKING CHECK
        // ==========================================

        boolean dentistBooked =
                appointmentDAO.isDentistBooked(
                        dentistId,
                        appointmentDate,
                        appointmentTime
                );


        if (dentistBooked) {

            return "DOUBLE_BOOKING";
        }


        // ==========================================
        // DATABASE TRANSACTION
        // ==========================================

        Connection connection = null;


        try {

            connection =
                    DBConnection.getConnection();


            // Turn automatic commit OFF
            connection.setAutoCommit(false);


            // ======================================
            // STEP 1 - INSERT PATIENT
            // ======================================

            int patientId =
                    patientDAO.createPatient(
                            connection,
                            patient
                    );


            // ======================================
            // STEP 2 - CREATE APPOINTMENT OBJECT
            // ======================================

            String appointmentNumber =
                    generateAppointmentNumber();


            Appointment appointment =
                    new Appointment();


            appointment.setAppointmentNumber(
                    appointmentNumber
            );


            appointment.setPatientId(
                    patientId
            );


            appointment.setDentistId(
                    dentistId
            );


            appointment.setTreatmentId(
                    treatmentId
            );


            appointment.setAppointmentDate(
                    appointmentDate
            );


            appointment.setAppointmentTime(
                    appointmentTime
            );


            appointment.setStatus(
                    "SCHEDULED"
            );


            // ======================================
            // STEP 3 - INSERT APPOINTMENT
            // ======================================

            boolean appointmentCreated =
                    appointmentDAO.createAppointment(
                            connection,
                            appointment
                    );


            if (!appointmentCreated) {

                throw new Exception(
                        "Appointment could not be created."
                );
            }


            // ======================================
            // EVERYTHING SUCCESSFUL
            // ======================================

            connection.commit();


            return appointmentNumber;


        } catch (Exception e) {


            // ======================================
            // SOMETHING FAILED
            // ======================================

            if (connection != null) {

                try {

                    connection.rollback();

                    System.out.println(
                            "Transaction rolled back."
                    );

                } catch (Exception rollbackException) {

                    rollbackException.printStackTrace();
                }
            }


            e.printStackTrace();

            return null;


        } finally {


            // ======================================
            // CLOSE CONNECTION
            // ======================================

            if (connection != null) {

                try {

                    connection.setAutoCommit(true);

                    connection.close();

                } catch (Exception closeException) {

                    closeException.printStackTrace();
                }
            }
        }
    }


    // ==============================================
    // GENERATE APPOINTMENT NUMBER
    // ==============================================

    private String generateAppointmentNumber() {

        long uniquePart =
                System.currentTimeMillis()
                        % 1000000;


        return "APT-"
                + Year.now().getValue()
                + "-"
                + String.format(
                "%06d",
                uniquePart
        );
    }
}