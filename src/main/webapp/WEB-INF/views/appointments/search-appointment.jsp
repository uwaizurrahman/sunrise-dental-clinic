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

</head>

<body class="bg-slate-50 text-slate-800 min-h-screen">

<div class="min-h-screen lg:flex">

    <!-- Sidebar -->

    <aside class="hidden lg:flex lg:w-72 lg:flex-col bg-slate-950 text-white fixed inset-y-0 left-0">

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
               class="flex items-center gap-3 bg-cyan-500/10 text-cyan-300 px-4 py-3 rounded-xl font-medium">

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

    <div class="flex-1 lg:ml-72">

        <header class="sticky top-0 z-30 bg-white/90 backdrop-blur border-b border-slate-200">

            <div class="px-5 sm:px-8 py-4 flex items-center justify-between">

                <div>

                    <p class="text-sm text-slate-500">
                        Appointment Management
                    </p>

                    <h2 class="text-xl font-bold text-slate-900">
                        Search Appointments
                    </h2>

                </div>


                <a href="<%= request.getContextPath() %>/appointments/new"
                   class="hidden sm:inline-flex bg-slate-950 hover:bg-slate-800 text-white px-4 py-2.5 rounded-xl text-sm font-semibold transition">

                    + New Appointment

                </a>

            </div>

        </header>


        <main class="p-5 sm:p-8">

            <div class="max-w-7xl mx-auto">


                <!-- Heading -->

                <div class="mb-8">

                    <div class="inline-flex items-center gap-2 text-blue-700 bg-blue-50 px-3 py-1.5 rounded-full text-sm font-medium">

                        Patient Lookup

                    </div>


                    <h1 class="text-3xl sm:text-4xl font-bold text-slate-950 mt-4">

                        Find an appointment

                    </h1>


                    <p class="text-slate-500 mt-2 max-w-2xl">

                        Search clinic records using an appointment number,
                        patient name, or contact number.

                    </p>

                </div>


                <!-- Search Card -->

                <section class="bg-white border border-slate-200 rounded-3xl shadow-soft p-6 sm:p-8">


                    <% if (error != null) { %>

                    <div class="mb-6 bg-red-50 border border-red-200 text-red-700 px-5 py-4 rounded-2xl">

                        <p class="font-semibold">
                            Search error
                        </p>

                        <p class="text-sm mt-1">
                            <%= error %>
                        </p>

                    </div>

                    <% } %>


                    <form method="post"
                          action="<%= request.getContextPath() %>/appointments/search">

                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-5">

                            <!-- Search Type -->

                            <div class="lg:col-span-4">

                                <label for="searchType"
                                       class="block text-sm font-semibold text-slate-700 mb-2">

                                    Search By

                                </label>


                                <select id="searchType"
                                        name="searchType"
                                        required
                                        class="w-full px-4 py-3.5 bg-white border border-slate-300 rounded-xl outline-none focus:ring-4 focus:ring-cyan-500/10 focus:border-cyan-500 transition">

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


                            <!-- Search Input -->

                            <div class="lg:col-span-6">

                                <label for="searchValue"
                                       class="block text-sm font-semibold text-slate-700 mb-2">

                                    Search Value

                                </label>


                                <div class="relative">

                                    <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-slate-400">

                                        <svg xmlns="http://www.w3.org/2000/svg"
                                             class="w-5 h-5"
                                             fill="none"
                                             viewBox="0 0 24 24"
                                             stroke="currentColor">

                                            <path stroke-linecap="round"
                                                  stroke-linejoin="round"
                                                  stroke-width="2"
                                                  d="m21 21-4.35-4.35m1.35-5.65a7 7 0 1 1-14 0 7 7 0 0 1 14 0z"/>

                                        </svg>

                                    </div>


                                    <input type="text"
                                           id="searchValue"
                                           name="searchValue"
                                           required
                                           value="<%= searchValue != null ? searchValue : "" %>"
                                           placeholder="Enter search value"
                                           class="w-full pl-12 pr-4 py-3.5 bg-white border border-slate-300 rounded-xl outline-none focus:ring-4 focus:ring-cyan-500/10 focus:border-cyan-500 transition">

                                </div>

                            </div>


                            <!-- Button -->

                            <div class="lg:col-span-2 flex items-end">

                                <button type="submit"
                                        class="w-full bg-slate-950 hover:bg-slate-800 text-white px-5 py-3.5 rounded-xl font-semibold shadow-lg shadow-slate-900/10 transition">

                                    Search

                                </button>

                            </div>

                        </div>

                    </form>


                    <div class="mt-5 bg-slate-50 border border-slate-200 rounded-xl px-4 py-3">

                        <p class="text-xs text-slate-500">

                            Patient-name search supports partial names. Appointment number
                            and contact number use exact matching.

                        </p>

                    </div>

                </section>


                <!-- Results -->

                <% if (searched != null && searched) { %>

                <section class="mt-8 bg-white border border-slate-200 rounded-3xl shadow-soft overflow-hidden">

                    <div class="px-6 sm:px-8 py-6 border-b border-slate-200 flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">

                        <div>

                            <h3 class="text-xl font-semibold text-slate-900">
                                Search Results
                            </h3>

                            <p class="text-sm text-slate-500 mt-1">

                                <%
                                    if (results != null) {
                                %>

                                <%= results.size() %> appointment(s) found

                                <% } else { %>

                                0 appointments found

                                <% } %>

                            </p>

                        </div>


                        <% if (searchValue != null) { %>

                        <div class="text-sm bg-slate-100 text-slate-600 px-3 py-2 rounded-lg">

                            Search:
                            <span class="font-semibold text-slate-800">
                                <%= searchValue %>
                            </span>

                        </div>

                        <% } %>

                    </div>


                    <% if (results != null && !results.isEmpty()) { %>

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
                                    Schedule
                                </th>

                                <th class="text-left px-6 py-4 text-xs font-semibold text-slate-500 uppercase tracking-wider">
                                    Status
                                </th>

                                <th class="text-right px-6 py-4 text-xs font-semibold text-slate-500 uppercase tracking-wider">
                                    Action
                                </th>

                            </tr>

                            </thead>


                            <tbody class="divide-y divide-slate-200">

                            <% for (AppointmentDetails appointment : results) { %>

                            <tr class="hover:bg-slate-50 transition">


                                <!-- Appointment -->

                                <td class="px-6 py-5">

                                    <p class="font-semibold text-slate-900">
                                        <%= appointment.getAppointmentNumber() %>
                                    </p>

                                </td>


                                <!-- Patient -->

                                <td class="px-6 py-5">

                                    <p class="font-medium text-slate-800">
                                        <%= appointment.getPatientName() %>
                                    </p>

                                    <p class="text-sm text-slate-500 mt-1">
                                        <%= appointment.getContactNumber() %>
                                    </p>

                                </td>


                                <!-- Dentist -->

                                <td class="px-6 py-5">

                                    <p class="text-slate-800">
                                        <%= appointment.getDentistName() %>
                                    </p>

                                </td>


                                <!-- Treatment -->

                                <td class="px-6 py-5">

                                    <p class="text-slate-800">
                                        <%= appointment.getTreatmentName() %>
                                    </p>

                                </td>


                                <!-- Schedule -->

                                <td class="px-6 py-5 whitespace-nowrap">

                                    <p class="text-slate-800">
                                        <%= appointment.getAppointmentDate() %>
                                    </p>

                                    <p class="text-sm text-slate-500 mt-1">
                                        <%= appointment.getAppointmentTime() %>
                                    </p>

                                </td>


                                <!-- Status -->

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

                                    <span class="inline-flex items-center bg-slate-100 text-slate-700 px-3 py-1.5 rounded-full text-xs font-semibold">

                                        <%= appointment.getStatus() %>

                                    </span>

                                    <% } %>

                                </td>


                                <!-- Action -->

                                <td class="px-6 py-5 text-right">

                                    <a href="<%= request.getContextPath() %>/appointments/view?id=<%= appointment.getAppointmentId() %>"
                                       class="inline-flex items-center justify-center border border-slate-300 hover:border-cyan-500 hover:text-cyan-700 text-slate-700 px-4 py-2 rounded-lg text-sm font-semibold transition">

                                        View Details

                                    </a>

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
                                      d="m21 21-4.35-4.35m1.35-5.65a7 7 0 1 1-14 0 7 7 0 0 1 14 0z"/>

                            </svg>

                        </div>


                        <h4 class="font-semibold text-slate-900 mt-4">
                            No appointments found
                        </h4>

                        <p class="text-sm text-slate-500 mt-2">
                            Try checking the search value or using another search method.
                        </p>

                    </div>

                    <% } %>

                </section>

                <% } %>


            </div>

        </main>

    </div>

</div>

</body>

</html>