package com.sunriseclinic.sunrisedentalclinic.controller;

import com.sunriseclinic.sunrisedentalclinic.dao.AppointmentDAO;
import com.sunriseclinic.sunrisedentalclinic.model.AppointmentDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/appointments/view")
public class ViewAppointmentServlet extends HttpServlet {

    private AppointmentDAO appointmentDAO;

    @Override
    public void init() {
        appointmentDAO = new AppointmentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int appointmentId =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

            AppointmentDetails appointment =
                    appointmentDAO.findById(appointmentId);

            if (appointment == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Appointment not found."
                );

                return;
            }

            request.setAttribute(
                    "appointment",
                    appointment
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/appointments/view-appointment.jsp"
            ).forward(request, response);

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid appointment ID."
            );
        }
    }
}