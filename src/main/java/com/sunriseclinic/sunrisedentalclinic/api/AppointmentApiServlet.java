package com.sunriseclinic.sunrisedentalclinic.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sunriseclinic.sunrisedentalclinic.dao.AppointmentDAO;
import com.sunriseclinic.sunrisedentalclinic.model.AppointmentDetails;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/api/appointments")
public class AppointmentApiServlet extends HttpServlet {

    private AppointmentDAO appointmentDAO;
    private ObjectMapper objectMapper;

    @Override
    public void init() {

        appointmentDAO = new AppointmentDAO();
        objectMapper = new ObjectMapper();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String appointmentNumber =
                request.getParameter("number");

        if (appointmentNumber == null ||
                appointmentNumber.trim().isEmpty()) {

            response.setStatus(
                    HttpServletResponse.SC_BAD_REQUEST
            );

            Map<String, String> error = new HashMap<>();

            error.put(
                    "error",
                    "Appointment number is required."
            );

            objectMapper.writeValue(
                    response.getWriter(),
                    error
            );

            return;
        }

        AppointmentDetails appointment =
                appointmentDAO.findByAppointmentNumber(
                        appointmentNumber.trim()
                );

        if (appointment == null) {

            response.setStatus(
                    HttpServletResponse.SC_NOT_FOUND
            );

            Map<String, String> error = new HashMap<>();

            error.put(
                    "error",
                    "Appointment not found."
            );

            objectMapper.writeValue(
                    response.getWriter(),
                    error
            );

            return;
        }

        Map<String, Object> json = new HashMap<>();

        json.put(
                "appointmentNumber",
                appointment.getAppointmentNumber()
        );

        json.put(
                "patientName",
                appointment.getPatientName()
        );

        json.put(
                "address",
                appointment.getAddress()
        );

        json.put(
                "contactNumber",
                appointment.getContactNumber()
        );

        json.put(
                "dentistName",
                appointment.getDentistName()
        );

        json.put(
                "specialization",
                appointment.getSpecialization()
        );

        json.put(
                "treatmentName",
                appointment.getTreatmentName()
        );

        json.put(
                "treatmentCost",
                appointment.getTreatmentCost()
        );

        json.put(
                "appointmentDate",
                appointment.getAppointmentDate().toString()
        );

        json.put(
                "appointmentTime",
                appointment.getAppointmentTime().toString()
        );

        json.put(
                "status",
                appointment.getStatus()
        );

        response.setStatus(
                HttpServletResponse.SC_OK
        );

        objectMapper.writeValue(
                response.getWriter(),
                json
        );
    }
}