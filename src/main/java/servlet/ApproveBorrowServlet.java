package servlet;

import dao.TransactionDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ApproveBorrowServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        try {
            // Retrieve the transaction ID from the form
            int transactionId = Integer.parseInt(request.getParameter("transactionId"));

            // Create DAO instance
            TransactionDAO dao = new TransactionDAO();

            // Update the request status to 'approved'
            boolean updated = dao.updateRequestStatus(transactionId, "approved");

            if (updated) {
                // If update successful, redirect back to request list
                response.sendRedirect(request.getContextPath() + "/BorrowRequestServlet");
            } else {
                // If update fails, show error
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to approve the borrow request.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            // If any exception, show error page
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred while approving the request.");
        }
    }
}
