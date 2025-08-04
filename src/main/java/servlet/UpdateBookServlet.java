package servlet;

import dao.BookDAO;
import model.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class UpdateBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("bookId"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String isbn = request.getParameter("isbn");
        int publicationYear = Integer.parseInt(request.getParameter("year"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Book book = new Book(title, author, isbn, publicationYear, quantity);
        book.setBookId(bookId); // set the ID for update

        BookDAO dao = new BookDAO();
        boolean updated = dao.updateBook(book);

        if (updated) {
            response.sendRedirect("jsp/manage_book.jsp");
        } else {
            response.sendRedirect("jsp/edit_book.jsp?id=" + bookId + "&error=update");
        }
    }
}
