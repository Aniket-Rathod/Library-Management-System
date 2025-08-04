<%@ page import="model.Book, dao.BookDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Book book = new BookDAO().getBookById(id); // Ensure this method exists
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Edit Book</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    html, body {
      height: 100%;
      margin: 0;
    }
    body {
      display: flex;
      flex-direction: column;
      font-family: 'Segoe UI', sans-serif;
      background-color: #f4f6fa;
    }
    .main-content {
      flex: 1;
    }
    .sidebar {
      min-height: 100vh;
      background-color: #4997ac;
      color: white;
    }
    .sidebar a {
      color: rgb(0, 0, 0);
      text-decoration: none;
      padding: 10px 20px;
      display: block;
    }
    .sidebar a:hover {
      background-color: #7472da;
    }
    .card-title {
      font-weight: bold;
    }
    .navbar-custom {
      background-color: #ac4949;
    }
    .navbar-custom .navbar-brand,
    .navbar-custom .nav-link {
      color: white;
    }
    footer {
      background-color: #f1f1f1;
      text-align: center;
      padding: 10px 0;
      width: 100%;
    }
  </style>
</head>
<body>

  <!-- Header Navbar -->
  <nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">BookGanga</a>
      <div class="d-flex">
        <button class="btn btn-light me-2">Admin</button>
        <a href="<%= request.getContextPath() %>/LogoutServlet" class="btn btn-light">Logout</a>
      </div>
    </div>
  </nav>

  <!-- Main Content Wrapper -->
  <div class="main-content">
    <div class="container-fluid">
      <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar py-4">
          <a href="jsp/admin_dashboard.jsp">Dashboard</a>
          <div class="dropdown">
            <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#">Books</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="jsp/add_book.jsp">Add Books</a></li>
              <li><a class="dropdown-item" href="jsp/manage_book.jsp">Manage Books</a></li>
            </ul>
          </div>
          <div class="dropdown mt-2">
            <a class="dropdown-toggle" data-bs-toggle="dropdown" href="#">Requests</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="jsp/borrow_request.jsp">Borrow Requests</a></li>
              <li><a class="dropdown-item" href="jsp/view_request.jsp">View Requests</a></li>
            </ul>
          </div>
          <div class="dropdown mt-2">
            <a href="jsp/view_user.jsp">Users</a>
          </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-10 p-4">
          <h2>Edit Book</h2>
          <form action="<%= request.getContextPath() %>/UpdateBookServlet" method="post">
              <input type="hidden" name="bookId" value="<%= book.getBookId() %>"/>
              <div class="mb-3">
                  <label>Title</label>
                  <input type="text" name="title" class="form-control" value="<%= book.getTitle() %>" required/>
              </div>
              <div class="mb-3">
                  <label>Author</label>
                  <input type="text" name="author" class="form-control" value="<%= book.getAuthor() %>" required/>
              </div>
              <div class="mb-3">
                  <label>ISBN</label>
                  <input type="text" name="isbn" class="form-control" value="<%= book.getIsbn() %>" required/>
              </div>
              <div class="mb-3">
                  <label>Publication Year</label>
                  <input type="number" name="year" class="form-control" value="<%= book.getPublicationYear() %>" required/>
              </div>
              <div class="mb-3">
                  <label>Quantity</label>
                  <input type="number" name="quantity" class="form-control" value="<%= book.getQuantity() %>" required/>
              </div>
              <button type="submit" class="btn btn-primary">Update Book</button>
          </form>
        </div> <!-- End Main Content -->
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer>
    <p>&copy; 2025 BookGanga Library Dashboard. All rights reserved.</p>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
