package com.sunriseclinic.sunrisedentalclinic.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = {
        "/dashboard",
        "/appointments/*",
        "/patients/*",
        "/billing/*",
        "/reports/*",
        "/help"
})
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest,
                         ServletResponse servletResponse,
                         FilterChain filterChain)
            throws IOException, ServletException {

        HttpServletRequest request =
                (HttpServletRequest) servletRequest;

        HttpServletResponse response =
                (HttpServletResponse) servletResponse;

        HttpSession session = request.getSession(false);

        boolean loggedIn =
                session != null &&
                        session.getAttribute("loggedUser") != null;

        if (loggedIn) {

            filterChain.doFilter(request, response);

        } else {

            response.sendRedirect(
                    request.getContextPath() + "/login"
            );
        }
    }
}