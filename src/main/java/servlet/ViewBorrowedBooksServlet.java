package servlet;

import dao.TransactionDAO;
import model.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ViewBorrowedBooksServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    	System.out.println("Borrowed Servlet");
        int userId = (int) request.getSession().getAttribute("userId");
        TransactionDAO dao = new TransactionDAO();
        List<Book> borrowedBooks = dao.getBorrowedBooks(userId);
        

        request.setAttribute("borrowedBooks", borrowedBooks);
        request.getRequestDispatcher("jsp/borrowed_book.jsp").forward(request, response);
    }
}
