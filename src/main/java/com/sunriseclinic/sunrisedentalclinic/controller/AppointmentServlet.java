package com.sunriseclinic.sunrisedentalclinic.controller;

import com.sunriseclinic.sunrisedentalclinic.dao.DentistDAO;
import com.sunriseclinic.sunrisedentalclinic.dao.TreatmentDAO;
import com.sunriseclinic.sunrisedentalclinic.model.Patient;
import com.sunriseclinic.sunrisedentalclinic.service.AppointmentService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/appointments/new")
public class AppointmentServlet extends HttpServlet {

    private DentistDAO dentistDAO;
    private TreatmentDAO treatmentDAO;
    private AppointmentService appointmentService;

    @Override
    public void init() {
        dentistDAO = new DentistDAO();
        treatmentDAO = new TreatmentDAO();
        appointmentService = new AppointmentService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute(
                "dentists",
                dentistDAO.findAllActive()
        );

        request.setAttribute(
                "treatments",
                treatmentDAO.findAllActive()
        );

        request.getRequestDispatcher(
                "/WEB-INF/views/appointments/new-appointment.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String patientName =
                    request.getParameter("patientName");

            String address =
                    request.getParameter("address");

            String contactNumber =
                    request.getParameter("contactNumber");

            int dentistId =
                    Integer.parseInt(
                            request.getParameter("dentistId")
                    );

            int treatmentId =
                    Integer.parseInt(
                            request.getParameter("treatmentId")
                    );

            LocalDate appointmentDate =
                    LocalDate.parse(
                            request.getParameter("appointmentDate")
                    );

            LocalTime appointmentTime =
                    LocalTime.parse(
                            request.getParameter("appointmentTime")
                    );

            Patient patient = new Patient();

            patient.setPatientName(patientName);
            patient.setAddress(address);
            patient.setContactNumber(contactNumber);

            String result =
                    appointmentService.registerAppointment(
                            patient,
                            dentistId,
                            treatmentId,
                            appointmentDate,
                            appointmentTime
                    );

            if ("DOUBLE_BOOKING".equals(result)) {

                request.setAttribute(
                        "error",
                        "The selected dentist is already booked for that date and time."
                );

                loadFormData(request);

                request.getRequestDispatcher(
                        "/WEB-INF/views/appointments/new-appointment.jsp"
                ).forward(request, response);

                return;
            }

            if (result == null) {

                request.setAttribute(
                        "error",
                        "Unable to register appointment. Please check the entered information."
                );

                loadFormData(request);

                request.getRequestDispatcher(
                        "/WEB-INF/views/appointments/new-appointment.jsp"
                ).forward(request, response);

                return;
            }

            request.setAttribute(
                    "success",
                    "Appointment registered successfully."
            );

            request.setAttribute(
                    "appointmentNumber",
                    result
            );

            loadFormData(request);

            request.getRequestDispatcher(
                    "/WEB-INF/views/appointments/new-appointment.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Invalid appointment information."
            );

            loadFormData(request);

            request.getRequestDispatcher(
                    "/WEB-INF/views/appointments/new-appointment.jsp"
            ).forward(request, response);
        }
    }

    private void loadFormData(HttpServletRequest request) {

        request.setAttribute(
                "dentists",
                dentistDAO.findAllActive()
        );

        request.setAttribute(
                "treatments",
                treatmentDAO.findAllActive()
        );
    }
}