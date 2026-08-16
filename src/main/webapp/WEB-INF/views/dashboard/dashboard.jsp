<%@ page import="com.sunriseclinic.sunrisedentalclinic.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User loggedUser =
            (User) session.getAttribute("loggedUser");

    Object totalPatients =
            request.getAttribute("totalPatients");

    Object todayAppointments =
            request.getAttribute("todayAppointments");

    Object completedAppointments =
            request.getAttribute("completedAppointments");

    Object totalRevenue =
            request.getAttribute("totalRevenue");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Dashboard | Sunrise Dental Clinic</title>

    <script src="https://cdn.tailwindcss.com"></script>

</head>


<body class="bg-slate-100 min-h-screen">


<!-- ================= HEADER ================= -->

<header class="bg-white shadow-sm">

    <div class="max-w-7xl mx-auto px-6 py-4">

        <div class="flex flex-col md:flex-row
                    md:items-center
                    md:justify-between
                    gap-4">


            <!-- Clinic title -->

            <div>

                <h1 class="text-2xl font-bold text-slate-800">
                    Sunrise Dental Clinic
                </h1>

                <p class="text-sm text-slate-500 mt-1">
                    Dental Appointment & Patient Management System
                </p>

            </div>


            <!-- User / Logout -->

            <div class="flex items-center gap-4">

                <div class="text-right">

                    <p class="text-sm text-slate-500">
                        Logged in as
                    </p>

                    <p class="font-semibold text-slate-800">

                        <%
                            if (loggedUser != null) {
                        %>

                        <%= loggedUser.getUsername() %>

                        <span class="text-xs text-slate-500">
                            (<%= loggedUser.getRole() %>)
                        </span>

                        <%
                        } else {
                        %>

                        User

                        <%
                            }
                        %>

                    </p>

                </div>


                <a href="<%= request.getContextPath() %>/logout"
                   class="bg-red-600 text-white
                          px-4 py-2
                          rounded-lg
                          hover:bg-red-700
                          transition">

                    Logout

                </a>

            </div>

        </div>

    </div>

</header>


<!-- ================= MAIN CONTENT ================= -->

<main class="max-w-7xl mx-auto px-6 py-8">


    <!-- Welcome section -->

    <div class="mb-8">

        <h2 class="text-3xl font-bold text-slate-800">

            Welcome,

            <%
                if (loggedUser != null) {
            %>

            <%= loggedUser.getUsername() %>

            <%
            } else {
            %>

            Staff

            <%
                }
            %>

        </h2>

        <p class="text-slate-500 mt-2">
            Manage patients, appointments, billing and clinic information
            from the dashboard.
        </p>

    </div>


    <!-- ================= STATISTICS ================= -->

    <div class="grid grid-cols-1
                sm:grid-cols-2
                lg:grid-cols-4
                gap-6">


        <!-- Total Patients -->

        <div class="bg-white
                    rounded-xl
                    shadow-sm
                    border border-slate-200
                    p-6">

            <div class="flex justify-between items-start">

                <div>

                    <p class="text-sm font-medium text-slate-500">
                        Total Patients
                    </p>

                    <p class="text-3xl font-bold
                              text-slate-800
                              mt-2">

                        <%= totalPatients != null
                                ? totalPatients
                                : 0 %>

                    </p>

                </div>


                <div class="bg-blue-100
                            text-blue-700
                            w-12 h-12
                            rounded-xl
                            flex items-center
                            justify-center
                            text-xl">

                    👥

                </div>

            </div>

        </div>


        <!-- Today's Appointments -->

        <div class="bg-white
                    rounded-xl
                    shadow-sm
                    border border-slate-200
                    p-6">

            <div class="flex justify-between items-start">

                <div>

                    <p class="text-sm font-medium text-slate-500">
                        Today's Appointments
                    </p>

                    <p class="text-3xl font-bold
                              text-blue-600
                              mt-2">

                        <%= todayAppointments != null
                                ? todayAppointments
                                : 0 %>

                    </p>

                </div>


                <div class="bg-indigo-100
                            text-indigo-700
                            w-12 h-12
                            rounded-xl
                            flex items-center
                            justify-center
                            text-xl">

                    📅

                </div>

            </div>

        </div>


        <!-- Completed Appointments -->

        <div class="bg-white
                    rounded-xl
                    shadow-sm
                    border border-slate-200
                    p-6">

            <div class="flex justify-between items-start">

                <div>

                    <p class="text-sm font-medium text-slate-500">
                        Completed Appointments
                    </p>

                    <p class="text-3xl font-bold
                              text-emerald-600
                              mt-2">

                        <%= completedAppointments != null
                                ? completedAppointments
                                : 0 %>

                    </p>

                </div>


                <div class="bg-emerald-100
                            text-emerald-700
                            w-12 h-12
                            rounded-xl
                            flex items-center
                            justify-center
                            text-xl">

                    ✓

                </div>

            </div>

        </div>


        <!-- Total Revenue -->

        <div class="bg-white
                    rounded-xl
                    shadow-sm
                    border border-slate-200
                    p-6">

            <div class="flex justify-between items-start">

                <div>

                    <p class="text-sm font-medium text-slate-500">
                        Total Revenue
                    </p>

                    <p class="text-2xl font-bold
                              text-purple-600
                              mt-2">

                        Rs.
                        <%= totalRevenue != null
                                ? totalRevenue
                                : "0.00" %>

                    </p>

                </div>


                <div class="bg-purple-100
                            text-purple-700
                            w-12 h-12
                            rounded-xl
                            flex items-center
                            justify-center
                            text-xl">

                    Rs

                </div>

            </div>

        </div>

    </div>


    <!-- ================= QUICK ACTIONS ================= -->

    <div class="mt-10">

        <div class="mb-5">

            <h3 class="text-xl font-bold text-slate-800">
                Quick Actions
            </h3>

            <p class="text-sm text-slate-500 mt-1">
                Select an action to manage clinic operations.
            </p>

        </div>


        <div class="grid grid-cols-1
                    md:grid-cols-2
                    lg:grid-cols-3
                    gap-6">


            <!-- Register Appointment -->

            <a href="<%= request.getContextPath() %>/appointments/new"
               class="bg-white
                      border border-slate-200
                      rounded-xl
                      shadow-sm
                      p-6
                      hover:shadow-md
                      hover:border-blue-300
                      transition">

                <div class="flex items-start gap-4">

                    <div class="bg-blue-100
                                text-blue-700
                                w-12 h-12
                                rounded-xl
                                flex items-center
                                justify-center
                                text-xl">

                        +

                    </div>


                    <div>

                        <h4 class="text-lg
                                   font-semibold
                                   text-slate-800">

                            Register New Appointment

                        </h4>

                        <p class="text-sm
                                  text-slate-500
                                  mt-1">

                            Register patient information and create
                            a new dental appointment.

                        </p>

                    </div>

                </div>

            </a>


            <!-- Search Appointments -->

            <a href="<%= request.getContextPath() %>/appointments/search"
               class="bg-white
                      border border-slate-200
                      rounded-xl
                      shadow-sm
                      p-6
                      hover:shadow-md
                      hover:border-slate-400
                      transition">

                <div class="flex items-start gap-4">

                    <div class="bg-slate-100
                                text-slate-700
                                w-12 h-12
                                rounded-xl
                                flex items-center
                                justify-center
                                text-xl">

                        🔍

                    </div>


                    <div>

                        <h4 class="text-lg
                                   font-semibold
                                   text-slate-800">

                            Search Appointments

                        </h4>

                        <p class="text-sm
                                  text-slate-500
                                  mt-1">

                            Search using appointment number,
                            patient name or contact number.

                        </p>

                    </div>

                </div>

            </a>


            <!-- Help -->

            <a href="<%= request.getContextPath() %>/help"
               class="bg-white
                      border border-slate-200
                      rounded-xl
                      shadow-sm
                      p-6
                      hover:shadow-md
                      hover:border-purple-300
                      transition">

                <div class="flex items-start gap-4">

                    <div class="bg-purple-100
                                text-purple-700
                                w-12 h-12
                                rounded-xl
                                flex items-center
                                justify-center
                                text-xl">

                        ?

                    </div>


                    <div>

                        <h4 class="text-lg
                                   font-semibold
                                   text-slate-800">

                            Help & Instructions

                        </h4>

                        <p class="text-sm
                                  text-slate-500
                                  mt-1">

                            View step-by-step instructions for
                            using the clinic management system.

                        </p>

                    </div>

                </div>

            </a>

            <a href="<%= request.getContextPath() %>/reports"
               class="bg-white
                      border border-slate-200
                      rounded-xl
                      shadow-sm
                      p-6
                      hover:shadow-md
                      hover:border-emerald-300
                      transition">

                <div class="flex items-start gap-4">

                        <div class="bg-emerald-100
                        text-emerald-700
                        w-12 h-12
                        rounded-xl
                        flex items-center
                        justify-center
                        text-xl">

                            📊

                        </div>

                        <div>

                            <h4 class="text-lg font-semibold text-slate-800">
                                Reports
                            </h4>

                            <p class="text-sm text-slate-500 mt-1">
                                View daily appointments and clinic revenue reports.
                            </p>

                        </div>

                </div>

            </a>

        </div>

    </div>


    <!-- ================= SYSTEM INFORMATION ================= -->

    <div class="mt-10
                bg-white
                border border-slate-200
                rounded-xl
                shadow-sm
                p-6">

        <h3 class="text-lg
                   font-semibold
                   text-slate-800">

            System Information

        </h3>


        <div class="grid grid-cols-1
                    md:grid-cols-3
                    gap-6
                    mt-5">

            <div>

                <p class="text-sm text-slate-500">
                    System
                </p>

                <p class="font-medium text-slate-800 mt-1">
                    Sunrise Dental Clinic
                </p>

            </div>


            <div>

                <p class="text-sm text-slate-500">
                    Current Role
                </p>

                <p class="font-medium text-slate-800 mt-1">

                    <%
                        if (loggedUser != null) {
                    %>

                    <%= loggedUser.getRole() %>

                    <%
                    } else {
                    %>

                    STAFF

                    <%
                        }
                    %>

                </p>

            </div>


            <div>

                <p class="text-sm text-slate-500">
                    System Status
                </p>

                <p class="font-medium
                          text-emerald-600
                          mt-1">

                    ● Operational

                </p>

            </div>

        </div>

    </div>


</main>


<!-- ================= FOOTER ================= -->

<footer class="mt-10">

    <div class="max-w-7xl mx-auto
                px-6 py-6
                border-t border-slate-200">

        <p class="text-center
                  text-sm
                  text-slate-500">

            Sunrise Dental Clinic
            &copy; 2026

        </p>

    </div>

</footer>


</body>

</html>