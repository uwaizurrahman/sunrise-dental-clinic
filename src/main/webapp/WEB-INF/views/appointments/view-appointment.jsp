<%@ page import="com.sunriseclinic.sunrisedentalclinic.model.AppointmentDetails" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    AppointmentDetails appointment =
            (AppointmentDetails) request.getAttribute("appointment");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Appointment Details | Sunrise Dental Clinic</title>

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
                        Appointment Details
                    </h2>
                </div>

                <a href="<%= request.getContextPath() %>/appointments/search"
                   class="text-sm font-medium text-slate-600 hover:text-slate-900">

                    Back to Search

                </a>

            </div>

        </header>


        <main class="p-5 sm:p-8">

            <div class="max-w-6xl mx-auto">


                <!-- Top Summary -->

                <section class="bg-slate-950 text-white rounded-3xl p-7 sm:p-8 shadow-soft">

                    <div class="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-6">

                        <div>

                            <p class="text-cyan-300 text-sm font-semibold uppercase tracking-wider">
                                Appointment Record
                            </p>

                            <h1 class="text-3xl sm:text-4xl font-bold mt-2">
                                <%= appointment.getAppointmentNumber() %>
                            </h1>

                            <p class="text-slate-400 mt-3">
                                <%= appointment.getPatientName() %>
                                •
                                <%= appointment.getAppointmentDate() %>
                                at
                                <%= appointment.getAppointmentTime() %>
                            </p>

                        </div>


                        <div>

                            <% if ("SCHEDULED".equals(appointment.getStatus())) { %>

                            <span class="inline-flex items-center gap-2 bg-blue-500/10 border border-blue-400/20 text-blue-300 px-4 py-2 rounded-full text-sm font-semibold">

                                <span class="w-2 h-2 rounded-full bg-blue-400"></span>
                                Scheduled

                            </span>

                            <% } else if ("COMPLETED".equals(appointment.getStatus())) { %>

                            <span class="inline-flex items-center gap-2 bg-emerald-500/10 border border-emerald-400/20 text-emerald-300 px-4 py-2 rounded-full text-sm font-semibold">

                                <span class="w-2 h-2 rounded-full bg-emerald-400"></span>
                                Completed

                            </span>

                            <% } else if ("CANCELLED".equals(appointment.getStatus())) { %>

                            <span class="inline-flex items-center gap-2 bg-red-500/10 border border-red-400/20 text-red-300 px-4 py-2 rounded-full text-sm font-semibold">

                                <span class="w-2 h-2 rounded-full bg-red-400"></span>
                                Cancelled

                            </span>

                            <% } else { %>

                            <span class="inline-flex items-center bg-slate-800 text-slate-300 px-4 py-2 rounded-full text-sm font-semibold">

                                <%= appointment.getStatus() %>

                            </span>

                            <% } %>

                        </div>

                    </div>

                </section>


                <!-- Information Grid -->

                <div class="grid grid-cols-1 xl:grid-cols-2 gap-6 mt-7">


                    <!-- Patient Card -->

                    <section class="bg-white border border-slate-200 rounded-3xl shadow-soft p-6 sm:p-8">

                        <div class="flex items-center gap-3 mb-7">

                            <div class="w-11 h-11 rounded-xl bg-blue-50 text-blue-600 flex items-center justify-center">

                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="w-5 h-5"
                                     fill="none"
                                     viewBox="0 0 24 24"
                                     stroke="currentColor">

                                    <path stroke-linecap="round"
                                          stroke-linejoin="round"
                                          stroke-width="2"
                                          d="M20 21a8 8 0 0 0-16 0m8-10a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/>

                                </svg>

                            </div>

                            <div>

                                <h3 class="text-xl font-semibold text-slate-900">
                                    Patient Information
                                </h3>

                                <p class="text-sm text-slate-500">
                                    Personal and contact details
                                </p>

                            </div>

                        </div>


                        <div class="space-y-5">

                            <div class="pb-4 border-b border-slate-100">

                                <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider">
                                    Patient Name
                                </p>

                                <p class="text-lg font-semibold text-slate-900 mt-1">
                                    <%= appointment.getPatientName() %>
                                </p>

                            </div>


                            <div class="pb-4 border-b border-slate-100">

                                <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider">
                                    Contact Number
                                </p>

                                <p class="text-slate-800 mt-1">
                                    <%= appointment.getContactNumber() %>
                                </p>

                            </div>


                            <div>

                                <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider">
                                    Address
                                </p>

                                <p class="text-slate-800 mt-1 leading-relaxed">
                                    <%= appointment.getAddress() %>
                                </p>

                            </div>

                        </div>

                    </section>


                    <!-- Appointment Card -->

                    <section class="bg-white border border-slate-200 rounded-3xl shadow-soft p-6 sm:p-8">

                        <div class="flex items-center gap-3 mb-7">

                            <div class="w-11 h-11 rounded-xl bg-cyan-50 text-cyan-600 flex items-center justify-center">

                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="w-5 h-5"
                                     fill="none"
                                     viewBox="0 0 24 24"
                                     stroke="currentColor">

                                    <path stroke-linecap="round"
                                          stroke-linejoin="round"
                                          stroke-width="2"
                                          d="M8 7V3m8 4V3M5 11h14M5 5h14v16H5z"/>

                                </svg>

                            </div>

                            <div>

                                <h3 class="text-xl font-semibold text-slate-900">
                                    Appointment Information
                                </h3>

                                <p class="text-sm text-slate-500">
                                    Clinical and schedule details
                                </p>

                            </div>

                        </div>


                        <div class="space-y-5">

                            <div class="pb-4 border-b border-slate-100">

                                <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider">
                                    Dentist
                                </p>

                                <p class="text-lg font-semibold text-slate-900 mt-1">
                                    <%= appointment.getDentistName() %>
                                </p>

                                <p class="text-sm text-slate-500 mt-1">
                                    <%= appointment.getSpecialization() %>
                                </p>

                            </div>


                            <div class="pb-4 border-b border-slate-100">

                                <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider">
                                    Treatment
                                </p>

                                <div class="flex items-center justify-between gap-4 mt-1">

                                    <p class="font-medium text-slate-900">
                                        <%= appointment.getTreatmentName() %>
                                    </p>

                                    <p class="font-semibold text-emerald-600">
                                        Rs. <%= appointment.getTreatmentCost() %>
                                    </p>

                                </div>

                            </div>


                            <div class="grid grid-cols-2 gap-5">

                                <div>

                                    <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider">
                                        Date
                                    </p>

                                    <p class="text-slate-900 mt-1">
                                        <%= appointment.getAppointmentDate() %>
                                    </p>

                                </div>


                                <div>

                                    <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider">
                                        Time
                                    </p>

                                    <p class="text-slate-900 mt-1">
                                        <%= appointment.getAppointmentTime() %>
                                    </p>

                                </div>

                            </div>

                        </div>

                    </section>

                </div>


                <!-- Actions -->

                <section class="bg-white border border-slate-200 rounded-3xl shadow-soft p-6 sm:p-8 mt-7">

                    <div class="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-6">

                        <div>

                            <h3 class="text-lg font-semibold text-slate-900">
                                Appointment Actions
                            </h3>

                            <p class="text-sm text-slate-500 mt-1">
                                Manage status or generate the patient's bill.
                            </p>

                        </div>


                        <div class="flex flex-wrap gap-3">


                            <a href="<%= request.getContextPath() %>/appointments/search"
                               class="px-5 py-3 border border-slate-300 text-slate-700 rounded-xl font-semibold hover:bg-slate-50 transition">

                                Back

                            </a>


                            <% if ("SCHEDULED".equals(appointment.getStatus())) { %>


                            <form method="post"
                                  action="<%= request.getContextPath() %>/appointments/status">

                                <input type="hidden"
                                       name="appointmentId"
                                       value="<%= appointment.getAppointmentId() %>">

                                <input type="hidden"
                                       name="status"
                                       value="COMPLETED">

                                <button type="submit"
                                        onclick="return confirm('Mark this appointment as completed?');"
                                        class="px-5 py-3 bg-emerald-600 hover:bg-emerald-700 text-white rounded-xl font-semibold transition">

                                    Mark Completed

                                </button>

                            </form>


                            <form method="post"
                                  action="<%= request.getContextPath() %>/appointments/status"
                                  onsubmit="return confirm('Are you sure you want to cancel this appointment?');">

                                <input type="hidden"
                                       name="appointmentId"
                                       value="<%= appointment.getAppointmentId() %>">

                                <input type="hidden"
                                       name="status"
                                       value="CANCELLED">

                                <button type="submit"
                                        class="px-5 py-3 bg-red-50 hover:bg-red-100 text-red-700 border border-red-200 rounded-xl font-semibold transition">

                                    Cancel Appointment

                                </button>

                            </form>


                            <% } %>


                            <% if (!"CANCELLED".equals(appointment.getStatus())) { %>

                            <a href="<%= request.getContextPath() %>/billing/create?appointmentId=<%= appointment.getAppointmentId() %>"
                               class="px-6 py-3 bg-slate-950 hover:bg-slate-800 text-white rounded-xl font-semibold shadow-lg shadow-slate-900/10 transition">

                                Generate Bill

                            </a>

                            <% } %>


                        </div>

                    </div>

                </section>


            </div>

        </main>

    </div>

</div>

</body>

</html>