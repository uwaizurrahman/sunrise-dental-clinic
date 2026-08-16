package com.sunriseclinic.sunrisedentalclinic.controller;

import com.sunriseclinic.sunrisedentalclinic.dao.ReportDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/reports")
public class ReportServlet extends HttpServlet {

    private ReportDAO reportDAO;

    @Override
    public void init() {
        reportDAO = new ReportDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute(
                "todayAppointments",
                reportDAO.getTodayAppointments()
        );

        request.setAttribute(
                "todayRevenue",
                reportDAO.getTodayRevenue()
        );

        request.setAttribute(
                "totalRevenue",
                reportDAO.getTotalRevenue()
        );

        request.setAttribute(
                "totalBills",
                reportDAO.getTotalBills()
        );

        request.getRequestDispatcher(
                "/WEB-INF/views/reports/reports.jsp"
        ).forward(request, response);
    }
}