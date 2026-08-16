package com.sunriseclinic.sunrisedentalclinic.controller;

import com.sunriseclinic.sunrisedentalclinic.dao.AppointmentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Set;

@WebServlet("/appointments/status")
public class AppointmentStatusServlet extends HttpServlet {

    private AppointmentDAO appointmentDAO;

    private static final Set<String> ALLOWED_STATUSES =
            Set.of("SCHEDULED", "COMPLETED", "CANCELLED");

    @Override
    public void init() {
        appointmentDAO = new AppointmentDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int appointmentId =
                    Integer.parseInt(
                            request.getParameter("appointmentId")
                    );

            String status =
                    request.getParameter("status");

            if (status == null ||
                    !ALLOWED_STATUSES.contains(status)) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Invalid appointment status."
                );

                return;
            }

            boolean updated =
                    appointmentDAO.updateStatus(
                            appointmentId,
                            status
                    );

            if (!updated) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Appointment could not be updated."
                );

                return;
            }

            response.sendRedirect(
                    request.getContextPath()
                            + "/appointments/view?id="
                            + appointmentId
            );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid appointment ID."
            );
        }
    }
}