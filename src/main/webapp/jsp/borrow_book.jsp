<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Book, dao.BookDAO" %>
<%
    List<Book> books = new BookDAO().getAllBooks();
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  
  <title>User - BorrowBook</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bootstrap.css" />

  <!-- Fonts style -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

  <!-- Owl Carousel stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <!-- Font Awesome style -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/font-awesome.min.css" />

  <!-- Custom styles for this template -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" />
  
  <!-- Responsive style -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/responsive.css" />
</head>

<body class="sub_page">

  <div class="hero_area">

    <div class="hero_bg_box">
      <div class="bg_img_box">
        <img src="<%= request.getContextPath() %>/images/hero-bg.png" alt="Background">
      </div>
    </div>

    <!-- Header section -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="#">
            <span>BookGanga</span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
                  aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="user_dashboard.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath() %>/LogoutServlet">
                  <i class="fa fa-user" aria-hidden="true"></i> Logout
                </a>
              </li>
              <form class="form-inline">
                <button class="btn my-2 my-sm-0 nav_search-btn" type="submit">
                  <i class="fa fa-search" aria-hidden="true"></i>
                </button>
              </form>
            </ul>
          </div>
        </nav>
      </div>
    </header>
    <!-- End Header section -->
  </div>

  <!-- Borrow Books Section -->
  <section class="about_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>Borrow <span>Books</span></h2>
      </div>
      <div class="row">
  <% for (Book book : books) { %>
  <div class="col-md-4 mb-4">
    <div class="card h-100 shadow-sm">
      <div class="card-body text-dark">
        <h5 class="card-title"><%= book.getTitle() %></h5>
        <p class="card-text"><strong>Author:</strong> <%= book.getAuthor() %></p>
        <p class="card-text"><strong>ISBN:</strong> <%= book.getIsbn() %></p>
        <p class="card-text"><strong>Year:</strong> <%= book.getPublicationYear() %></p>
        <p class="card-text"><strong>Quantity:</strong> <%= book.getQuantity() %></p>
        <form action="<%= request.getContextPath() %>/BorrowBookServlet" method="post">
          <input type="hidden" name="bookId" value="<%= book.getBookId() %>"/>
          <button type="submit" class="btn btn-primary btn-block mt-2">Borrow</button>
        </form>
      </div>
    </div>
  </div>
  <% } %>
</div>

    </div>
  </section>
  <!-- End Borrow Books Section -->

  <!-- Footer section -->
  <section class="footer_section">
    <div class="container">
      <p>
        &copy; <span id="displayYear"></span> All Rights Reserved By
        <a href="#">BookGanga</a>
      </p>
    </div>
  </section>
  <!-- End Footer section -->

  <!-- jQuery -->
  <script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
  <!-- Popper JS -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <!-- Bootstrap JS -->
  <script src="<%= request.getContextPath() %>/js/bootstrap.js"></script>
  <!-- Owl Carousel JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <!-- Custom JS -->
  <script src="<%= request.getContextPath() %>/js/custom.js"></script>
  <!-- Google Maps (optional if you use maps) -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
  
  <!-- Borrow Request Success Alert -->
<%
    String borrowMessage = (String) session.getAttribute("borrowMessage");
    if (borrowMessage != null) {
%>
<script>
    alert("<%= borrowMessage %>");
</script>
<%
        session.removeAttribute("borrowMessage"); // Important: clear after showing
    }
%>

</body>
</html>

</body>

</html>
