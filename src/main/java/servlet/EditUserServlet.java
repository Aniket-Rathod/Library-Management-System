package servlet;

import dao.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class EditUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        User user = new User();
        user.setUserId(userId);
        user.setUsername(username);
        user.setEmail(email);
        user.setRole(role);

        boolean updated = new UserDAO().updateUser(user);
        if (updated) {
            response.sendRedirect("jsp/view_user.jsp");
        } else {
            response.sendRedirect("/jsp/edit_user.jsp?id=" + userId + "&error=1");
        }
    }
}
