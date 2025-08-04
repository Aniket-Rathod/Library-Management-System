package servlet;

import dao.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        User user = new User(username, password, email, "user");
        UserDAO dao = new UserDAO();

        // Check if user already exists
        if (dao.userExists(username)) {
            response.sendRedirect("jsp/index.jsp?register=exists");
        } else {
            // Try registering
            boolean registrationSuccess = dao.registerUser(user);
            if (registrationSuccess) {
                response.sendRedirect("jsp/index.jsp?register=success");
            } else {
                response.sendRedirect("jsp/index.jsp?register=fail");
            }
        }
    }
}
