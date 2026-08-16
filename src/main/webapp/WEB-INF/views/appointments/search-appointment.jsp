<%@ page import="java.util.List" %>
<%@ page import="com.sunriseclinic.sunrisedentalclinic.model.AppointmentDetails" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<AppointmentDetails> results =
            (List<AppointmentDetails>) request.getAttribute("results");

    Boolean searched =
            (Boolean) request.getAttribute("searched");

    String error =
            (String) request.getAttribute("error");

    String selectedType =
            (String) request.getAttribute("searchType");

    String searchValue =
            (String) request.getAttribute("searchValue");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Search Appointments | Sunrise Dental Clinic</title>

    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-slate-100 min-h-screen">

<header class="bg-white shadow-sm">

    <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">

        <div>
            <h1 class="text-xl font-bold text-slate-800">
                Sunrise Dental Clinic
            </h1>

            <p class="text-sm text-slate-500">
                Appointment Management
            </p>
        </div>

        <div class="flex items-center gap-4">

            <a href="<%= request.getContextPath() %>/dashboard"
               class="text-blue-600 hover:text-blue-800 font-medium">
                Dashboard
            </a>

            <a href="<%= request.getContextPath() %>/appointments/new"
               class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">
                New Appointment
            </a>

        </div>

    </div>

</header>


<main class="max-w-7xl mx-auto p-6">

    <div class="bg-white rounded-xl shadow-sm p-6">

        <h2 class="text-2xl font-bold text-slate-800">
            Search Appointments
        </h2>

        <p class="text-slate-500 mt-1 mb-6">
            Search using appointment number, patient name, or contact number.
        </p>


        <% if (error != null) { %>

        <div class="bg-red-100 text-red-700 px-4 py-3 rounded-lg mb-5">
            <%= error %>
        </div>

        <% } %>


        <form method="post"
              action="<%= request.getContextPath() %>/appointments/search">

            <div class="grid grid-cols-1 md:grid-cols-4 gap-4">

                <div>

                    <label class="block text-sm font-medium text-slate-700 mb-2">
                        Search By
                    </label>

                    <select name="searchType"
                            required
                            class="w-full border border-slate-300 rounded-lg px-4 py-2">

                        <option value="appointmentNumber"
                                <%= "appointmentNumber".equals(selectedType) ? "selected" : "" %>>
                            Appointment Number
                        </option>

                        <option value="patientName"
                                <%= "patientName".equals(selectedType) ? "selected" : "" %>>
                            Patient Name
                        </option>

                        <option value="contactNumber"
                                <%= "contactNumber".equals(selectedType) ? "selected" : "" %>>
                            Contact Number
                        </option>

                    </select>

                </div>


                <div class="md:col-span-2">

                    <label class="block text-sm font-medium text-slate-700 mb-2">
                        Search Value
                    </label>

                    <input type="text"
                           name="searchValue"
                           required
                           value="<%= searchValue != null ? searchValue : "" %>"
                           placeholder="Enter search value"
                           class="w-full border border-slate-300 rounded-lg px-4 py-2">

                </div>


                <div class="flex items-end">

                    <button type="submit"
                            class="w-full bg-blue-600 text-white px-5 py-2 rounded-lg hover:bg-blue-700">
                        Search
                    </button>

                </div>

            </div>

        </form>

    </div>


    <% if (searched != null && searched) { %>

    <div class="bg-white rounded-xl shadow-sm mt-6 overflow-hidden">

        <div class="px-6 py-5 border-b border-slate-200">

            <h3 class="text-lg font-semibold text-slate-800">
                Search Results
            </h3>

        </div>


        <% if (results != null && !results.isEmpty()) { %>

        <div class="overflow-x-auto">

            <table class="min-w-full">

                <thead class="bg-slate-50">

                <tr>

                    <th class="text-left px-6 py-3 text-xs font-semibold text-slate-500 uppercase">
                        Appointment No.
                    </th>

                    <th class="text-left px-6 py-3 text-xs font-semibold text-slate-500 uppercase">
                        Patient
                    </th>

                    <th class="text-left px-6 py-3 text-xs font-semibold text-slate-500 uppercase">
                        Contact
                    </th>

                    <th class="text-left px-6 py-3 text-xs font-semibold text-slate-500 uppercase">
                        Dentist
                    </th>

                    <th class="text-left px-6 py-3 text-xs font-semibold text-slate-500 uppercase">
                        Treatment
                    </th>

                    <th class="text-left px-6 py-3 text-xs font-semibold text-slate-500 uppercase">
                        Date
                    </th>

                    <th class="text-left px-6 py-3 text-xs font-semibold text-slate-500 uppercase">
                        Time
                    </th>

                    <th class="text-left px-6 py-3 text-xs font-semibold text-slate-500 uppercase">
                        Status
                    </th>

                    <th class="text-left px-6 py-3 text-xs font-semibold text-slate-500 uppercase">
                        Action
                    </th>

                </tr>

                </thead>


                <tbody class="divide-y divide-slate-200">

                <% for (AppointmentDetails appointment : results) { %>

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
                        <%= appointment.getAppointmentDate() %>
                    </td>

                    <td class="px-6 py-4 text-slate-700">
                        <%= appointment.getAppointmentTime() %>
                    </td>

                    <td class="px-6 py-4">

                        <% if ("SCHEDULED".equals(appointment.getStatus())) { %>

                        <span class="bg-blue-100 text-blue-700 px-3 py-1 rounded-full text-xs font-medium">
                            Scheduled
                        </span>

                        <% } else if ("CANCELLED".equals(appointment.getStatus())) { %>

                        <span class="bg-red-100 text-red-700 px-3 py-1 rounded-full text-xs font-medium">
                            Cancelled
                        </span>

                        <% } else { %>

                        <span class="bg-slate-100 text-slate-700 px-3 py-1 rounded-full text-xs font-medium">
                            <%= appointment.getStatus() %>
                        </span>

                        <% } %>

                    </td>

                    <td class="px-6 py-4">

                        <a href="<%= request.getContextPath() %>/appointments/view?id=<%= appointment.getAppointmentId() %>"
                           class="text-blue-600 hover:text-blue-800 font-medium">
                            View Details
                        </a>

                    </td>

                </tr>

                <% } %>

                </tbody>

            </table>

        </div>

        <% } else { %>

        <div class="px-6 py-10 text-center">

            <p class="text-slate-500">
                No appointments were found for your search.
            </p>

        </div>

        <% } %>

    </div>

    <% } %>

</main>

</body>

</html>