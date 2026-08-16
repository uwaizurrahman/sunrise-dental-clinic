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
</head>

<body class="bg-slate-100 min-h-screen">

<header class="bg-white shadow-sm px-6 py-4">

  <div class="max-w-5xl mx-auto flex justify-between items-center">

    <h1 class="text-xl font-bold text-slate-800">
      Sunrise Dental Clinic
    </h1>

    <a href="<%= request.getContextPath() %>/dashboard"
       class="text-blue-600 hover:underline">
      Dashboard
    </a>

  </div>

</header>

<main class="max-w-5xl mx-auto p-6">

  <div class="bg-white shadow-sm rounded-xl p-6">

    <h2 class="text-2xl font-bold text-slate-800 mb-6">
      Register New Appointment
    </h2>

    <% if (error != null) { %>

    <div class="mb-5 rounded-lg bg-red-100 text-red-700 px-4 py-3">
      <%= error %>
    </div>

    <% } %>

    <% if (success != null) { %>

    <div class="mb-5 rounded-lg bg-green-100 text-green-700 px-4 py-3">

      <p class="font-semibold">
        <%= success %>
      </p>

      <p class="mt-1">
        Appointment Number:
        <strong>
          <%= appointmentNumber %>
        </strong>
      </p>

    </div>

    <% } %>

    <form method="post"
          action="<%= request.getContextPath() %>/appointments/new">

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

        <div>

          <label class="block text-sm font-medium text-slate-700 mb-2">
            Patient Name
          </label>

          <input type="text"
                 name="patientName"
                 required
                 class="w-full border border-slate-300 rounded-lg px-4 py-2">

        </div>

        <div>

          <label class="block text-sm font-medium text-slate-700 mb-2">
            Contact Number
          </label>

          <input type="text"
                 name="contactNumber"
                 required
                 maxlength="10"
                 pattern="[0-9]{10}"
                 placeholder="0771234567"
                 class="w-full border border-slate-300 rounded-lg px-4 py-2">

        </div>

        <div class="md:col-span-2">

          <label class="block text-sm font-medium text-slate-700 mb-2">
            Address
          </label>

          <textarea name="address"
                    required
                    rows="3"
                    class="w-full border border-slate-300 rounded-lg px-4 py-2"></textarea>

        </div>

        <div>

          <label class="block text-sm font-medium text-slate-700 mb-2">
            Dentist
          </label>

          <select name="dentistId"
                  required
                  class="w-full border border-slate-300 rounded-lg px-4 py-2">

            <option value="">
              Select Dentist
            </option>

            <% if (dentists != null) {

              for (Dentist dentist : dentists) {
            %>

            <option value="<%= dentist.getDentistId() %>">
              <%= dentist.getDentistName() %>
              -
              <%= dentist.getSpecialization() %>
            </option>

            <%
                }
              }
            %>

          </select>

        </div>

        <div>

          <label class="block text-sm font-medium text-slate-700 mb-2">
            Treatment
          </label>

          <select name="treatmentId"
                  required
                  class="w-full border border-slate-300 rounded-lg px-4 py-2">

            <option value="">
              Select Treatment
            </option>

            <% if (treatments != null) {

              for (Treatment treatment : treatments) {
            %>

            <option value="<%= treatment.getTreatmentId() %>">
              <%= treatment.getTreatmentName() %>
              - Rs.
              <%= treatment.getTreatmentCost() %>
            </option>

            <%
                }
              }
            %>

          </select>

        </div>

        <div>

          <label class="block text-sm font-medium text-slate-700 mb-2">
            Appointment Date
          </label>

          <input type="date"
                 name="appointmentDate"
                 required
                 class="w-full border border-slate-300 rounded-lg px-4 py-2">

        </div>

        <div>

          <label class="block text-sm font-medium text-slate-700 mb-2">
            Appointment Time
          </label>

          <input type="time"
                 name="appointmentTime"
                 required
                 class="w-full border border-slate-300 rounded-lg px-4 py-2">

        </div>

      </div>

      <div class="mt-8 flex justify-end">

        <button type="submit"
                class="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition">

          Register Appointment

        </button>

      </div>

    </form>

  </div>

</main>

</body>
</html>