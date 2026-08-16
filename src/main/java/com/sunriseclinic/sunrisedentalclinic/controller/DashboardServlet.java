package com.sunriseclinic.sunrisedentalclinic.controller;

import com.sunriseclinic.sunrisedentalclinic.dao.DashboardDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private DashboardDAO dashboardDAO;

    @Override
    public void init() {
        dashboardDAO = new DashboardDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute(
                "totalPatients",
                dashboardDAO.getTotalPatients()
        );

        request.setAttribute(
                "todayAppointments",
                dashboardDAO.getTodayAppointments()
        );

        request.setAttribute(
                "completedAppointments",
                dashboardDAO.getCompletedAppointments()
        );

        request.setAttribute(
                "totalRevenue",
                dashboardDAO.getTotalRevenue()
        );

        request.getRequestDispatcher(
                "/WEB-INF/views/dashboard/dashboard.jsp"
        ).forward(request, response);
    }
}