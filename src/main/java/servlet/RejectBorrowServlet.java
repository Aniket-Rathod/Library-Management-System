package servlet;

import dao.TransactionDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RejectBorrowServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        try {
            // Retrieve transaction ID from the form
            int transactionId = Integer.parseInt(request.getParameter("transactionId"));

            // Create DAO object
            TransactionDAO dao = new TransactionDAO();

            // Update the request status to 'rejected'
            boolean updated = dao.updateRequestStatus(transactionId, "rejected");

            if (updated) {
                // If update successful, redirect to BorrowRequestServlet
                response.sendRedirect(request.getContextPath() + "/BorrowRequestServlet");
            } else {
                // If update failed, send internal server error
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to reject the borrow request.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Handle unexpected errors
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred while rejecting the request.");
        }
    }
}
