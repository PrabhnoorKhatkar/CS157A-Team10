package artauction.auth;

import artauction.user.Admin;
import artauction.user.User;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/Admin/*")
public class AdminFilter extends HttpFilter {
    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws ServletException, IOException, IOException {
        HttpSession session = request.getSession();
        var user = session.getAttribute("user");
        if (user == null) {
            var url = String.format("%s/%s?from=%s", request.getContextPath(), Login.PAGE, request.getRequestURI());
            response.sendRedirect(url);
        }
        if (user instanceof Admin) {
            chain.doFilter(request, response); // proceed as normal
        } else if (user instanceof User) {
            var url = String.format("%s/%s?from=%s", request.getContextPath(), AdminSignup.PAGE, request.getRequestURI());
            response.sendRedirect(url);
        }
    }
}
