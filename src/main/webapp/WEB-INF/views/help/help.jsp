<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">

  <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

  <title>Help | Sunrise Dental Clinic</title>

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
        Help & User Instructions
      </p>
    </div>

    <a href="<%= request.getContextPath() %>/dashboard"
       class="text-blue-600 hover:text-blue-800 font-medium">
      Dashboard
    </a>

  </div>

</header>


<main class="max-w-5xl mx-auto p-6">

  <div class="bg-white rounded-xl shadow-sm p-6 mb-6">

    <h2 class="text-2xl font-bold text-slate-800">
      System Help
    </h2>

    <p class="text-slate-500 mt-2">
      Follow the instructions below to use the Sunrise Dental Clinic
      appointment and patient management system.
    </p>

  </div>


  <div class="space-y-6">


    <!-- Login -->

    <section class="bg-white rounded-xl shadow-sm p-6">

      <h3 class="text-xl font-semibold text-slate-800 mb-4">
        1. Login to the System
      </h3>

      <ol class="list-decimal ml-6 space-y-2 text-slate-700">

        <li>Open the Sunrise Dental Clinic application.</li>

        <li>Enter your authorized username.</li>

        <li>Enter your password.</li>

        <li>Click the Login button.</li>

        <li>
          If the credentials are correct, the dashboard will be displayed.
        </li>

      </ol>

    </section>


    <!-- Register appointment -->

    <section class="bg-white rounded-xl shadow-sm p-6">

      <h3 class="text-xl font-semibold text-slate-800 mb-4">
        2. Register a New Appointment
      </h3>

      <ol class="list-decimal ml-6 space-y-2 text-slate-700">

        <li>
          From the dashboard, select
          <strong>Register New Appointment</strong>.
        </li>

        <li>Enter the patient's name.</li>

        <li>Enter the patient's contact number.</li>

        <li>Enter the patient's address.</li>

        <li>Select the dentist.</li>

        <li>Select the treatment type.</li>

        <li>Select the appointment date.</li>

        <li>Select the appointment time.</li>

        <li>Click <strong>Register Appointment</strong>.</li>

        <li>
          The system will display a unique appointment number
          after successful registration.
        </li>

      </ol>

      <div class="mt-4 bg-blue-50 text-blue-700 px-4 py-3 rounded-lg">

        The system prevents the same dentist from being booked for
        the same date and time.

      </div>

    </section>


    <!-- Search -->

    <section class="bg-white rounded-xl shadow-sm p-6">

      <h3 class="text-xl font-semibold text-slate-800 mb-4">
        3. Search for an Appointment
      </h3>

      <ol class="list-decimal ml-6 space-y-2 text-slate-700">

        <li>
          Select <strong>Search Appointments</strong>
          from the dashboard.
        </li>

        <li>
          Choose one of the available search methods:
          appointment number, patient name, or contact number.
        </li>

        <li>Enter the search value.</li>

        <li>Click <strong>Search</strong>.</li>

        <li>
          Matching appointment records will be displayed.
        </li>

        <li>
          Click <strong>View Details</strong>
          to see the complete appointment information.
        </li>

      </ol>

    </section>


    <!-- Status -->

    <section class="bg-white rounded-xl shadow-sm p-6">

      <h3 class="text-xl font-semibold text-slate-800 mb-4">
        4. Manage Appointment Status
      </h3>

      <p class="text-slate-700 mb-4">
        Scheduled appointments can be updated using the appointment details page.
      </p>

      <ul class="list-disc ml-6 space-y-2 text-slate-700">

        <li>
          Use <strong>Mark Completed</strong>
          when the patient's appointment has been completed.
        </li>

        <li>
          Use <strong>Cancel Appointment</strong>
          when the appointment is cancelled.
        </li>

        <li>
          Cancelled appointment time slots become available
          for future bookings.
        </li>

      </ul>

    </section>


    <!-- Billing -->

    <section class="bg-white rounded-xl shadow-sm p-6">

      <h3 class="text-xl font-semibold text-slate-800 mb-4">
        5. Generate a Patient Bill
      </h3>

      <ol class="list-decimal ml-6 space-y-2 text-slate-700">

        <li>Search for the patient's appointment.</li>

        <li>Open the appointment details page.</li>

        <li>Click <strong>Generate Bill</strong>.</li>

        <li>
          The system calculates the total using the treatment cost
          and consultation fee.
        </li>

        <li>
          The patient receipt will be displayed.
        </li>

      </ol>

    </section>


    <!-- Print -->

    <section class="bg-white rounded-xl shadow-sm p-6">

      <h3 class="text-xl font-semibold text-slate-800 mb-4">
        6. Print the Patient Receipt
      </h3>

      <ol class="list-decimal ml-6 space-y-2 text-slate-700">

        <li>Generate or open the patient's bill.</li>

        <li>Click the <strong>Print Bill</strong> button.</li>

        <li>
          Select the required printer from the browser's print window.
        </li>

        <li>Confirm the print operation.</li>

      </ol>

    </section>


    <!-- Logout -->

    <section class="bg-white rounded-xl shadow-sm p-6">

      <h3 class="text-xl font-semibold text-slate-800 mb-4">
        7. Logout Safely
      </h3>

      <ol class="list-decimal ml-6 space-y-2 text-slate-700">

        <li>
          Click the <strong>Logout</strong> button from the dashboard.
        </li>

        <li>
          The current user session will be ended.
        </li>

        <li>
          The system will return to the login page.
        </li>

      </ol>

    </section>


    <!-- Validation -->

    <section class="bg-white rounded-xl shadow-sm p-6">

      <h3 class="text-xl font-semibold text-slate-800 mb-4">
        Important Validation Rules
      </h3>

      <ul class="list-disc ml-6 space-y-2 text-slate-700">

        <li>All required fields must be completed.</li>

        <li>
          Contact numbers must contain 10 digits.
        </li>

        <li>
          Appointment dates cannot be in the past.
        </li>

        <li>
          A dentist cannot have two active appointments
          at the same date and time.
        </li>

        <li>
          Only authorized staff can access protected pages.
        </li>

      </ul>

    </section>

  </div>

</main>

</body>
</html>