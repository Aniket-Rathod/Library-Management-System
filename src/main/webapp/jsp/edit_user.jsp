<%@ page import="model.User, dao.UserDAO" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    User user = new UserDAO().getUserById(id);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Edit User</title>
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
          <h2>Edit User</h2>
          <form action="<%= request.getContextPath() %>/EditUserServlet" method="post">
            <input type="hidden" name="userId" value="<%= user.getUserId() %>" />
            <div class="mb-3">
              <label>Username</label>
              <input type="text" name="username" class="form-control" value="<%= user.getUsername() %>" required />
            </div>
            <div class="mb-3">
              <label>Email</label>
              <input type="email" name="email" class="form-control" value="<%= user.getEmail() %>" required />
            </div>
            <div class="mb-3">
              <label>Role</label>
              <select name="role" class="form-control">
                <option value="user" <%= user.getRole().equals("user") ? "selected" : "" %>>User</option>
                <option value="librarian" <%= user.getRole().equals("librarian") ? "selected" : "" %>>Librarian</option>
              </select>
            </div>
            <button type="submit" class="btn btn-primary">Update User</button>
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
