<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">

  <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

  <title>Sign In | Sunrise Dental Clinic</title>

  <script src="https://cdn.tailwindcss.com"></script>

  <script>
    tailwind.config = {
      theme: {
        extend: {
          boxShadow: {
            soft: '0 25px 60px rgba(15, 23, 42, 0.12)'
          }
        }
      }
    }
  </script>

</head>


<body class="min-h-screen bg-slate-50">


<div class="min-h-screen lg:grid lg:grid-cols-2">


  <!-- ================================================= -->
  <!-- LEFT SIDE -->
  <!-- ================================================= -->

  <section class="hidden lg:flex
                    relative
                    overflow-hidden
                    bg-slate-950
                    text-white
                    p-12
                    flex-col
                    justify-between">


    <!-- Decorative background -->

    <div class="absolute
                    -top-32
                    -right-32
                    w-96
                    h-96
                    bg-cyan-500/20
                    rounded-full
                    blur-3xl">
    </div>

    <div class="absolute
                    -bottom-32
                    -left-32
                    w-96
                    h-96
                    bg-blue-500/10
                    rounded-full
                    blur-3xl">
    </div>


    <!-- Brand -->

    <div class="relative z-10">

      <div class="flex items-center gap-4">

        <div class="w-14 h-14
                            bg-cyan-500
                            rounded-2xl
                            flex items-center
                            justify-center
                            shadow-lg">

          <svg xmlns="http://www.w3.org/2000/svg"
               class="w-8 h-8 text-slate-950"
               viewBox="0 0 24 24"
               fill="none"
               stroke="currentColor"
               stroke-width="1.8">

            <path stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M12 3c-1.4 0-2.2-.8-3.7-.8C5.5 2.2 4 4.4 4 7c0 3.8 2 5.2 2.7 8.7.5 2.5.9 5.3 2.5 5.3 1.4 0 1.3-4.8 2.8-4.8s1.4 4.8 2.8 4.8c1.6 0 2-2.8 2.5-5.3C18 12.2 20 10.8 20 7c0-2.6-1.5-4.8-4.3-4.8C14.2 2.2 13.4 3 12 3z"/>

          </svg>

        </div>


        <div>

          <h1 class="text-xl font-bold">
            Sunrise Dental Clinic
          </h1>

          <p class="text-sm text-slate-400 mt-1">
            Appointment Management System
          </p>

        </div>

      </div>

    </div>


    <!-- Main content -->

    <div class="relative z-10 max-w-xl">

      <div class="inline-flex
                        items-center
                        gap-2
                        bg-cyan-500/10
                        border border-cyan-400/20
                        text-cyan-300
                        text-sm
                        font-medium
                        px-4 py-2
                        rounded-full
                        mb-6">

                <span class="w-2 h-2
                             rounded-full
                             bg-cyan-400">
                </span>

        Clinic Management Portal

      </div>


      <h2 class="text-5xl
                       font-bold
                       leading-tight
                       tracking-tight">

        Better organization for
        <span class="text-cyan-400">
                    better patient care.
                </span>

      </h2>


      <p class="text-slate-400
                      text-lg
                      leading-relaxed
                      mt-6
                      max-w-lg">

        Manage patient appointments, dentist schedules,
        billing and clinic reports securely from one
        centralized system.

      </p>


      <!-- Feature indicators -->

      <div class="grid grid-cols-2 gap-4 mt-10">


        <div class="bg-white/5
                            border border-white/10
                            rounded-2xl
                            p-4">

          <div class="w-9 h-9
                                rounded-lg
                                bg-cyan-500/10
                                text-cyan-300
                                flex items-center
                                justify-center
                                mb-3">

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

          <p class="font-semibold">
            Appointments
          </p>

          <p class="text-xs text-slate-500 mt-1">
            Efficient scheduling
          </p>

        </div>


        <div class="bg-white/5
                            border border-white/10
                            rounded-2xl
                            p-4">

          <div class="w-9 h-9
                                rounded-lg
                                bg-emerald-500/10
                                text-emerald-300
                                flex items-center
                                justify-center
                                mb-3">

            <svg xmlns="http://www.w3.org/2000/svg"
                 class="w-5 h-5"
                 fill="none"
                 viewBox="0 0 24 24"
                 stroke="currentColor">

              <path stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M9 12l2 2 4-4m5-4A11 11 0 0 1 12 3a11 11 0 0 1-8 3c0 5.5 3.5 10.7 8 12 4.5-1.3 8-6.5 8-12z"/>

            </svg>

          </div>

          <p class="font-semibold">
            Secure Access
          </p>

          <p class="text-xs text-slate-500 mt-1">
            Protected clinic data
          </p>

        </div>


      </div>

    </div>


    <!-- Footer -->

    <div class="relative z-10
                    flex items-center
                    justify-between
                    text-xs
                    text-slate-500">

            <span>
                Sunrise Dental Clinic
            </span>

      <span>
                Colombo, Sri Lanka
            </span>

    </div>


  </section>



  <!-- ================================================= -->
  <!-- RIGHT SIDE LOGIN -->
  <!-- ================================================= -->

  <section class="min-h-screen
                    flex
                    items-center
                    justify-center
                    px-5
                    sm:px-8
                    py-10">


    <div class="w-full max-w-md">


      <!-- Mobile logo -->

      <div class="lg:hidden
                        flex
                        items-center
                        gap-3
                        mb-10">

        <div class="w-11 h-11
                            bg-cyan-500
                            rounded-xl
                            flex items-center
                            justify-center
                            font-bold
                            text-slate-950">

          S

        </div>

        <div>

          <h1 class="font-bold text-slate-900">
            Sunrise Dental Clinic
          </h1>

          <p class="text-xs text-slate-500">
            Clinic Management
          </p>

        </div>

      </div>


      <!-- Heading -->

      <div class="mb-8">

        <p class="text-sm
                          font-semibold
                          text-cyan-600
                          uppercase
                          tracking-wider">

          Staff Portal

        </p>

        <h2 class="text-3xl
                           sm:text-4xl
                           font-bold
                           tracking-tight
                           text-slate-950
                           mt-2">

          Welcome back

        </h2>

        <p class="text-slate-500 mt-3">
          Sign in to access the clinic management system.
        </p>

      </div>


      <!-- Error -->

      <%
        String error =
                (String) request.getAttribute("error");

        if (error != null && !error.isBlank()) {
      %>

      <div class="mb-6
                        flex
                        items-start
                        gap-3
                        bg-red-50
                        border border-red-200
                        text-red-700
                        px-4
                        py-4
                        rounded-xl">

        <div class="w-8 h-8
                            flex-shrink-0
                            bg-red-100
                            rounded-lg
                            flex
                            items-center
                            justify-center">

          <svg xmlns="http://www.w3.org/2000/svg"
               class="w-4 h-4"
               fill="none"
               viewBox="0 0 24 24"
               stroke="currentColor">

            <path stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M12 9v3m0 4h.01M10.3 3.7 2.7 17a2 2 0 0 0 1.7 3h15.2a2 2 0 0 0 1.7-3L13.7 3.7a2 2 0 0 0-3.4 0z"/>

          </svg>

        </div>


        <div>

          <p class="text-sm font-semibold">
            Sign in failed
          </p>

          <p class="text-sm mt-1">
            <%= error %>
          </p>

        </div>

      </div>

      <% } %>


      <!-- Login form -->

      <form action="<%= request.getContextPath() %>/login"
            method="post"
            class="space-y-5">


        <!-- Username -->

        <div>

          <label for="username"
                 class="block
                                  text-sm
                                  font-semibold
                                  text-slate-700
                                  mb-2">

            Username

          </label>


          <div class="relative">

            <div class="absolute
                                    inset-y-0
                                    left-0
                                    pl-4
                                    flex
                                    items-center
                                    pointer-events-none
                                    text-slate-400">

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


            <input type="text"
                   id="username"
                   name="username"
                   required
                   autocomplete="username"
                   placeholder="Enter your username"
                   class="w-full
                                      pl-12
                                      pr-4
                                      py-3.5
                                      bg-white
                                      border border-slate-300
                                      rounded-xl
                                      text-slate-900
                                      placeholder:text-slate-400
                                      outline-none
                                      focus:ring-4
                                      focus:ring-cyan-500/10
                                      focus:border-cyan-500
                                      transition">

          </div>

        </div>


        <!-- Password -->

        <div>

          <div class="flex
                                items-center
                                justify-between
                                mb-2">

            <label for="password"
                   class="block
                                      text-sm
                                      font-semibold
                                      text-slate-700">

              Password

            </label>

          </div>


          <div class="relative">

            <div class="absolute
                                    inset-y-0
                                    left-0
                                    pl-4
                                    flex
                                    items-center
                                    pointer-events-none
                                    text-slate-400">

              <svg xmlns="http://www.w3.org/2000/svg"
                   class="w-5 h-5"
                   fill="none"
                   viewBox="0 0 24 24"
                   stroke="currentColor">

                <path stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M12 11V7a4 4 0 0 0-8 0v4m2 0h12v10H6V11z"/>

              </svg>

            </div>


            <input type="password"
                   id="password"
                   name="password"
                   required
                   autocomplete="current-password"
                   placeholder="Enter your password"
                   class="w-full
                                      pl-12
                                      pr-12
                                      py-3.5
                                      bg-white
                                      border border-slate-300
                                      rounded-xl
                                      text-slate-900
                                      placeholder:text-slate-400
                                      outline-none
                                      focus:ring-4
                                      focus:ring-cyan-500/10
                                      focus:border-cyan-500
                                      transition">


            <button type="button"
                    id="togglePassword"
                    aria-label="Show password"
                    class="absolute
                                       inset-y-0
                                       right-0
                                       pr-4
                                       flex
                                       items-center
                                       text-slate-400
                                       hover:text-slate-700">

              <svg id="eyeIcon"
                   xmlns="http://www.w3.org/2000/svg"
                   class="w-5 h-5"
                   fill="none"
                   viewBox="0 0 24 24"
                   stroke="currentColor">

                <path stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6-3.5 6-9.5 6-9.5-6-9.5-6z"/>

                <circle cx="12"
                        cy="12"
                        r="3"
                        stroke-width="2"/>

              </svg>

            </button>

          </div>

        </div>


        <!-- Submit -->

        <button type="submit"
                class="w-full
                               bg-slate-950
                               hover:bg-slate-800
                               text-white
                               font-semibold
                               py-3.5
                               px-5
                               rounded-xl
                               shadow-lg
                               shadow-slate-900/10
                               focus:outline-none
                               focus:ring-4
                               focus:ring-slate-900/10
                               transition">

          Sign In to Dashboard

        </button>


      </form>


      <!-- Security notice -->

      <div class="mt-8
                        bg-slate-100
                        rounded-xl
                        px-4
                        py-4
                        flex
                        items-start
                        gap-3">

        <svg xmlns="http://www.w3.org/2000/svg"
             class="w-5 h-5
                            text-slate-500
                            flex-shrink-0
                            mt-0.5"
             fill="none"
             viewBox="0 0 24 24"
             stroke="currentColor">

          <path stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M9 12l2 2 4-4m5-4A11 11 0 0 1 12 3a11 11 0 0 1-8 3c0 5.5 3.5 10.7 8 12 4.5-1.3 8-6.5 8-12z"/>

        </svg>


        <p class="text-xs
                          leading-relaxed
                          text-slate-500">

          This system is restricted to authorized clinic
          staff. Keep your login credentials confidential
          and sign out when you finish using the system.

        </p>

      </div>


      <p class="text-center
                      text-xs
                      text-slate-400
                      mt-8">

        © 2026 Sunrise Dental Clinic

      </p>


    </div>

  </section>


</div>


<script>

  const passwordInput =
          document.getElementById("password");

  const togglePassword =
          document.getElementById("togglePassword");

  togglePassword.addEventListener("click", function () {

    if (passwordInput.type === "password") {

      passwordInput.type = "text";
      togglePassword.setAttribute(
              "aria-label",
              "Hide password"
      );

    } else {

      passwordInput.type = "password";
      togglePassword.setAttribute(
              "aria-label",
              "Show password"
      );
    }

  });

</script>


</body>

</html>