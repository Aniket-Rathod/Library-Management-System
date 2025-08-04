package servlet;

import dao.BookDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

//@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("id"));
        BookDAO dao = new BookDAO();

        boolean deleted = dao.deleteBook(bookId);

        if (deleted) {
            response.sendRedirect("jsp/manage_book.jsp");
        } else {
            response.sendRedirect("jsp/manage_book.jsp?error=delete");
        }
    }
}
