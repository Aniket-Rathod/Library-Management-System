package servlet;

import dao.TransactionDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class BorrowBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("bookId"));
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId"); // assuming userId stored in session

        if (userId != null) {
            TransactionDAO dao = new TransactionDAO();
            boolean success = dao.createBorrowRequest(userId, bookId);
            if (success) {
                session.setAttribute("borrowMessage", "Request sent for your borrow book");
            } else {
                session.setAttribute("borrowMessage", "Failed to send borrow request. Please try again.");
            }
        } else {
            session.setAttribute("borrowMessage", "Session expired. Please login again.");
        }

        response.sendRedirect(request.getContextPath() + "/jsp/borrow_book.jsp");
    }
}
