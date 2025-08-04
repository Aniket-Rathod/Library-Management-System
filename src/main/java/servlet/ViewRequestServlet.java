package servlet;

import dao.TransactionDAO;
import model.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ViewRequestServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        TransactionDAO dao = new TransactionDAO();
        List<Transaction> requests = dao.getRejectedOrPendingRequests();

        request.setAttribute("requests", requests);
        request.getRequestDispatcher("jsp/view_request.jsp").forward(request, response);
    }
}
