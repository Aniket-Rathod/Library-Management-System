package servlet;

import dao.BookDAO;
import model.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String isbn = request.getParameter("isbn");
        int year = Integer.parseInt(request.getParameter("year"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Book book = new Book(title, author, isbn, year, quantity);
        BookDAO dao = new BookDAO();
        boolean success = dao.addBook(book);

        if (success) {
            request.setAttribute("message", "Book added successfully!");
        } else {
            request.setAttribute("error", "Failed to add book.");
        }

        request.getRequestDispatcher("jsp/add_book.jsp").forward(request, response);
    }
}

