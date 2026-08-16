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

</head>


<body class="bg-slate-100 min-h-screen">

<header class="bg-white shadow-sm">

  <div class="max-w-7xl mx-auto px-6 py-4
                flex justify-between items-center">

    <div>

      <h1 class="text-xl font-bold text-slate-800">
        Sunrise Dental Clinic
      </h1>

      <p class="text-sm text-slate-500">
        Reports & Statistics
      </p>

    </div>

    <a href="<%= request.getContextPath() %>/dashboard"
       class="text-blue-600 hover:text-blue-800 font-medium">

      Dashboard

    </a>

  </div>

</header>


<main class="max-w-7xl mx-auto px-6 py-8">


  <div class="mb-8">

    <h2 class="text-3xl font-bold text-slate-800">
      Clinic Reports
    </h2>

    <p class="text-slate-500 mt-2">
      Review appointments, billing information and clinic performance.
    </p>

  </div>


  <!-- Summary cards -->

  <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">


    <div class="bg-white rounded-xl
                    border border-slate-200
                    shadow-sm p-6">

      <p class="text-sm text-slate-500">
        Today's Revenue
      </p>

      <p class="text-3xl font-bold text-emerald-600 mt-2">

        Rs.
        <%= todayRevenue != null
                ? todayRevenue
                : "0.00" %>

      </p>

    </div>


    <div class="bg-white rounded-xl
                    border border-slate-200
                    shadow-sm p-6">

      <p class="text-sm text-slate-500">
        Total Revenue
      </p>

      <p class="text-3xl font-bold text-purple-600 mt-2">

        Rs.
        <%= totalRevenue != null
                ? totalRevenue
                : "0.00" %>

      </p>

    </div>


    <div class="bg-white rounded-xl
                    border border-slate-200
                    shadow-sm p-6">

      <p class="text-sm text-slate-500">
        Total Bills Generated
      </p>

      <p class="text-3xl font-bold text-blue-600 mt-2">

        <%= totalBills != null
                ? totalBills
                : 0 %>

      </p>

    </div>

  </div>


  <!-- Today appointment report -->

  <div class="bg-white rounded-xl
                border border-slate-200
                shadow-sm overflow-hidden">


    <div class="px-6 py-5
                    border-b border-slate-200
                    flex justify-between items-center">

      <div>

        <h3 class="text-xl font-semibold text-slate-800">
          Today's Appointments
        </h3>

        <p class="text-sm text-slate-500 mt-1">
          Current daily appointment schedule
        </p>

      </div>

      <button onclick="window.print()"
              class="bg-slate-700 text-white
                           px-4 py-2 rounded-lg
                           hover:bg-slate-800">

        Print Report

      </button>

    </div>


    <% if (todayAppointments != null &&
            !todayAppointments.isEmpty()) { %>

    <div class="overflow-x-auto">

      <table class="min-w-full">


        <thead class="bg-slate-50">

        <tr>

          <th class="text-left px-6 py-3
                               text-xs font-semibold
                               text-slate-500 uppercase">

            Appointment No.

          </th>

          <th class="text-left px-6 py-3
                               text-xs font-semibold
                               text-slate-500 uppercase">

            Patient

          </th>

          <th class="text-left px-6 py-3
                               text-xs font-semibold
                               text-slate-500 uppercase">

            Contact

          </th>

          <th class="text-left px-6 py-3
                               text-xs font-semibold
                               text-slate-500 uppercase">

            Dentist

          </th>

          <th class="text-left px-6 py-3
                               text-xs font-semibold
                               text-slate-500 uppercase">

            Treatment

          </th>

          <th class="text-left px-6 py-3
                               text-xs font-semibold
                               text-slate-500 uppercase">

            Time

          </th>

          <th class="text-left px-6 py-3
                               text-xs font-semibold
                               text-slate-500 uppercase">

            Status

          </th>

        </tr>

        </thead>


        <tbody class="divide-y divide-slate-200">

        <% for (AppointmentDetails appointment : todayAppointments) { %>

        <tr class="hover:bg-slate-50">

          <td class="px-6 py-4 font-medium text-slate-800">

            <%= appointment.getAppointmentNumber() %>

          </td>

          <td class="px-6 py-4 text-slate-700">

            <%= appointment.getPatientName() %>

          </td>

          <td class="px-6 py-4 text-slate-700">

            <%= appointment.getContactNumber() %>

          </td>

          <td class="px-6 py-4 text-slate-700">

            <%= appointment.getDentistName() %>

          </td>

          <td class="px-6 py-4 text-slate-700">

            <%= appointment.getTreatmentName() %>

          </td>

          <td class="px-6 py-4 text-slate-700">

            <%= appointment.getAppointmentTime() %>

          </td>

          <td class="px-6 py-4">

            <% if ("SCHEDULED".equals(
                    appointment.getStatus())) { %>

            <span class="bg-blue-100
                                         text-blue-700
                                         px-3 py-1
                                         rounded-full
                                         text-xs font-medium">

                                Scheduled

                            </span>

            <% } else if ("COMPLETED".equals(
                    appointment.getStatus())) { %>

            <span class="bg-green-100
                                         text-green-700
                                         px-3 py-1
                                         rounded-full
                                         text-xs font-medium">

                                Completed

                            </span>

            <% } else if ("CANCELLED".equals(
                    appointment.getStatus())) { %>

            <span class="bg-red-100
                                         text-red-700
                                         px-3 py-1
                                         rounded-full
                                         text-xs font-medium">

                                Cancelled

                            </span>

            <% } else { %>

            <span class="bg-slate-100
                                         text-slate-700
                                         px-3 py-1
                                         rounded-full
                                         text-xs font-medium">

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

    <div class="p-10 text-center">

      <p class="text-slate-500">
        No appointments are scheduled for today.
      </p>

    </div>

    <% } %>


  </div>


</main>

</body>

</html>