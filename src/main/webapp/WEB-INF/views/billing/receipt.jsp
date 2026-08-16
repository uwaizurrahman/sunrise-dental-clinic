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

  <script>
    tailwind.config = {
      theme: {
        extend: {
          boxShadow: {
            soft: '0 12px 35px rgba(15, 23, 42, 0.07)'
          }
        }
      }
    }
  </script>

  <style>

    @media print {

      body {
        background: white !important;
      }

      .no-print {
        display: none !important;
      }

      .print-wrapper {
        padding: 0 !important;
      }

      .receipt-card {
        box-shadow: none !important;
        border: none !important;
        border-radius: 0 !important;
      }
    }

  </style>

</head>

<body class="bg-slate-50 text-slate-800 min-h-screen">

<div class="min-h-screen lg:flex">


  <!-- Sidebar -->

  <aside class="hidden lg:flex lg:w-72 lg:flex-col bg-slate-950 text-white fixed inset-y-0 left-0 no-print">

    <div class="px-7 py-7 border-b border-slate-800">

      <div class="flex items-center gap-3">

        <div class="w-11 h-11 rounded-xl bg-cyan-500 flex items-center justify-center font-bold text-lg">
          S
        </div>

        <div>

          <h1 class="font-bold text-lg">
            Sunrise Dental
          </h1>

          <p class="text-xs text-slate-400 mt-1">
            Clinic Management
          </p>

        </div>

      </div>

    </div>


    <nav class="flex-1 px-4 py-6 space-y-2">

      <a href="<%= request.getContextPath() %>/dashboard"
         class="flex items-center gap-3 text-slate-300 hover:text-white hover:bg-slate-800 px-4 py-3 rounded-xl transition">

        Dashboard

      </a>

      <a href="<%= request.getContextPath() %>/appointments/new"
         class="flex items-center gap-3 text-slate-300 hover:text-white hover:bg-slate-800 px-4 py-3 rounded-xl transition">

        New Appointment

      </a>

      <a href="<%= request.getContextPath() %>/appointments/search"
         class="flex items-center gap-3 text-slate-300 hover:text-white hover:bg-slate-800 px-4 py-3 rounded-xl transition">

        Search Appointments

      </a>

      <a href="<%= request.getContextPath() %>/reports"
         class="flex items-center gap-3 text-slate-300 hover:text-white hover:bg-slate-800 px-4 py-3 rounded-xl transition">

        Reports

      </a>

      <a href="<%= request.getContextPath() %>/help"
         class="flex items-center gap-3 text-slate-300 hover:text-white hover:bg-slate-800 px-4 py-3 rounded-xl transition">

        Help & Support

      </a>

    </nav>


    <div class="p-4 border-t border-slate-800">

      <a href="<%= request.getContextPath() %>/logout"
         class="block text-center bg-slate-900 hover:bg-red-500/20 hover:text-red-300 px-4 py-3 rounded-xl transition">

        Sign Out

      </a>

    </div>

  </aside>


  <!-- Main -->

  <div class="flex-1 lg:ml-72 print-wrapper">

    <header class="sticky top-0 z-30 bg-white/90 backdrop-blur border-b border-slate-200 no-print">

      <div class="px-5 sm:px-8 py-4 flex items-center justify-between">

        <div>

          <p class="text-sm text-slate-500">
            Billing
          </p>

          <h2 class="text-xl font-bold text-slate-900">
            Patient Receipt
          </h2>

        </div>


        <% if (appointment != null) { %>

        <a href="<%= request.getContextPath() %>/appointments/view?id=<%= appointment.getAppointmentId() %>"
           class="text-sm font-medium text-slate-600 hover:text-slate-900">

          Back to Appointment

        </a>

        <% } %>

      </div>

    </header>


    <main class="p-5 sm:p-8">

      <div class="max-w-4xl mx-auto">


        <% if (error != null) { %>

        <section class="bg-white border border-red-200 rounded-3xl shadow-soft p-8">

          <div class="w-12 h-12 rounded-xl bg-red-50 text-red-600 flex items-center justify-center mb-5">

            !

          </div>

          <h1 class="text-2xl font-bold text-slate-900">
            Unable to generate bill
          </h1>

          <p class="text-red-600 mt-3">
            <%= error %>
          </p>

          <a href="<%= request.getContextPath() %>/appointments/search"
             class="inline-flex mt-6 bg-slate-950 hover:bg-slate-800 text-white px-5 py-3 rounded-xl font-semibold transition">

            Back to Appointments

          </a>

        </section>

        <% } else if (bill != null && appointment != null) { %>


        <!-- Actions -->

        <div class="no-print flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 mb-6">

          <div>

            <p class="text-sm text-slate-500">
              Bill generated successfully
            </p>

            <h1 class="text-2xl font-bold text-slate-900 mt-1">
              BILL-<%= bill.getBillId() %>
            </h1>

          </div>


          <div class="flex flex-wrap gap-3">

            <a href="<%= request.getContextPath() %>/appointments/view?id=<%= appointment.getAppointmentId() %>"
               class="px-5 py-3 border border-slate-300 text-slate-700 rounded-xl font-semibold hover:bg-slate-50 transition">

              Back

            </a>

            <button onclick="window.print()"
                    class="px-6 py-3 bg-slate-950 hover:bg-slate-800 text-white rounded-xl font-semibold shadow-lg shadow-slate-900/10 transition">

              Print Receipt

            </button>

          </div>

        </div>


        <!-- Receipt -->

        <section class="receipt-card bg-white border border-slate-200 rounded-3xl shadow-soft overflow-hidden">


          <!-- Receipt Header -->

          <div class="bg-slate-950 text-white px-7 sm:px-10 py-8">

            <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-6">

              <div class="flex items-center gap-4">

                <div class="w-14 h-14 rounded-2xl bg-cyan-500 text-slate-950 flex items-center justify-center font-bold text-xl">

                  S

                </div>

                <div>

                  <h1 class="text-2xl font-bold">
                    Sunrise Dental Clinic
                  </h1>

                  <p class="text-sm text-slate-400 mt-1">
                    Colombo, Sri Lanka
                  </p>

                </div>

              </div>


              <div class="sm:text-right">

                <p class="text-xs uppercase tracking-wider text-slate-400">
                  Receipt
                </p>

                <p class="text-xl font-bold mt-1">
                  BILL-<%= bill.getBillId() %>
                </p>

              </div>

            </div>

          </div>


          <!-- Details -->

          <div class="p-7 sm:p-10">


            <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 pb-8 border-b border-slate-200">


              <div>

                <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider">
                  Appointment Number
                </p>

                <p class="font-semibold text-slate-900 mt-1">
                  <%= appointment.getAppointmentNumber() %>
                </p>

              </div>


              <div>

                <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider">
                  Bill Date
                </p>

                <p class="font-semibold text-slate-900 mt-1">

                  <%= bill.getBillDate() != null
                          ? bill.getBillDate()
                          : "-" %>

                </p>

              </div>


              <div>

                <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider">
                  Patient
                </p>

                <p class="font-semibold text-slate-900 mt-1">
                  <%= appointment.getPatientName() %>
                </p>

                <p class="text-sm text-slate-500 mt-1">
                  <%= appointment.getContactNumber() %>
                </p>

              </div>


              <div>

                <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider">
                  Dentist
                </p>

                <p class="font-semibold text-slate-900 mt-1">
                  <%= appointment.getDentistName() %>
                </p>

              </div>


              <div>

                <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider">
                  Appointment Date
                </p>

                <p class="font-semibold text-slate-900 mt-1">
                  <%= appointment.getAppointmentDate() %>
                </p>

              </div>


              <div>

                <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider">
                  Appointment Time
                </p>

                <p class="font-semibold text-slate-900 mt-1">
                  <%= appointment.getAppointmentTime() %>
                </p>

              </div>


            </div>


            <!-- Charges -->

            <div class="pt-8">

              <h2 class="text-xl font-bold text-slate-900">
                Billing Summary
              </h2>

              <p class="text-sm text-slate-500 mt-1">
                Treatment and consultation charges
              </p>


              <div class="mt-6 border border-slate-200 rounded-2xl overflow-hidden">


                <div class="flex items-center justify-between gap-6 px-5 py-5 border-b border-slate-200">

                  <div>

                    <p class="font-semibold text-slate-900">
                      <%= appointment.getTreatmentName() %>
                    </p>

                    <p class="text-sm text-slate-500 mt-1">
                      Treatment fee
                    </p>

                  </div>

                  <p class="font-semibold text-slate-900 whitespace-nowrap">
                    Rs. <%= bill.getTreatmentCost() %>
                  </p>

                </div>


                <div class="flex items-center justify-between gap-6 px-5 py-5 border-b border-slate-200">

                  <div>

                    <p class="font-medium text-slate-800">
                      Consultation Fee
                    </p>

                    <p class="text-sm text-slate-500 mt-1">
                      Standard clinic consultation
                    </p>

                  </div>

                  <p class="font-semibold text-slate-900 whitespace-nowrap">
                    Rs. <%= bill.getConsultationFee() %>
                  </p>

                </div>


                <div class="flex items-center justify-between gap-6 px-5 py-6 bg-slate-50">

                  <div>

                    <p class="text-sm font-semibold text-slate-500 uppercase tracking-wider">
                      Total Amount
                    </p>

                  </div>

                  <p class="text-2xl font-bold text-slate-950 whitespace-nowrap">
                    Rs. <%= bill.getTotalAmount() %>
                  </p>

                </div>


              </div>

            </div>


            <!-- Footer -->

            <div class="mt-10 pt-7 border-t border-slate-200 text-center">

              <p class="font-semibold text-slate-800">
                Thank you for visiting Sunrise Dental Clinic
              </p>

              <p class="text-sm text-slate-500 mt-2">
                Please keep this receipt for your records.
              </p>

            </div>


          </div>

        </section>


        <% } %>

      </div>

    </main>

  </div>

</div>

</body>

</html>