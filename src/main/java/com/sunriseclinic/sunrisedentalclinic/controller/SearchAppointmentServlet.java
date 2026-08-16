package com.sunriseclinic.sunrisedentalclinic.controller;

import com.sunriseclinic.sunrisedentalclinic.dao.AppointmentDAO;
import com.sunriseclinic.sunrisedentalclinic.model.AppointmentDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/appointments/search")
public class SearchAppointmentServlet extends HttpServlet {

    private AppointmentDAO appointmentDAO;

    @Override
    public void init() {
        appointmentDAO = new AppointmentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(
                "/WEB-INF/views/appointments/search-appointment.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String searchType =
                request.getParameter("searchType");

        String searchValue =
                request.getParameter("searchValue");

        if (searchValue == null ||
                searchValue.trim().isEmpty()) {

            request.setAttribute(
                    "error",
                    "Please enter a search value."
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/appointments/search-appointment.jsp"
            ).forward(request, response);

            return;
        }

        List<AppointmentDetails> results =
                appointmentDAO.searchAppointments(
                        searchType,
                        searchValue
                );

        request.setAttribute(
                "results",
                results
        );

        request.setAttribute(
                "searched",
                true
        );

        request.setAttribute(
                "searchType",
                searchType
        );

        request.setAttribute(
                "searchValue",
                searchValue
        );

        request.getRequestDispatcher(
                "/WEB-INF/views/appointments/search-appointment.jsp"
        ).forward(request, response);
    }
}