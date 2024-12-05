package artauction.auth;

import artauction.user.Admin;
import artauction.user.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.SecureRandom;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/App/AdminSignup")
public class AdminSignup extends HttpServlet {
    final static public String PAGE = "/App/adminsignup.jsp";

    private static String generateReferralCode(int length) {
        SecureRandom random = new SecureRandom();
        String allowedChars = "abcdefghijklmnopqrstuvwxyz" + "0123456789";
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(allowedChars.charAt(random.nextInt(allowedChars.length())));
        }
        return sb.toString();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var user = (User) req.getSession().getAttribute("user");
        String fromURL = req.getParameter("from");
        if (user instanceof Admin) {
            System.err.println("admin tried to register, declined");
            return;
        }
        var role = req.getParameter("role");
        var referralCode = req.getParameter("referralCode");
        var dao = new AuthDAO();
        try {
            var admin = dao.upgradeUserToAdmin(user, role, generateReferralCode(32), referralCode);
            assert admin != null;
            System.err.printf("Upgraded %s to admin, role %s", admin.getId(), admin.getRole());
            req.getSession().setAttribute("userID", admin.getId());
            req.getSession().setAttribute("user", admin);
            req.getSession().setAttribute("admin", true);

            if (fromURL == null || fromURL.isEmpty()) {
                resp.sendRedirect(req.getContextPath() + "/App/UserProfile"); //redirect to home page
                return;
            }
            resp.sendRedirect(fromURL);
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher(PAGE).forward(req, resp);
        }
    }
}
