<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="">

  <title>BookGanga - User Dashboard</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <!-- font awesome style -->
  <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet" />

</head>

<body>

  <div class="hero_area">

    <div class="hero_bg_box">
      <div class="bg_img_box">
        <img src="${pageContext.request.contextPath}/images/hero-bg.png" alt="">
      </div>
    </div>

    <!-- header section starts -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/user_dashboard.jsp">
            <span>
              BookGanga
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse"
                  data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                  aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
              <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>/jsp/user_dashboard.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/LogoutServlet">
                  <i class="fa fa-user" aria-hidden="true"></i> LOGOUT
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
    <!-- end header section -->

    <!-- slider section -->
    <section class="slider_section">
      <div id="customCarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container">
              <div class="row">
                <div class="col-md-6">
                  <div class="detail-box">
                    <h1>
                      Pages & <br> Stories
                    </h1>
                    <p>
                      "Discover a world of stories and knowledge — explore and read a wide range of books anytime, anywhere."
                    </p>
                    <div class="btn-box">
                      <a href="#" class="btn1">Read More</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="img-box">
                    <img src="${pageContext.request.contextPath}/images/slider-img.png" alt="">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <ol class="carousel-indicators">
          <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
        </ol>
      </div>
    </section>
    <!-- end slider section -->
  </div>

  <!-- service section -->
  <section class="service_section layout_padding">
    <div class="service_container">
      <div class="container">
        <div class="heading_container heading_center">
          <h2>
            Our <span>Services</span>
          </h2>
          <p>
            We let you easily view your borrowed books and request new titles to enjoy more reading adventures.
          </p>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="box">
              <div class="img-box">
                <img src="${pageContext.request.contextPath}/images/s2.png" alt="">
              </div>
              <div class="detail-box">
                <h5>Borrowed Books</h5>
                <p>Keep track of your borrowed books, check due dates, and manage your reading list all in one place.</p>
                <a href="<%= request.getContextPath() %>/jsp/borrowed_book.jsp">View</a>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="box">
              <div class="img-box">
                <img src="${pageContext.request.contextPath}/images/s3.png" alt="">
              </div>
              <div class="detail-box">
                <h5>Borrow Books</h5>
                <p>Borrow your favorite books with just a click and start reading instantly from our vast collection.</p>
                <a href="<%= request.getContextPath() %>/jsp/borrow_book.jsp">View</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- end service section -->

  <!-- about section -->
  <section class="about_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>About <span>Us</span></h2>
        <p>Books are your gateway to endless knowledge and adventure!</p>
      </div>
      <div class="row">
        <div class="col-md-6">
          <div class="img-box">
            <img src="${pageContext.request.contextPath}/images/about-img.png" alt="">
          </div>
        </div>
        <div class="col-md-6">
          <div class="detail-box">
            <h3>We Are BookGanga</h3>
            <p>
              At BookGanga, we believe books have the power to open minds, spark imagination, and transform lives.
              Whether you're a curious student or an avid book lover, we make reading accessible and fun.
            </p>
            <p>
              Our platform offers a rich collection of genres, authors, and languages, paired with seamless borrowing features and personalized recommendations.
            </p>
            <a href="#">Read More</a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- end about section -->

  <!-- footer section -->
  <section class="footer_section">
    <div class="container">
      <p>
        &copy; <span id="displayYear"></span> All Rights Reserved By
        <a href="#">BookGanga</a>
      </p>
    </div>
  </section>

  <!-- jQuery -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
  <!-- Popper.js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <!-- Bootstrap JS -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
  <!-- Owl Carousel -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <!-- Custom JS -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>

</body>

</html>
