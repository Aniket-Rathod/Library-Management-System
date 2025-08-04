package servlet;

import dao.TransactionDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ReturnBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("bookId"));
        int userId = (int) request.getSession().getAttribute("userId");

        TransactionDAO dao = new TransactionDAO();
        dao.returnBook(userId, bookId);

        response.sendRedirect("ViewBorrowedBooksServlet");
    }
}
