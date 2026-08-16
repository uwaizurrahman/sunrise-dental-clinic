<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">

  <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

  <title>Help & Support | Sunrise Dental Clinic</title>

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
         class="flex items-center gap-3 text-slate-300 hover:text-white hover:bg-slate-800 px-4 py-3 rounded-xl transition">
        Search Appointments
      </a>

      <a href="<%= request.getContextPath() %>/reports"
         class="flex items-center gap-3 text-slate-300 hover:text-white hover:bg-slate-800 px-4 py-3 rounded-xl transition">
        Reports
      </a>

      <a href="<%= request.getContextPath() %>/help"
         class="flex items-center gap-3 bg-cyan-500/10 text-cyan-300 px-4 py-3 rounded-xl font-medium">
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
            Staff Guide
          </p>

          <h2 class="text-xl font-bold text-slate-900">
            Help & Support
          </h2>

        </div>


        <a href="<%= request.getContextPath() %>/dashboard"
           class="text-sm font-medium text-slate-600 hover:text-slate-900">

          Back to Dashboard

        </a>

      </div>

    </header>


    <main class="p-5 sm:p-8">

      <div class="max-w-6xl mx-auto">


        <!-- Hero -->

        <section class="bg-slate-950 text-white rounded-3xl p-7 sm:p-9 shadow-soft mb-8">

          <div class="max-w-3xl">

            <div class="inline-flex items-center gap-2 bg-cyan-500/10 border border-cyan-400/20 text-cyan-300 px-3 py-1.5 rounded-full text-sm font-medium">

              User Guide

            </div>


            <h1 class="text-3xl sm:text-4xl font-bold mt-4">

              How to use the clinic system

            </h1>


            <p class="text-slate-400 mt-3 leading-relaxed">

              Follow these step-by-step instructions to manage
              appointments, patients, billing and reports safely.

            </p>

          </div>

        </section>


        <!-- Quick Navigation -->

        <section class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-8">

          <a href="#login"
             class="bg-white border border-slate-200 rounded-2xl p-4 shadow-soft hover:border-cyan-300 transition">

            <p class="font-semibold text-slate-900">
              Login
            </p>

            <p class="text-xs text-slate-500 mt-1">
              Secure system access
            </p>

          </a>


          <a href="#appointment"
             class="bg-white border border-slate-200 rounded-2xl p-4 shadow-soft hover:border-cyan-300 transition">

            <p class="font-semibold text-slate-900">
              Appointments
            </p>

            <p class="text-xs text-slate-500 mt-1">
              Register new bookings
            </p>

          </a>


          <a href="#billing"
             class="bg-white border border-slate-200 rounded-2xl p-4 shadow-soft hover:border-cyan-300 transition">

            <p class="font-semibold text-slate-900">
              Billing
            </p>

            <p class="text-xs text-slate-500 mt-1">
              Generate receipts
            </p>

          </a>


          <a href="#reports"
             class="bg-white border border-slate-200 rounded-2xl p-4 shadow-soft hover:border-cyan-300 transition">

            <p class="font-semibold text-slate-900">
              Reports
            </p>

            <p class="text-xs text-slate-500 mt-1">
              Review clinic activity
            </p>

          </a>

        </section>


        <div class="space-y-6">


          <!-- Login -->

          <section id="login"
                   class="bg-white border border-slate-200 rounded-3xl shadow-soft p-6 sm:p-8">

            <div class="flex items-start gap-4">

              <div class="w-11 h-11 flex-shrink-0 rounded-xl bg-blue-50 text-blue-600 flex items-center justify-center font-bold">
                1
              </div>


              <div class="flex-1">

                <h3 class="text-xl font-semibold text-slate-900">
                  Login to the System
                </h3>

                <p class="text-sm text-slate-500 mt-1 mb-5">
                  Only authorized clinic staff can access the system.
                </p>


                <ol class="space-y-3 text-slate-700">

                  <li class="flex gap-3">

                                        <span class="font-semibold text-slate-400">
                                            01
                                        </span>

                    Open the Sunrise Dental Clinic application.

                  </li>

                  <li class="flex gap-3">

                                        <span class="font-semibold text-slate-400">
                                            02
                                        </span>

                    Enter your authorized username.

                  </li>

                  <li class="flex gap-3">

                                        <span class="font-semibold text-slate-400">
                                            03
                                        </span>

                    Enter your password and select
                    <strong>Sign In to Dashboard</strong>.

                  </li>

                  <li class="flex gap-3">

                                        <span class="font-semibold text-slate-400">
                                            04
                                        </span>

                    If your credentials are valid, the dashboard is displayed.

                  </li>

                </ol>

              </div>

            </div>

          </section>


          <!-- Appointment -->

          <section id="appointment"
                   class="bg-white border border-slate-200 rounded-3xl shadow-soft p-6 sm:p-8">

            <div class="flex items-start gap-4">

              <div class="w-11 h-11 flex-shrink-0 rounded-xl bg-cyan-50 text-cyan-600 flex items-center justify-center font-bold">
                2
              </div>


              <div class="flex-1">

                <h3 class="text-xl font-semibold text-slate-900">
                  Register a New Appointment
                </h3>

                <p class="text-sm text-slate-500 mt-1 mb-5">
                  Add patient information and schedule a dental visit.
                </p>


                <ol class="space-y-3 text-slate-700">

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">01</span>
                    Select <strong>New Appointment</strong>.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">02</span>
                    Enter the patient's name, address and contact number.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">03</span>
                    Select the dentist and treatment type.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">04</span>
                    Select the appointment date and time.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">05</span>
                    Click <strong>Register Appointment</strong>.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">06</span>
                    Record the unique appointment number displayed by the system.
                  </li>

                </ol>


                <div class="mt-6 bg-cyan-50 border border-cyan-200 text-cyan-800 rounded-2xl p-4">

                  <p class="text-sm">
                    The system checks dentist availability and prevents
                    double bookings for the same date and time.
                  </p>

                </div>

              </div>

            </div>

          </section>


          <!-- Search -->

          <section class="bg-white border border-slate-200 rounded-3xl shadow-soft p-6 sm:p-8">

            <div class="flex items-start gap-4">

              <div class="w-11 h-11 flex-shrink-0 rounded-xl bg-violet-50 text-violet-600 flex items-center justify-center font-bold">
                3
              </div>


              <div class="flex-1">

                <h3 class="text-xl font-semibold text-slate-900">
                  Search & View Appointment Details
                </h3>

                <p class="text-sm text-slate-500 mt-1 mb-5">
                  Locate patient appointments quickly.
                </p>


                <ol class="space-y-3 text-slate-700">

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">01</span>
                    Select <strong>Search Appointments</strong>.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">02</span>
                    Choose appointment number, patient name, or contact number.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">03</span>
                    Enter the search value and click <strong>Search</strong>.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">04</span>
                    Select <strong>View Details</strong> beside the required appointment.
                  </li>

                </ol>

              </div>

            </div>

          </section>


          <!-- Status -->

          <section class="bg-white border border-slate-200 rounded-3xl shadow-soft p-6 sm:p-8">

            <div class="flex items-start gap-4">

              <div class="w-11 h-11 flex-shrink-0 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center font-bold">
                4
              </div>


              <div class="flex-1">

                <h3 class="text-xl font-semibold text-slate-900">
                  Manage Appointment Status
                </h3>

                <p class="text-sm text-slate-500 mt-1 mb-5">
                  Update an appointment after patient activity.
                </p>


                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

                  <div class="border border-slate-200 rounded-2xl p-5">

                    <p class="font-semibold text-emerald-700">
                      Mark Completed
                    </p>

                    <p class="text-sm text-slate-500 mt-2">
                      Use this when the patient's dental appointment
                      has been successfully completed.
                    </p>

                  </div>


                  <div class="border border-slate-200 rounded-2xl p-5">

                    <p class="font-semibold text-red-700">
                      Cancel Appointment
                    </p>

                    <p class="text-sm text-slate-500 mt-2">
                      Use this when the appointment will no longer take place.
                      The dentist's time slot becomes available again.
                    </p>

                  </div>

                </div>

              </div>

            </div>

          </section>


          <!-- Billing -->

          <section id="billing"
                   class="bg-white border border-slate-200 rounded-3xl shadow-soft p-6 sm:p-8">

            <div class="flex items-start gap-4">

              <div class="w-11 h-11 flex-shrink-0 rounded-xl bg-amber-50 text-amber-600 flex items-center justify-center font-bold">
                5
              </div>


              <div class="flex-1">

                <h3 class="text-xl font-semibold text-slate-900">
                  Generate & Print a Bill
                </h3>

                <p class="text-sm text-slate-500 mt-1 mb-5">
                  Calculate the patient's treatment charges and produce a receipt.
                </p>


                <ol class="space-y-3 text-slate-700">

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">01</span>
                    Search for the patient's appointment.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">02</span>
                    Open the appointment details.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">03</span>
                    Click <strong>Generate Bill</strong>.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">04</span>
                    Review the treatment fee, consultation fee and total amount.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">05</span>
                    Click <strong>Print Receipt</strong> to print the bill.
                  </li>

                </ol>

              </div>

            </div>

          </section>


          <!-- Reports -->

          <section id="reports"
                   class="bg-white border border-slate-200 rounded-3xl shadow-soft p-6 sm:p-8">

            <div class="flex items-start gap-4">

              <div class="w-11 h-11 flex-shrink-0 rounded-xl bg-purple-50 text-purple-600 flex items-center justify-center font-bold">
                6
              </div>


              <div class="flex-1">

                <h3 class="text-xl font-semibold text-slate-900">
                  View Reports
                </h3>

                <p class="text-sm text-slate-500 mt-1 mb-5">
                  Monitor daily appointments and clinic revenue.
                </p>


                <ol class="space-y-3 text-slate-700">

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">01</span>
                    Select <strong>Reports</strong> from the navigation menu.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">02</span>
                    Review today's revenue, total revenue and generated bills.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">03</span>
                    Review the daily appointment schedule.
                  </li>

                  <li class="flex gap-3">
                    <span class="font-semibold text-slate-400">04</span>
                    Use <strong>Print Report</strong> when a printed copy is required.
                  </li>

                </ol>

              </div>

            </div>

          </section>


          <!-- Logout -->

          <section class="bg-white border border-slate-200 rounded-3xl shadow-soft p-6 sm:p-8">

            <div class="flex items-start gap-4">

              <div class="w-11 h-11 flex-shrink-0 rounded-xl bg-red-50 text-red-600 flex items-center justify-center font-bold">
                7
              </div>


              <div class="flex-1">

                <h3 class="text-xl font-semibold text-slate-900">
                  Sign Out Safely
                </h3>

                <p class="text-sm text-slate-500 mt-1">

                  When you finish using the system, select
                  <strong>Sign Out</strong>. Your session will be closed
                  and the application will return to the login page.

                </p>

              </div>

            </div>

          </section>


          <!-- Validation -->

          <section class="bg-slate-900 text-white rounded-3xl shadow-soft p-6 sm:p-8">

            <h3 class="text-xl font-semibold">
              Important Validation Rules
            </h3>

            <p class="text-sm text-slate-400 mt-2 mb-6">
              Keep these rules in mind when entering clinic information.
            </p>


            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

              <div class="bg-white/5 border border-white/10 rounded-2xl p-4">
                <p class="text-sm text-slate-300">
                  All required fields must be completed.
                </p>
              </div>

              <div class="bg-white/5 border border-white/10 rounded-2xl p-4">
                <p class="text-sm text-slate-300">
                  Patient contact numbers must contain 10 digits.
                </p>
              </div>

              <div class="bg-white/5 border border-white/10 rounded-2xl p-4">
                <p class="text-sm text-slate-300">
                  Past appointment dates are not accepted.
                </p>
              </div>

              <div class="bg-white/5 border border-white/10 rounded-2xl p-4">
                <p class="text-sm text-slate-300">
                  The same dentist cannot have two active bookings at the same date and time.
                </p>
              </div>

            </div>

          </section>


        </div>


        <footer class="py-10">

          <p class="text-center text-sm text-slate-400">
            Sunrise Dental Clinic • Staff Help Center
          </p>

        </footer>


      </div>

    </main>

  </div>

</div>

</body>

</html>