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

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    boxShadow: {
                        soft: '0 10px 30px rgba(15, 23, 42, 0.06)'
                    }
                }
            }
        }
    </script>

</head>


<body class="bg-slate-50 text-slate-800">


<div class="min-h-screen lg:flex">


    <!-- ================= SIDEBAR ================= -->

    <aside class="hidden lg:flex
                  lg:w-72
                  lg:flex-col
                  bg-slate-950
                  text-white
                  fixed inset-y-0 left-0">

        <!-- Logo -->

        <div class="px-7 py-7 border-b border-slate-800">

            <div class="flex items-center gap-3">

                <div class="w-11 h-11
                            rounded-xl
                            bg-cyan-500
                            flex items-center
                            justify-center
                            font-bold text-lg">

                    S

                </div>

                <div>

                    <h1 class="font-bold text-lg leading-tight">
                        Sunrise Dental
                    </h1>

                    <p class="text-xs text-slate-400 mt-1">
                        Clinic Management
                    </p>

                </div>

            </div>

        </div>


        <!-- Navigation -->

        <nav class="flex-1 px-4 py-6 space-y-2">


            <a href="<%= request.getContextPath() %>/dashboard"
               class="flex items-center gap-3
                      bg-cyan-500/10
                      text-cyan-300
                      px-4 py-3
                      rounded-xl
                      font-medium">

                <svg xmlns="http://www.w3.org/2000/svg"
                     class="w-5 h-5"
                     fill="none"
                     viewBox="0 0 24 24"
                     stroke="currentColor">

                    <path stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M3 12l9-9 9 9M5 10v10h14V10"/>

                </svg>

                Dashboard

            </a>


            <a href="<%= request.getContextPath() %>/appointments/new"
               class="flex items-center gap-3
                      text-slate-300
                      hover:text-white
                      hover:bg-slate-800
                      px-4 py-3
                      rounded-xl
                      transition">

                <svg xmlns="http://www.w3.org/2000/svg"
                     class="w-5 h-5"
                     fill="none"
                     viewBox="0 0 24 24"
                     stroke="currentColor">

                    <path stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M12 4v16m8-8H4"/>

                </svg>

                New Appointment

            </a>


            <a href="<%= request.getContextPath() %>/appointments/search"
               class="flex items-center gap-3
                      text-slate-300
                      hover:text-white
                      hover:bg-slate-800
                      px-4 py-3
                      rounded-xl
                      transition">

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

                Search Appointments

            </a>


            <a href="<%= request.getContextPath() %>/reports"
               class="flex items-center gap-3
                      text-slate-300
                      hover:text-white
                      hover:bg-slate-800
                      px-4 py-3
                      rounded-xl
                      transition">

                <svg xmlns="http://www.w3.org/2000/svg"
                     class="w-5 h-5"
                     fill="none"
                     viewBox="0 0 24 24"
                     stroke="currentColor">

                    <path stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M4 19V9m6 10V5m6 14v-7m4 7H2"/>

                </svg>

                Reports

            </a>


            <a href="<%= request.getContextPath() %>/help"
               class="flex items-center gap-3
                      text-slate-300
                      hover:text-white
                      hover:bg-slate-800
                      px-4 py-3
                      rounded-xl
                      transition">

                <svg xmlns="http://www.w3.org/2000/svg"
                     class="w-5 h-5"
                     fill="none"
                     viewBox="0 0 24 24"
                     stroke="currentColor">

                    <path stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          d="M8.228 9a4 4 0 1 1 7.544 1.856C14.85 12.562 12 12.5 12 15m0 4h.01"/>

                </svg>

                Help & Support

            </a>


        </nav>


        <!-- Sidebar User -->

        <div class="p-4 border-t border-slate-800">

            <div class="bg-slate-900 rounded-xl p-4">

                <div class="flex items-center gap-3 mb-4">

                    <div class="w-10 h-10
                                bg-slate-700
                                rounded-full
                                flex items-center
                                justify-center
                                font-semibold">

                        <%
                            if (loggedUser != null &&
                                    loggedUser.getUsername() != null &&
                                    !loggedUser.getUsername().isEmpty()) {
                        %>

                        <%= loggedUser.getUsername()
                                .substring(0, 1)
                                .toUpperCase() %>

                        <% } else { %>

                        U

                        <% } %>

                    </div>

                    <div class="min-w-0">

                        <p class="font-medium truncate">

                            <%= loggedUser != null
                                    ? loggedUser.getUsername()
                                    : "User" %>

                        </p>

                        <p class="text-xs text-slate-400">

                            <%= loggedUser != null
                                    ? loggedUser.getRole()
                                    : "STAFF" %>

                        </p>

                    </div>

                </div>


                <a href="<%= request.getContextPath() %>/logout"
                   class="block text-center
                          bg-slate-800
                          hover:bg-red-500/20
                          hover:text-red-300
                          text-sm
                          px-4 py-2
                          rounded-lg
                          transition">

                    Sign Out

                </a>

            </div>

        </div>

    </aside>


    <!-- ================= MAIN AREA ================= -->

    <div class="flex-1 lg:ml-72">


        <!-- Mobile / Top Header -->

        <header class="sticky top-0 z-30
                       bg-white/90
                       backdrop-blur
                       border-b border-slate-200">

            <div class="px-5 sm:px-8 py-4
                        flex items-center
                        justify-between">

                <div>

                    <p class="text-sm text-slate-500">
                        Sunrise Dental Clinic
                    </p>

                    <h2 class="text-xl font-bold text-slate-900">
                        Dashboard
                    </h2>

                </div>


                <div class="flex items-center gap-3">

                    <div class="hidden sm:block text-right">

                        <p class="text-sm font-medium text-slate-800">

                            <%= loggedUser != null
                                    ? loggedUser.getUsername()
                                    : "Staff" %>

                        </p>

                        <p class="text-xs text-slate-500">

                            <%= loggedUser != null
                                    ? loggedUser.getRole()
                                    : "STAFF" %>

                        </p>

                    </div>


                    <div class="w-10 h-10
                                rounded-full
                                bg-cyan-100
                                text-cyan-700
                                flex items-center
                                justify-center
                                font-bold">

                        <%
                            if (loggedUser != null &&
                                    loggedUser.getUsername() != null &&
                                    !loggedUser.getUsername().isEmpty()) {
                        %>

                        <%= loggedUser.getUsername()
                                .substring(0, 1)
                                .toUpperCase() %>

                        <% } else { %>

                        U

                        <% } %>

                    </div>

                </div>

            </div>

        </header>


        <!-- Page Content -->

        <main class="p-5 sm:p-8">


            <!-- Welcome -->

            <section class="mb-8">

                <div class="bg-gradient-to-r
                            from-slate-900
                            to-slate-800
                            text-white
                            rounded-3xl
                            p-7 sm:p-9
                            shadow-soft">

                    <div class="flex flex-col
                                lg:flex-row
                                lg:items-center
                                lg:justify-between
                                gap-6">

                        <div>

                            <p class="text-cyan-300
                                      text-sm
                                      font-semibold
                                      uppercase
                                      tracking-wider">

                                Clinic Overview

                            </p>

                            <h3 class="text-3xl sm:text-4xl
                                       font-bold mt-2">

                                Welcome back,
                                <%= loggedUser != null
                                        ? loggedUser.getUsername()
                                        : "Staff" %>

                            </h3>

                            <p class="text-slate-300
                                      mt-3
                                      max-w-2xl">

                                Manage appointments, patient records,
                                billing and clinic reports from one
                                centralized workspace.

                            </p>

                        </div>


                        <a href="<%= request.getContextPath() %>/appointments/new"
                           class="inline-flex
                                  items-center
                                  justify-center
                                  gap-2
                                  bg-cyan-500
                                  hover:bg-cyan-400
                                  text-slate-950
                                  font-semibold
                                  px-6 py-3
                                  rounded-xl
                                  transition">

                            <span class="text-xl">+</span>

                            New Appointment

                        </a>

                    </div>

                </div>

            </section>


            <!-- Statistics -->

            <section>

                <div class="grid grid-cols-1
                            sm:grid-cols-2
                            xl:grid-cols-4
                            gap-5">


                    <!-- Patients -->

                    <div class="bg-white
                                border border-slate-200
                                rounded-2xl
                                p-6
                                shadow-soft">

                        <div class="flex items-start justify-between">

                            <div>

                                <p class="text-sm font-medium text-slate-500">
                                    Total Patients
                                </p>

                                <p class="text-3xl
                                          font-bold
                                          text-slate-900
                                          mt-2">

                                    <%= totalPatients != null
                                            ? totalPatients
                                            : 0 %>

                                </p>

                            </div>


                            <div class="w-12 h-12
                                        rounded-xl
                                        bg-blue-50
                                        text-blue-600
                                        flex items-center
                                        justify-center">

                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="w-6 h-6"
                                     fill="none"
                                     viewBox="0 0 24 24"
                                     stroke="currentColor">

                                    <path stroke-linecap="round"
                                          stroke-linejoin="round"
                                          stroke-width="2"
                                          d="M17 20h5v-2a4 4 0 0 0-4-4h-1M9 20H4v-2a4 4 0 0 1 4-4h1m8-4a4 4 0 1 0-8 0 4 4 0 0 0 8 0z"/>

                                </svg>

                            </div>

                        </div>

                    </div>


                    <!-- Today -->

                    <div class="bg-white
                                border border-slate-200
                                rounded-2xl
                                p-6
                                shadow-soft">

                        <div class="flex items-start justify-between">

                            <div>

                                <p class="text-sm font-medium text-slate-500">
                                    Today's Appointments
                                </p>

                                <p class="text-3xl
                                          font-bold
                                          text-slate-900
                                          mt-2">

                                    <%= todayAppointments != null
                                            ? todayAppointments
                                            : 0 %>

                                </p>

                            </div>


                            <div class="w-12 h-12
                                        rounded-xl
                                        bg-cyan-50
                                        text-cyan-600
                                        flex items-center
                                        justify-center">

                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="w-6 h-6"
                                     fill="none"
                                     viewBox="0 0 24 24"
                                     stroke="currentColor">

                                    <path stroke-linecap="round"
                                          stroke-linejoin="round"
                                          stroke-width="2"
                                          d="M8 7V3m8 4V3M5 11h14M5 5h14v16H5z"/>

                                </svg>

                            </div>

                        </div>

                    </div>


                    <!-- Completed -->

                    <div class="bg-white
                                border border-slate-200
                                rounded-2xl
                                p-6
                                shadow-soft">

                        <div class="flex items-start justify-between">

                            <div>

                                <p class="text-sm font-medium text-slate-500">
                                    Completed
                                </p>

                                <p class="text-3xl
                                          font-bold
                                          text-slate-900
                                          mt-2">

                                    <%= completedAppointments != null
                                            ? completedAppointments
                                            : 0 %>

                                </p>

                            </div>


                            <div class="w-12 h-12
                                        rounded-xl
                                        bg-emerald-50
                                        text-emerald-600
                                        flex items-center
                                        justify-center">

                                <svg xmlns="http://www.w3.org/2000/svg"
                                     class="w-6 h-6"
                                     fill="none"
                                     viewBox="0 0 24 24"
                                     stroke="currentColor">

                                    <path stroke-linecap="round"
                                          stroke-linejoin="round"
                                          stroke-width="2"
                                          d="m5 13 4 4L19 7"/>

                                </svg>

                            </div>

                        </div>

                    </div>


                    <!-- Revenue -->

                    <div class="bg-white
                                border border-slate-200
                                rounded-2xl
                                p-6
                                shadow-soft">

                        <div class="flex items-start justify-between">

                            <div>

                                <p class="text-sm font-medium text-slate-500">
                                    Total Revenue
                                </p>

                                <p class="text-2xl
                                          font-bold
                                          text-slate-900
                                          mt-2">

                                    Rs.
                                    <%= totalRevenue != null
                                            ? totalRevenue
                                            : "0.00" %>

                                </p>

                            </div>


                            <div class="w-12 h-12
                                        rounded-xl
                                        bg-violet-50
                                        text-violet-600
                                        flex items-center
                                        justify-center
                                        font-bold">

                                Rs

                            </div>

                        </div>

                    </div>


                </div>

            </section>


            <!-- Quick actions -->

            <section class="mt-10">

                <div class="flex items-end justify-between mb-5">

                    <div>

                        <h3 class="text-xl font-bold text-slate-900">
                            Quick Actions
                        </h3>

                        <p class="text-sm text-slate-500 mt-1">
                            Common clinic management tasks
                        </p>

                    </div>

                </div>


                <div class="grid grid-cols-1
                            md:grid-cols-2
                            xl:grid-cols-4
                            gap-5">


                    <a href="<%= request.getContextPath() %>/appointments/new"
                       class="group bg-white
                              border border-slate-200
                              rounded-2xl
                              p-6
                              shadow-soft
                              hover:-translate-y-1
                              hover:border-cyan-300
                              transition">

                        <div class="w-11 h-11
                                    rounded-xl
                                    bg-cyan-50
                                    text-cyan-600
                                    flex items-center
                                    justify-center
                                    text-2xl
                                    font-semibold">

                            +

                        </div>

                        <h4 class="font-semibold
                                   text-slate-900
                                   mt-5">

                            Register Appointment

                        </h4>

                        <p class="text-sm
                                  text-slate-500
                                  mt-2">

                            Add a patient and schedule
                            a new appointment.

                        </p>

                    </a>


                    <a href="<%= request.getContextPath() %>/appointments/search"
                       class="group bg-white
                              border border-slate-200
                              rounded-2xl
                              p-6
                              shadow-soft
                              hover:-translate-y-1
                              hover:border-blue-300
                              transition">

                        <div class="w-11 h-11
                                    rounded-xl
                                    bg-blue-50
                                    text-blue-600
                                    flex items-center
                                    justify-center">

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

                        <h4 class="font-semibold
                                   text-slate-900
                                   mt-5">

                            Search Appointments

                        </h4>

                        <p class="text-sm
                                  text-slate-500
                                  mt-2">

                            Find appointments using
                            patient or booking information.

                        </p>

                    </a>


                    <a href="<%= request.getContextPath() %>/reports"
                       class="group bg-white
                              border border-slate-200
                              rounded-2xl
                              p-6
                              shadow-soft
                              hover:-translate-y-1
                              hover:border-emerald-300
                              transition">

                        <div class="w-11 h-11
                                    rounded-xl
                                    bg-emerald-50
                                    text-emerald-600
                                    flex items-center
                                    justify-center">

                            <svg xmlns="http://www.w3.org/2000/svg"
                                 class="w-5 h-5"
                                 fill="none"
                                 viewBox="0 0 24 24"
                                 stroke="currentColor">

                                <path stroke-linecap="round"
                                      stroke-linejoin="round"
                                      stroke-width="2"
                                      d="M4 19V9m6 10V5m6 14v-7m4 7H2"/>

                            </svg>

                        </div>

                        <h4 class="font-semibold
                                   text-slate-900
                                   mt-5">

                            View Reports

                        </h4>

                        <p class="text-sm
                                  text-slate-500
                                  mt-2">

                            Review clinic activity,
                            appointments and revenue.

                        </p>

                    </a>


                    <a href="<%= request.getContextPath() %>/help"
                       class="group bg-white
                              border border-slate-200
                              rounded-2xl
                              p-6
                              shadow-soft
                              hover:-translate-y-1
                              hover:border-violet-300
                              transition">

                        <div class="w-11 h-11
                                    rounded-xl
                                    bg-violet-50
                                    text-violet-600
                                    flex items-center
                                    justify-center
                                    font-bold">

                            ?

                        </div>

                        <h4 class="font-semibold
                                   text-slate-900
                                   mt-5">

                            Help Center

                        </h4>

                        <p class="text-sm
                                  text-slate-500
                                  mt-2">

                            Read instructions for
                            using the clinic system.

                        </p>

                    </a>


                </div>

            </section>


            <!-- Status card -->

            <section class="mt-10">

                <div class="bg-white
                            border border-slate-200
                            rounded-2xl
                            shadow-soft
                            p-6">

                    <div class="flex flex-col
                                sm:flex-row
                                sm:items-center
                                sm:justify-between
                                gap-4">

                        <div>

                            <h3 class="font-semibold text-slate-900">
                                System Status
                            </h3>

                            <p class="text-sm text-slate-500 mt-1">
                                Sunrise Dental Clinic management system
                            </p>

                        </div>


                        <div class="inline-flex
                                    items-center
                                    gap-2
                                    bg-emerald-50
                                    text-emerald-700
                                    px-4 py-2
                                    rounded-full
                                    text-sm
                                    font-medium">

                            <span class="w-2 h-2
                                         bg-emerald-500
                                         rounded-full">
                            </span>

                            Operational

                        </div>

                    </div>

                </div>

            </section>


            <footer class="pt-10 pb-4">

                <p class="text-center text-sm text-slate-400">
                    © 2026 Sunrise Dental Clinic • Colombo
                </p>

            </footer>


        </main>


    </div>


</div>


</body>

</html>