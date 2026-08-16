package com.sunriseclinic.sunrisedentalclinic.controller;

import com.sunriseclinic.sunrisedentalclinic.dao.AppointmentDAO;
import com.sunriseclinic.sunrisedentalclinic.model.AppointmentDetails;
import com.sunriseclinic.sunrisedentalclinic.model.Bill;
import com.sunriseclinic.sunrisedentalclinic.service.BillingService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/billing/create")
public class BillingServlet extends HttpServlet {

    private BillingService billingService;
    private AppointmentDAO appointmentDAO;

    @Override
    public void init() {
        billingService = new BillingService();
        appointmentDAO = new AppointmentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int appointmentId =
                    Integer.parseInt(
                            request.getParameter("appointmentId")
                    );

            Bill bill =
                    billingService.generateBill(appointmentId);

            if (bill == null) {

                request.setAttribute(
                        "error",
                        "Unable to generate bill for this appointment."
                );

                request.getRequestDispatcher(
                        "/WEB-INF/views/billing/receipt.jsp"
                ).forward(request, response);

                return;
            }

            AppointmentDetails appointment =
                    appointmentDAO.findById(appointmentId);

            request.setAttribute(
                    "bill",
                    bill
            );

            request.setAttribute(
                    "appointment",
                    appointment
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/billing/receipt.jsp"
            ).forward(request, response);

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid appointment ID."
            );
        }
    }
}