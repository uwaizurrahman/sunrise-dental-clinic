package com.sunriseclinic.sunrisedentalclinic.service;

import com.sunriseclinic.sunrisedentalclinic.dao.AppointmentDAO;
import com.sunriseclinic.sunrisedentalclinic.dao.PatientDAO;
import com.sunriseclinic.sunrisedentalclinic.model.Patient;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class AppointmentServiceTest {

    private AppointmentDAO appointmentDAO;
    private PatientDAO patientDAO;
    private AppointmentService appointmentService;

    @BeforeEach
    void setUp() {

        appointmentDAO =
                Mockito.mock(AppointmentDAO.class);

        patientDAO =
                Mockito.mock(PatientDAO.class);

        appointmentService =
                new AppointmentService(
                        appointmentDAO,
                        patientDAO
                );
    }

    private Patient validPatient() {

        Patient patient = new Patient();

        patient.setPatientName("Kamal Perera");
        patient.setAddress("Colombo");
        patient.setContactNumber("0771234567");

        return patient;
    }

    @Test
    void shouldRejectNullPatient() {

        String result =
                appointmentService.registerAppointment(
                        null,
                        1,
                        1,
                        LocalDate.now().plusDays(1),
                        LocalTime.of(10, 0)
                );

        assertNull(result);
    }

    @Test
    void shouldRejectInvalidContactNumber() {

        Patient patient = validPatient();

        patient.setContactNumber("12345");

        String result =
                appointmentService.registerAppointment(
                        patient,
                        1,
                        1,
                        LocalDate.now().plusDays(1),
                        LocalTime.of(10, 0)
                );

        assertNull(result);
    }

    @Test
    void shouldRejectPastAppointmentDate() {

        String result =
                appointmentService.registerAppointment(
                        validPatient(),
                        1,
                        1,
                        LocalDate.now().minusDays(1),
                        LocalTime.of(10, 0)
                );

        assertNull(result);
    }

    @Test
    void shouldReturnDoubleBookingWhenDentistAlreadyBooked() throws SQLException {

        LocalDate date =
                LocalDate.now().plusDays(1);

        LocalTime time =
                LocalTime.of(10, 0);

        when(
                appointmentDAO.isDentistBooked(
                        1,
                        date,
                        time
                )
        ).thenReturn(true);

        String result =
                appointmentService.registerAppointment(
                        validPatient(),
                        1,
                        1,
                        date,
                        time
                );

        assertEquals(
                "DOUBLE_BOOKING",
                result
        );

        verify(
                patientDAO,
                never()
        ).createPatient(
                any(),
                any()
        );
    }
}