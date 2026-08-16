<%--
  Created by IntelliJ IDEA.
  User: Vipusikan
  Date: 8/15/2026
  Time: 8:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">

  <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

  <title>Login | Sunrise Dental Clinic</title>

  <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-slate-100 min-h-screen flex items-center justify-center">

<div class="bg-white shadow-lg rounded-xl p-8 w-full max-w-md">

  <h1 class="text-2xl font-bold text-slate-800 text-center">
    Sunrise Dental Clinic
  </h1>

  <p class="text-slate-500 text-center mt-2 mb-6">
    Staff Login
  </p>

  <%
    String error = (String) request.getAttribute("error");

    if (error != null) {
  %>

  <div class="bg-red-100 text-red-700 px-4 py-3 rounded-lg mb-4">
    <%= error %>
  </div>

  <%
    }
  %>

  <form method="post"
        action="<%= request.getContextPath() %>/login">

    <div class="mb-4">

      <label class="block text-sm font-medium text-slate-700 mb-2">
        Username
      </label>

      <input
              type="text"
              name="username"
              required
              autocomplete="username"
              class="w-full border border-slate-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">

    </div>

    <div class="mb-6">

      <label class="block text-sm font-medium text-slate-700 mb-2">
        Password
      </label>

      <input
              type="password"
              name="password"
              required
              autocomplete="current-password"
              class="w-full border border-slate-300 rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500">

    </div>

    <button
            type="submit"
            class="w-full bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700 transition">

      Login

    </button>

  </form>

</div>

</body>
</html>
