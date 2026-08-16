<%@ page import="java.util.List" %>
<%@ page import="com.sunriseclinic.sunrisedentalclinic.model.Dentist" %>
<%@ page import="com.sunriseclinic.sunrisedentalclinic.model.Treatment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  List<Dentist> dentists =
          (List<Dentist>) request.getAttribute("dentists");

  List<Treatment> treatments =
          (List<Treatment>) request.getAttribute("treatments");

  String error =
          (String) request.getAttribute("error");

  String success =
          (String) request.getAttribute("success");

  String appointmentNumber =
          (String) request.getAttribute("appointmentNumber");
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">

  <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

  <title>New Appointment | Sunrise Dental Clinic</title>

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
         class="flex items-center gap-3 bg-cyan-500/10 text-cyan-300 px-4 py-3 rounded-xl font-medium">
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

  <div class="flex-1 lg:ml-72">

    <header class="sticky top-0 z-30 bg-white/90 backdrop-blur border-b border-slate-200">

      <div class="px-5 sm:px-8 py-4 flex items-center justify-between">

        <div>
          <p class="text-sm text-slate-500">
            Appointment Management
          </p>

          <h2 class="text-xl font-bold text-slate-900">
            Register New Appointment
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

        <!-- Heading -->

        <div class="mb-8">

          <div class="inline-flex items-center gap-2 text-cyan-700 bg-cyan-50 px-3 py-1.5 rounded-full text-sm font-medium">
            New Booking
          </div>

          <h1 class="text-3xl sm:text-4xl font-bold text-slate-950 mt-4">
            Create a dental appointment
          </h1>

          <p class="text-slate-500 mt-2 max-w-2xl">
            Enter the patient information, select the dentist and treatment,
            then choose an available appointment date and time.
          </p>

        </div>


        <!-- Alerts -->

        <% if (error != null) { %>

        <div class="mb-6 bg-red-50 border border-red-200 text-red-700 px-5 py-4 rounded-2xl">
          <p class="font-semibold">
            Appointment could not be registered
          </p>

          <p class="text-sm mt-1">
            <%= error %>
          </p>
        </div>

        <% } %>


        <% if (success != null) { %>

        <div class="mb-6 bg-emerald-50 border border-emerald-200 text-emerald-700 px-5 py-4 rounded-2xl">

          <p class="font-semibold">
            <%= success %>
          </p>

          <p class="text-sm mt-1">
            Appointment Number:
            <span class="font-bold">
                            <%= appointmentNumber %>
                        </span>
          </p>

        </div>

        <% } %>


        <!-- Form Card -->

        <form method="post"
              action="<%= request.getContextPath() %>/appointments/new"
              class="bg-white border border-slate-200 rounded-3xl shadow-soft overflow-hidden">


          <!-- Patient Section -->

          <section class="p-6 sm:p-8 border-b border-slate-200">

            <div class="flex items-start gap-4 mb-7">

              <div class="w-11 h-11 rounded-xl bg-blue-50 text-blue-600 flex items-center justify-center font-bold">
                1
              </div>

              <div>

                <h3 class="text-xl font-semibold text-slate-900">
                  Patient Information
                </h3>

                <p class="text-sm text-slate-500 mt-1">
                  Enter the patient's personal and contact details.
                </p>

              </div>

            </div>


            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

              <div>

                <label for="patientName"
                       class="block text-sm font-semibold text-slate-700 mb-2">
                  Patient Name
                </label>

                <input type="text"
                       id="patientName"
                       name="patientName"
                       required
                       placeholder="e.g. Kamal Perera"
                       class="w-full px-4 py-3.5 bg-white border border-slate-300 rounded-xl outline-none focus:ring-4 focus:ring-cyan-500/10 focus:border-cyan-500 transition">

              </div>


              <div>

                <label for="contactNumber"
                       class="block text-sm font-semibold text-slate-700 mb-2">
                  Contact Number
                </label>

                <input type="text"
                       id="contactNumber"
                       name="contactNumber"
                       required
                       maxlength="10"
                       pattern="[0-9]{10}"
                       placeholder="0771234567"
                       class="w-full px-4 py-3.5 bg-white border border-slate-300 rounded-xl outline-none focus:ring-4 focus:ring-cyan-500/10 focus:border-cyan-500 transition">

                <p class="text-xs text-slate-400 mt-2">
                  Enter a 10-digit Sri Lankan contact number.
                </p>

              </div>


              <div class="md:col-span-2">

                <label for="address"
                       class="block text-sm font-semibold text-slate-700 mb-2">
                  Address
                </label>

                <textarea id="address"
                          name="address"
                          required
                          rows="4"
                          placeholder="Enter the patient's residential address"
                          class="w-full px-4 py-3.5 bg-white border border-slate-300 rounded-xl outline-none focus:ring-4 focus:ring-cyan-500/10 focus:border-cyan-500 transition resize-none"></textarea>

              </div>

            </div>

          </section>


          <!-- Clinical Section -->

          <section class="p-6 sm:p-8 border-b border-slate-200">

            <div class="flex items-start gap-4 mb-7">

              <div class="w-11 h-11 rounded-xl bg-cyan-50 text-cyan-600 flex items-center justify-center font-bold">
                2
              </div>

              <div>

                <h3 class="text-xl font-semibold text-slate-900">
                  Treatment & Dentist
                </h3>

                <p class="text-sm text-slate-500 mt-1">
                  Select the appropriate dentist and required treatment.
                </p>

              </div>

            </div>


            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

              <div>

                <label for="dentistId"
                       class="block text-sm font-semibold text-slate-700 mb-2">
                  Dentist
                </label>

                <select id="dentistId"
                        name="dentistId"
                        required
                        class="w-full px-4 py-3.5 bg-white border border-slate-300 rounded-xl outline-none focus:ring-4 focus:ring-cyan-500/10 focus:border-cyan-500 transition">

                  <option value="">
                    Select a dentist
                  </option>

                  <% if (dentists != null) {
                    for (Dentist dentist : dentists) {
                  %>

                  <option value="<%= dentist.getDentistId() %>">
                    <%= dentist.getDentistName() %>
                    <% if (dentist.getSpecialization() != null) { %>
                    — <%= dentist.getSpecialization() %>
                    <% } %>
                  </option>

                  <%
                      }
                    }
                  %>

                </select>

              </div>


              <div>

                <label for="treatmentId"
                       class="block text-sm font-semibold text-slate-700 mb-2">
                  Treatment
                </label>

                <select id="treatmentId"
                        name="treatmentId"
                        required
                        class="w-full px-4 py-3.5 bg-white border border-slate-300 rounded-xl outline-none focus:ring-4 focus:ring-cyan-500/10 focus:border-cyan-500 transition">

                  <option value="">
                    Select a treatment
                  </option>

                  <% if (treatments != null) {
                    for (Treatment treatment : treatments) {
                  %>

                  <option value="<%= treatment.getTreatmentId() %>">
                    <%= treatment.getTreatmentName() %>
                    — Rs. <%= treatment.getTreatmentCost() %>
                  </option>

                  <%
                      }
                    }
                  %>

                </select>

              </div>

            </div>

          </section>


          <!-- Schedule Section -->

          <section class="p-6 sm:p-8">

            <div class="flex items-start gap-4 mb-7">

              <div class="w-11 h-11 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center font-bold">
                3
              </div>

              <div>

                <h3 class="text-xl font-semibold text-slate-900">
                  Appointment Schedule
                </h3>

                <p class="text-sm text-slate-500 mt-1">
                  Choose the preferred appointment date and time.
                </p>

              </div>

            </div>


            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

              <div>

                <label for="appointmentDate"
                       class="block text-sm font-semibold text-slate-700 mb-2">
                  Appointment Date
                </label>

                <input type="date"
                       id="appointmentDate"
                       name="appointmentDate"
                       required
                       class="w-full px-4 py-3.5 bg-white border border-slate-300 rounded-xl outline-none focus:ring-4 focus:ring-cyan-500/10 focus:border-cyan-500 transition">

              </div>


              <div>

                <label for="appointmentTime"
                       class="block text-sm font-semibold text-slate-700 mb-2">
                  Appointment Time
                </label>

                <input type="time"
                       id="appointmentTime"
                       name="appointmentTime"
                       required
                       class="w-full px-4 py-3.5 bg-white border border-slate-300 rounded-xl outline-none focus:ring-4 focus:ring-cyan-500/10 focus:border-cyan-500 transition">

              </div>

            </div>


            <!-- Info -->

            <div class="mt-6 bg-slate-50 border border-slate-200 rounded-2xl px-5 py-4">

              <p class="text-sm text-slate-600">
                The system automatically checks whether the selected dentist
                is already booked for the chosen date and time.
              </p>

            </div>


            <!-- Actions -->

            <div class="mt-8 flex flex-col-reverse sm:flex-row justify-end gap-3">

              <a href="<%= request.getContextPath() %>/dashboard"
                 class="text-center px-6 py-3.5 border border-slate-300 text-slate-700 rounded-xl font-semibold hover:bg-slate-50 transition">

                Cancel

              </a>

              <button type="submit"
                      class="px-7 py-3.5 bg-slate-950 hover:bg-slate-800 text-white rounded-xl font-semibold shadow-lg shadow-slate-900/10 transition">

                Register Appointment

              </button>

            </div>

          </section>

        </form>

      </div>

    </main>

  </div>

</div>

<script>
  const appointmentDate =
          document.getElementById("appointmentDate");

  const today =
          new Date().toISOString().split("T")[0];

  appointmentDate.setAttribute("min", today);
</script>

</body>

</html>