<%@ page import="com.sunriseclinic.sunrisedentalclinic.model.Bill" %>
<%@ page import="com.sunriseclinic.sunrisedentalclinic.model.AppointmentDetails" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  Bill bill =
          (Bill) request.getAttribute("bill");

  AppointmentDetails appointment =
          (AppointmentDetails) request.getAttribute("appointment");

  String error =
          (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">

  <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

  <title>Patient Bill | Sunrise Dental Clinic</title>

  <script src="https://cdn.tailwindcss.com"></script>

  <style>

    @media print {

      .no-print {
        display: none !important;
      }

      body {
        background: white !important;
      }

      .receipt {
        box-shadow: none !important;
        border: none !important;
      }
    }

  </style>

</head>


<body class="bg-slate-100 min-h-screen">

<div class="max-w-3xl mx-auto p-6">


  <% if (error != null) { %>

  <div class="bg-white rounded-xl shadow-sm p-6">

    <div class="bg-red-100 text-red-700 px-4 py-3 rounded-lg">
      <%= error %>
    </div>

    <div class="mt-5">

      <a href="<%= request.getContextPath() %>/appointments/search"
         class="text-blue-600 hover:underline">
        Back to Appointments
      </a>

    </div>

  </div>

  <% } else if (bill != null && appointment != null) { %>


  <div class="no-print flex justify-between items-center mb-5">

    <a href="<%= request.getContextPath() %>/appointments/view?id=<%= appointment.getAppointmentId() %>"
       class="text-blue-600 hover:underline">

      Back to Appointment

    </a>

    <button onclick="window.print()"
            class="bg-blue-600 text-white px-5 py-2 rounded-lg hover:bg-blue-700">

      Print Bill

    </button>

  </div>


  <div class="receipt bg-white rounded-xl shadow-sm p-8">

    <div class="text-center border-b border-slate-200 pb-6">

      <h1 class="text-3xl font-bold text-slate-800">
        Sunrise Dental Clinic
      </h1>

      <p class="text-slate-500 mt-2">
        Colombo
      </p>

      <h2 class="text-xl font-semibold text-slate-700 mt-4">
        Patient Receipt
      </h2>

    </div>


    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 py-6">

      <div>

        <p class="text-sm text-slate-500">
          Bill Number
        </p>

        <p class="font-semibold text-slate-800">
          BILL-<%= bill.getBillId() %>
        </p>

      </div>

      <div>

        <p class="text-sm text-slate-500">
          Appointment Number
        </p>

        <p class="font-semibold text-slate-800">
          <%= appointment.getAppointmentNumber() %>
        </p>

      </div>

      <div>

        <p class="text-sm text-slate-500">
          Patient Name
        </p>

        <p class="font-semibold text-slate-800">
          <%= appointment.getPatientName() %>
        </p>

      </div>

      <div>

        <p class="text-sm text-slate-500">
          Contact Number
        </p>

        <p class="font-semibold text-slate-800">
          <%= appointment.getContactNumber() %>
        </p>

      </div>

      <div>

        <p class="text-sm text-slate-500">
          Dentist
        </p>

        <p class="font-semibold text-slate-800">
          <%= appointment.getDentistName() %>
        </p>

      </div>

      <div>

        <p class="text-sm text-slate-500">
          Date / Time
        </p>

        <p class="font-semibold text-slate-800">
          <%= appointment.getAppointmentDate() %>
          -
          <%= appointment.getAppointmentTime() %>
        </p>

      </div>

    </div>


    <div class="border-t border-slate-200 pt-6">

      <h3 class="text-lg font-semibold text-slate-800 mb-4">
        Billing Summary
      </h3>


      <div class="space-y-4">

        <div class="flex justify-between">

          <div>

            <p class="font-medium text-slate-800">
              <%= appointment.getTreatmentName() %>
            </p>

            <p class="text-sm text-slate-500">
              Treatment Fee
            </p>

          </div>

          <p class="font-medium text-slate-800">
            Rs. <%= bill.getTreatmentCost() %>
          </p>

        </div>


        <div class="flex justify-between">

          <p class="text-slate-700">
            Consultation Fee
          </p>

          <p class="font-medium text-slate-800">
            Rs. <%= bill.getConsultationFee() %>
          </p>

        </div>


        <div class="border-t border-slate-300 pt-4 flex justify-between">

          <p class="text-xl font-bold text-slate-800">
            Total
          </p>

          <p class="text-xl font-bold text-slate-800">
            Rs. <%= bill.getTotalAmount() %>
          </p>

        </div>

      </div>

    </div>


    <div class="border-t border-slate-200 mt-8 pt-6 text-center">

      <p class="text-slate-600">
        Thank you for visiting Sunrise Dental Clinic.
      </p>

    </div>

  </div>


  <% } %>

</div>

</body>

</html>