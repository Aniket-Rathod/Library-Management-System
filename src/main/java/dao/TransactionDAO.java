package dao;

import model.Book;
import model.Transaction;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {

    // 1. User sends a borrow request (status pending)
    public boolean createBorrowRequest(int userId, int bookId) {
        String sql = "INSERT INTO transactions (user_id, book_id, borrow_date, due_date, status) VALUES (?, ?, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 15 DAY), 'pending')";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, bookId);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 2. Get all books user has successfully borrowed
    public List<Book> getBorrowedBooks(int userId) {
        List<Book> borrowedBooks = new ArrayList<>();
        String sql = "SELECT b.* FROM books b JOIN transactions t ON b.book_id = t.book_id WHERE t.user_id = ? AND t.status = 'approved'";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setIsbn(rs.getString("isbn"));
                book.setPublicationYear(rs.getInt("publication_year"));
                book.setQuantity(rs.getInt("quantity"));
                borrowedBooks.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return borrowedBooks;
    }

    // 3. User returns a book (status changes to returned)
    public boolean returnBook(int userId, int bookId) {
        String sql = "UPDATE transactions SET return_date = CURDATE(), status = 'returned' WHERE user_id = ? AND book_id = ? AND status = 'approved'";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, bookId);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 4. Admin gets all pending borrow requests
    public List<Transaction> getPendingRequests() {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT * FROM transactions WHERE status = 'pending'";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Transaction t = new Transaction();
                t.setTransactionId(rs.getInt("transaction_id"));
                t.setUserId(rs.getInt("user_id"));
                t.setBookId(rs.getInt("book_id"));
                t.setBorrowDate(rs.getDate("borrow_date"));
                t.setStatus(rs.getString("status"));
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 5. Admin approves or rejects a request
    public boolean updateRequestStatus(int transactionId, String newStatus) {
        String sql = "UPDATE transactions SET status = ? WHERE transaction_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, newStatus);
            stmt.setInt(2, transactionId);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 6. Admin views rejected or still pending requests
    public List<Transaction> getRejectedOrPendingRequests() {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT * FROM transactions WHERE status IN ('rejected', 'pending')";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Transaction t = new Transaction();
                t.setTransactionId(rs.getInt("transaction_id"));
                t.setUserId(rs.getInt("user_id"));
                t.setBookId(rs.getInt("book_id"));
                t.setBorrowDate(rs.getDate("borrow_date"));
                t.setStatus(rs.getString("status"));
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
