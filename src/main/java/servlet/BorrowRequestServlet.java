package servlet;

import dao.TransactionDAO;
import model.Transaction;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class BorrowRequestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        try {
            TransactionDAO dao = new TransactionDAO();
            List<Transaction> pendingRequests = dao.getPendingRequests();

            request.setAttribute("pendingRequests", pendingRequests);
            request.getRequestDispatcher("jsp/borrow_request.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load requests.");
        }
    }
}
