package com.sunriseclinic.sunrisedentalclinic.service;

import com.sunriseclinic.sunrisedentalclinic.dao.AppointmentDAO;
import com.sunriseclinic.sunrisedentalclinic.dao.PatientDAO;
import com.sunriseclinic.sunrisedentalclinic.model.Appointment;
import com.sunriseclinic.sunrisedentalclinic.model.Patient;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Year;

public class AppointmentService {

    private final AppointmentDAO appointmentDAO;
    private final PatientDAO patientDAO;

    public AppointmentService() {
        this.appointmentDAO = new AppointmentDAO();
        this.patientDAO = new PatientDAO();
    }

    public String registerAppointment(
            Patient patient,
            int dentistId,
            int treatmentId,
            LocalDate appointmentDate,
            LocalTime appointmentTime
    ) {

        if (patient == null) {
            return null;
        }

        if (patient.getPatientName() == null ||
                patient.getPatientName().trim().isEmpty()) {
            return null;
        }

        if (patient.getAddress() == null ||
                patient.getAddress().trim().isEmpty()) {
            return null;
        }

        if (patient.getContactNumber() == null ||
                !patient.getContactNumber().matches("\\d{10}")) {
            return null;
        }

        if (appointmentDate == null ||
                appointmentDate.isBefore(LocalDate.now())) {
            return null;
        }

        if (appointmentTime == null) {
            return null;
        }

        boolean booked =
                appointmentDAO.isDentistBooked(
                        dentistId,
                        appointmentDate,
                        appointmentTime
                );

        if (booked) {
            return "DOUBLE_BOOKING";
        }

        int patientId =
                patientDAO.createPatient(patient);

        if (patientId <= 0) {
            return null;
        }

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

        boolean saved =
                appointmentDAO.createAppointment(
                        appointment
                );

        if (saved) {
            return appointmentNumber;
        }

        return null;
    }

    private String generateAppointmentNumber() {

        long uniquePart =
                System.currentTimeMillis() % 1000000;

        return "APT-" +
                Year.now().getValue() +
                "-" +
                String.format("%06d", uniquePart);
    }
}