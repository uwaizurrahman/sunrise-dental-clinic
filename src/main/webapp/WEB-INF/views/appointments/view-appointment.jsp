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
</head>

<body class="bg-slate-100 min-h-screen">

<header class="bg-white shadow-sm">

    <div class="max-w-5xl mx-auto px-6 py-4 flex justify-between items-center">

        <div>
            <h1 class="text-xl font-bold text-slate-800">
                Sunrise Dental Clinic
            </h1>

            <p class="text-sm text-slate-500">
                Appointment Details
            </p>
        </div>

        <div class="flex gap-4">

            <a href="<%= request.getContextPath() %>/appointments/search"
               class="text-blue-600 hover:text-blue-800 font-medium">
                Back to Search
            </a>

            <a href="<%= request.getContextPath() %>/dashboard"
               class="text-slate-600 hover:text-slate-800 font-medium">
                Dashboard
            </a>

        </div>

    </div>

</header>


<main class="max-w-5xl mx-auto p-6">

    <div class="bg-white rounded-xl shadow-sm p-6">

        <!-- Appointment heading -->

        <div class="flex flex-col md:flex-row
                    md:items-center md:justify-between
                    gap-4 mb-6">

            <div>

                <h2 class="text-2xl font-bold text-slate-800">

                    Appointment

                    <span class="text-blue-600">
                        <%= appointment.getAppointmentNumber() %>
                    </span>

                </h2>

                <p class="text-slate-500 mt-1">
                    Complete patient and appointment information
                </p>

            </div>


            <!-- Status badge -->

            <div>

                <% if ("SCHEDULED".equals(appointment.getStatus())) { %>

                <span class="inline-block bg-blue-100
                                 text-blue-700 px-4 py-2
                                 rounded-full text-sm font-medium">

                        Scheduled

                    </span>

                <% } else if ("COMPLETED".equals(appointment.getStatus())) { %>

                <span class="inline-block bg-green-100
                                 text-green-700 px-4 py-2
                                 rounded-full text-sm font-medium">

                        Completed

                    </span>

                <% } else if ("CANCELLED".equals(appointment.getStatus())) { %>

                <span class="inline-block bg-red-100
                                 text-red-700 px-4 py-2
                                 rounded-full text-sm font-medium">

                        Cancelled

                    </span>

                <% } else { %>

                <span class="inline-block bg-slate-100
                                 text-slate-700 px-4 py-2
                                 rounded-full text-sm font-medium">

                        <%= appointment.getStatus() %>

                    </span>

                <% } %>

            </div>

        </div>


        <!-- Information -->

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">


            <!-- Patient -->

            <div class="border border-slate-200 rounded-xl p-5">

                <h3 class="font-semibold text-lg text-slate-800 mb-5">
                    Patient Information
                </h3>


                <div class="space-y-4">

                    <div>

                        <p class="text-sm text-slate-500">
                            Patient Name
                        </p>

                        <p class="font-medium text-slate-800">
                            <%= appointment.getPatientName() %>
                        </p>

                    </div>


                    <div>

                        <p class="text-sm text-slate-500">
                            Contact Number
                        </p>

                        <p class="font-medium text-slate-800">
                            <%= appointment.getContactNumber() %>
                        </p>

                    </div>


                    <div>

                        <p class="text-sm text-slate-500">
                            Address
                        </p>

                        <p class="font-medium text-slate-800">
                            <%= appointment.getAddress() %>
                        </p>

                    </div>

                </div>

            </div>


            <!-- Appointment -->

            <div class="border border-slate-200 rounded-xl p-5">

                <h3 class="font-semibold text-lg text-slate-800 mb-5">
                    Appointment Information
                </h3>


                <div class="space-y-4">

                    <div>

                        <p class="text-sm text-slate-500">
                            Dentist
                        </p>

                        <p class="font-medium text-slate-800">
                            <%= appointment.getDentistName() %>
                        </p>

                        <p class="text-sm text-slate-500">
                            <%= appointment.getSpecialization() %>
                        </p>

                    </div>


                    <div>

                        <p class="text-sm text-slate-500">
                            Treatment
                        </p>

                        <p class="font-medium text-slate-800">
                            <%= appointment.getTreatmentName() %>
                        </p>

                        <p class="text-sm text-slate-500">
                            Rs. <%= appointment.getTreatmentCost() %>
                        </p>

                    </div>


                    <div class="grid grid-cols-2 gap-4">

                        <div>

                            <p class="text-sm text-slate-500">
                                Appointment Date
                            </p>

                            <p class="font-medium text-slate-800">
                                <%= appointment.getAppointmentDate() %>
                            </p>

                        </div>


                        <div>

                            <p class="text-sm text-slate-500">
                                Appointment Time
                            </p>

                            <p class="font-medium text-slate-800">
                                <%= appointment.getAppointmentTime() %>
                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- Actions -->

        <div class="mt-8 border-t border-slate-200 pt-6">

            <div class="flex flex-wrap justify-end gap-3">


                <!-- Back -->

                <a href="<%= request.getContextPath() %>/appointments/search"
                   class="border border-slate-300 text-slate-700
                          px-5 py-3 rounded-lg hover:bg-slate-50">

                    Back

                </a>


                <!-- Only scheduled appointments can change status -->

                <% if ("SCHEDULED".equals(appointment.getStatus())) { %>


                <!-- Complete -->

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
                            class="bg-emerald-600 text-white
                                       px-5 py-3 rounded-lg
                                       hover:bg-emerald-700">

                        Mark Completed

                    </button>

                </form>


                <!-- Cancel -->

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
                            class="bg-red-600 text-white
                                       px-5 py-3 rounded-lg
                                       hover:bg-red-700">

                        Cancel Appointment

                    </button>

                </form>


                <% } %>


                <!-- Bill - cancelled appointments cannot be billed -->

                <% if (!"CANCELLED".equals(appointment.getStatus())) { %>

                <a href="<%= request.getContextPath() %>/billing/create?appointmentId=<%= appointment.getAppointmentId() %>"
                   class="bg-green-600 text-white
                              px-6 py-3 rounded-lg
                              hover:bg-green-700">

                    Generate Bill

                </a>

                <% } %>


            </div>

        </div>

    </div>

</main>

</body>
</html>