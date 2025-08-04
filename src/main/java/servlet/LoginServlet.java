package servlet;

import dao.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.authenticate(username, password);

        if (user != null) {
            // Set user info in session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);               // Save full User object
            session.setAttribute("userId", user.getUserId());  // Also save userId separately for transactions
            session.setAttribute("username", user.getUsername()); // (Optional) Save username if needed

            // Redirect based on role
            if ("librarian".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("jsp/admin_dashboard.jsp?login=success");
            } else {
                response.sendRedirect("jsp/user_dashboard.jsp?login=success");
            }
        } else {
            // Redirect to index.jsp with a query parameter to trigger login modal and alert
            response.sendRedirect(request.getContextPath() + "/jsp/index.jsp?login=fail");
        }
    }
}
