package servlet;

import dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        boolean deleted = new UserDAO().deleteUser(id);

        if (deleted) {
            response.sendRedirect("jsp/view_user.jsp");
        } else {
            response.sendRedirect("jsp/view_user.jsp?error=delete");
        }
    }
}
