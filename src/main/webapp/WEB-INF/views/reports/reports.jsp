<%@ page import="java.util.List" %>
<%@ page import="com.sunriseclinic.sunrisedentalclinic.model.AppointmentDetails" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  List<AppointmentDetails> todayAppointments =
          (List<AppointmentDetails>) request.getAttribute("todayAppointments");

  Object todayRevenue =
          request.getAttribute("todayRevenue");

  Object totalRevenue =
          request.getAttribute("totalRevenue");

  Object totalBills =
          request.getAttribute("totalBills");
%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">

  <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

  <title>Reports | Sunrise Dental Clinic</title>

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
      .no-print {
        display: none !important;
      }

      body {
        background: white !important;
      }

      .report-card {
        box-shadow: none !important;
        border: none !important;
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
         class="flex items-center gap-3 bg-cyan-500/10 text-cyan-300 px-4 py-3 rounded-xl font-medium">

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

  <div class="flex-1 lg:ml-72">

    <header class="sticky top-0 z-30 bg-white/90 backdrop-blur border-b border-slate-200 no-print">

      <div class="px-5 sm:px-8 py-4 flex items-center justify-between">

        <div>

          <p class="text-sm text-slate-500">
            Analytics
          </p>

          <h2 class="text-xl font-bold text-slate-900">
            Reports & Statistics
          </h2>

        </div>


        <button onclick="window.print()"
                class="hidden sm:inline-flex bg-slate-950 hover:bg-slate-800 text-white px-5 py-2.5 rounded-xl text-sm font-semibold transition">

          Print Report

        </button>

      </div>

    </header>


    <main class="p-5 sm:p-8">

      <div class="max-w-7xl mx-auto">


        <!-- Heading -->

        <div class="mb-8">

          <div class="inline-flex items-center gap-2 text-emerald-700 bg-emerald-50 px-3 py-1.5 rounded-full text-sm font-medium">

            Clinic Performance

          </div>


          <h1 class="text-3xl sm:text-4xl font-bold text-slate-950 mt-4">

            Reports overview

          </h1>


          <p class="text-slate-500 mt-2 max-w-2xl">

            Review appointment activity, billing totals and daily clinic performance.

          </p>

        </div>


        <!-- Summary Cards -->

        <section class="grid grid-cols-1 md:grid-cols-3 gap-5 mb-8">


          <div class="bg-white border border-slate-200 rounded-2xl shadow-soft p-6">

            <div class="flex items-start justify-between">

              <div>

                <p class="text-sm font-medium text-slate-500">
                  Today's Revenue
                </p>

                <p class="text-3xl font-bold text-slate-950 mt-2">

                  Rs.
                  <%= todayRevenue != null
                          ? todayRevenue
                          : "0.00" %>

                </p>

              </div>


              <div class="w-12 h-12 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center font-bold">

                Rs

              </div>

            </div>

          </div>


          <div class="bg-white border border-slate-200 rounded-2xl shadow-soft p-6">

            <div class="flex items-start justify-between">

              <div>

                <p class="text-sm font-medium text-slate-500">
                  Total Revenue
                </p>

                <p class="text-3xl font-bold text-slate-950 mt-2">

                  Rs.
                  <%= totalRevenue != null
                          ? totalRevenue
                          : "0.00" %>

                </p>

              </div>


              <div class="w-12 h-12 rounded-xl bg-violet-50 text-violet-600 flex items-center justify-center">

                <svg xmlns="http://www.w3.org/2000/svg"
                     class="w-6 h-6"
                     fill="none"
                     viewBox="0 0 24 24"
                     stroke="currentColor">

                  <path stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M4 19V9m6 10V5m6 14v-7m4 7H2"/>

                </svg>

              </div>

            </div>

          </div>


          <div class="bg-white border border-slate-200 rounded-2xl shadow-soft p-6">

            <div class="flex items-start justify-between">

              <div>

                <p class="text-sm font-medium text-slate-500">
                  Bills Generated
                </p>

                <p class="text-3xl font-bold text-slate-950 mt-2">

                  <%= totalBills != null
                          ? totalBills
                          : 0 %>

                </p>

              </div>


              <div class="w-12 h-12 rounded-xl bg-blue-50 text-blue-600 flex items-center justify-center">

                <svg xmlns="http://www.w3.org/2000/svg"
                     class="w-6 h-6"
                     fill="none"
                     viewBox="0 0 24 24"
                     stroke="currentColor">

                  <path stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M9 14h6m-6-4h6M7 3h10v18l-5-3-5 3V3z"/>

                </svg>

              </div>

            </div>

          </div>


        </section>


        <!-- Daily Appointments -->

        <section class="report-card bg-white border border-slate-200 rounded-3xl shadow-soft overflow-hidden">


          <div class="px-6 sm:px-8 py-6 border-b border-slate-200 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">

            <div>

              <h3 class="text-xl font-semibold text-slate-900">
                Today's Appointments
              </h3>

              <p class="text-sm text-slate-500 mt-1">
                Daily appointment schedule and current status
              </p>

            </div>


            <div class="no-print">

              <button onclick="window.print()"
                      class="inline-flex bg-slate-100 hover:bg-slate-200 text-slate-700 px-4 py-2.5 rounded-xl text-sm font-semibold transition">

                Print Daily Report

              </button>

            </div>

          </div>


          <% if (todayAppointments != null &&
                  !todayAppointments.isEmpty()) { %>

          <div class="overflow-x-auto">

            <table class="min-w-full">

              <thead class="bg-slate-50">

              <tr>

                <th class="text-left px-6 py-4 text-xs font-semibold text-slate-500 uppercase tracking-wider">
                  Appointment
                </th>

                <th class="text-left px-6 py-4 text-xs font-semibold text-slate-500 uppercase tracking-wider">
                  Patient
                </th>

                <th class="text-left px-6 py-4 text-xs font-semibold text-slate-500 uppercase tracking-wider">
                  Dentist
                </th>

                <th class="text-left px-6 py-4 text-xs font-semibold text-slate-500 uppercase tracking-wider">
                  Treatment
                </th>

                <th class="text-left px-6 py-4 text-xs font-semibold text-slate-500 uppercase tracking-wider">
                  Time
                </th>

                <th class="text-left px-6 py-4 text-xs font-semibold text-slate-500 uppercase tracking-wider">
                  Status
                </th>

              </tr>

              </thead>


              <tbody class="divide-y divide-slate-200">

              <% for (AppointmentDetails appointment : todayAppointments) { %>

              <tr class="hover:bg-slate-50 transition">


                <td class="px-6 py-5">

                  <p class="font-semibold text-slate-900">
                    <%= appointment.getAppointmentNumber() %>
                  </p>

                </td>


                <td class="px-6 py-5">

                  <p class="font-medium text-slate-800">
                    <%= appointment.getPatientName() %>
                  </p>

                  <p class="text-sm text-slate-500 mt-1">
                    <%= appointment.getContactNumber() %>
                  </p>

                </td>


                <td class="px-6 py-5">

                  <p class="text-slate-800">
                    <%= appointment.getDentistName() %>
                  </p>

                </td>


                <td class="px-6 py-5">

                  <p class="text-slate-800">
                    <%= appointment.getTreatmentName() %>
                  </p>

                </td>


                <td class="px-6 py-5 whitespace-nowrap">

                  <p class="font-medium text-slate-800">
                    <%= appointment.getAppointmentTime() %>
                  </p>

                </td>


                <td class="px-6 py-5">

                  <% if ("SCHEDULED".equals(appointment.getStatus())) { %>

                  <span class="inline-flex items-center gap-2 bg-blue-50 text-blue-700 px-3 py-1.5 rounded-full text-xs font-semibold">

                                        <span class="w-2 h-2 bg-blue-500 rounded-full"></span>

                                        Scheduled

                                    </span>

                  <% } else if ("COMPLETED".equals(appointment.getStatus())) { %>

                  <span class="inline-flex items-center gap-2 bg-emerald-50 text-emerald-700 px-3 py-1.5 rounded-full text-xs font-semibold">

                                        <span class="w-2 h-2 bg-emerald-500 rounded-full"></span>

                                        Completed

                                    </span>

                  <% } else if ("CANCELLED".equals(appointment.getStatus())) { %>

                  <span class="inline-flex items-center gap-2 bg-red-50 text-red-700 px-3 py-1.5 rounded-full text-xs font-semibold">

                                        <span class="w-2 h-2 bg-red-500 rounded-full"></span>

                                        Cancelled

                                    </span>

                  <% } else { %>

                  <span class="inline-flex bg-slate-100 text-slate-700 px-3 py-1.5 rounded-full text-xs font-semibold">

                                        <%= appointment.getStatus() %>

                                    </span>

                  <% } %>

                </td>


              </tr>

              <% } %>

              </tbody>

            </table>

          </div>

          <% } else { %>

          <div class="px-6 py-16 text-center">

            <div class="w-14 h-14 mx-auto rounded-2xl bg-slate-100 text-slate-400 flex items-center justify-center">

              <svg xmlns="http://www.w3.org/2000/svg"
                   class="w-7 h-7"
                   fill="none"
                   viewBox="0 0 24 24"
                   stroke="currentColor">

                <path stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M8 7V3m8 4V3M5 11h14M5 5h14v16H5z"/>

              </svg>

            </div>

            <h4 class="font-semibold text-slate-900 mt-4">
              No appointments today
            </h4>

            <p class="text-sm text-slate-500 mt-2">
              There are currently no appointments scheduled for today.
            </p>

          </div>

          <% } %>


        </section>


      </div>

    </main>

  </div>

</div>

</body>

</html>