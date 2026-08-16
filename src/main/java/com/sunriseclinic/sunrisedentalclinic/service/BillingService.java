package com.sunriseclinic.sunrisedentalclinic.service;

import com.sunriseclinic.sunrisedentalclinic.dao.AppointmentDAO;
import com.sunriseclinic.sunrisedentalclinic.dao.BillDAO;
import com.sunriseclinic.sunrisedentalclinic.model.AppointmentDetails;
import com.sunriseclinic.sunrisedentalclinic.model.Bill;

import java.math.BigDecimal;

public class BillingService {

    private static final BigDecimal CONSULTATION_FEE =
            new BigDecimal("2000.00");

    private final BillDAO billDAO;
    private final AppointmentDAO appointmentDAO;

    public BillingService() {
        this.billDAO = new BillDAO();
        this.appointmentDAO = new AppointmentDAO();
    }

    public Bill generateBill(int appointmentId) {

        Bill existingBill =
                billDAO.findByAppointmentId(appointmentId);

        if (existingBill != null) {
            return existingBill;
        }

        AppointmentDetails appointment =
                appointmentDAO.findById(appointmentId);

        if (appointment == null) {
            return null;
        }

        if ("CANCELLED".equalsIgnoreCase(
                appointment.getStatus())) {
            return null;
        }

        BigDecimal treatmentCost =
                appointment.getTreatmentCost();

        BigDecimal total =
                treatmentCost.add(CONSULTATION_FEE);

        Bill bill = new Bill();

        bill.setAppointmentId(appointmentId);
        bill.setConsultationFee(CONSULTATION_FEE);
        bill.setTreatmentCost(treatmentCost);
        bill.setTotalAmount(total);

        int billId = billDAO.createBill(bill);

        if (billId <= 0) {
            return null;
        }

        return billDAO.findById(billId);
    }
}