<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>BookGanga</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-image: url('<%= request.getContextPath() %>/images/Background.jpg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      color: white;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .container {
      display: flex;
      flex-direction: row;
      width: 90%;
      max-width: 1200px;
      margin: auto;
      background-color: #8e5db9;
    }

    .info-section, .image-section {
      flex: 1;
      padding: 40px;
    }

    .logo {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 30px;
      color: #00c6a9;
    }

    h1 {
      font-size: 42px;
      font-weight: 800;
      line-height: 1.3;
    }

    p {
      margin: 20px 0;
      font-size: 16px;
      color: #bfc8cf;
    }

    .buttons {
      margin-top: 30px;
    }

    .btn {
      padding: 12px 24px;
      border: none;
      margin-right: 10px;
      border-radius: 6px;
      font-weight: bold;
      cursor: pointer;
      transition: 0.3s;
    }

    .btn.about {
      background-color: #e1dc4a;
      color: black;
    }

    .btn.quote {
      background-color: #5783db;
      color: black;
    }

    .btn:hover {
      opacity: 0.9;
    }

    .image-section {
      background-color: #20cfcf;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .image-section img {
      max-width: 100%;
      height: auto;
      border-radius: 10px;
    }

    /* Modal Styles */
    .modal {
      display: none;
      position: fixed;
      z-index: 999;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.7);
    }

    .modal-content {
      background: #1f1f1f;
      color: #fff;
      border-radius: 10px;
      padding: 30px;
      width: 320px;
      margin: 100px auto;
      text-align: center;
      box-shadow: 0 0 20px #00ff00;
    }
    
	    .close {
	  color: #aaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: black;
	  text-decoration: none;
	  cursor: pointer;
	}

    .modal-content h2 {
      color: #00ff00;
      font-size: 24px;
      margin-bottom: 20px;
    }

    .modal-content input {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      background: #333;
      color: #fff;
      border: none;
      border-radius: 5px;
      font-size: 16px;
    }

    .login-btn {
      width: 100%;
      padding: 12px;
      background: #00ff00;
      color: #000;
      font-weight: bold;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 18px;
    }

    @media (max-width: 768px) {
      .container {
        flex-direction: column;
      }

      .info-section, .image-section {
        padding: 20px;
      }

      h1 {
        font-size: 32px;
      }
    }
  </style>
</head>
<body>
  <div class="container">
    <section class="info-section">
      <div class="logo">BookGanga</div>
      <h1>There is no friend, <br> as loyal as a book.</h1>
      <p>
        Book Ganga is a smart and affordable book rental platform that lets you explore a world of knowledge without the burden of buying.<br>
        Whether you're a student preparing for exams, a casual weekend reader, or a curious mind hungry for stories <br>
        — Book Ganga has something for everyone.
      </p>
      <div class="buttons">
        <button class="btn about">Login</button>
        <button class="btn quote">Register</button>
      </div>
    </section>
    <section class="image-section">
      <img src="<%= request.getContextPath() %>/images/Cover.png" alt="BookGanga illustration" />
    </section>
  </div>

  <!-- LOGIN MODAL -->
  <div id="loginModal" class="modal">
    <div class="modal-content">
      <h2>LOG IN</h2>
      <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <button type="submit" class="login-btn">Login</button>
      </form>
    </div>
  </div>

  <!-- REGISTER MODAL -->
  <div id="registerModal" class="modal">
    <div class="modal-content">
      <h2>REGISTER</h2>
      <form action="<%= request.getContextPath() %>/RegisterServlet" method="post">
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <input type="email" name="email" placeholder="Email" required />
        <button type="submit" class="login-btn">Register</button>
      </form>
    </div>
  </div>



<!-- Error Handling of Login & Registration -->
  <script>
    document.querySelector('.btn.about').addEventListener('click', () => {
      document.getElementById('loginModal').style.display = 'block';
    });

    document.querySelector('.btn.quote').addEventListener('click', () => {
      document.getElementById('registerModal').style.display = 'block';
    });

    window.addEventListener('click', function (e) {
      const loginModal = document.getElementById('loginModal');
      const registerModal = document.getElementById('registerModal');
      if (e.target === loginModal) loginModal.style.display = 'none';
      if (e.target === registerModal) registerModal.style.display = 'none';
    });
    
  const params = new URLSearchParams(window.location.search);

  // Handle login failure
  if (params.get('login') === 'fail') {
    console.log("Login failed, showing login modal");
    document.getElementById('loginModal').style.display = 'block';
    alert('Login failed: Invalid username or password.');
  }

  // Handle registration messages
  const registerStatus = params.get('register');
  if (registerStatus === 'fail') {
    console.log("Registration failed");
    document.getElementById('registrationModal').style.display = 'block';
    alert('Registration failed: Invalid data or error occurred.');
  } else if (registerStatus === 'exists') {
    console.log("Registration failed: User already exists");
    document.getElementById('registrationModal').style.display = 'block';
    alert('Registration failed: Username already exists.');
  } else if (registerStatus === 'success') {
    console.log("Registration successful");
    alert('Registration successful! You can now login.');
  }

  // Open login modal on 'about' button click
  const aboutBtn = document.querySelector('.btn.about');
  if (aboutBtn) {
    aboutBtn.addEventListener('click', () => {
      document.getElementById('loginModal').style.display = 'block';
    });
  }

  // Open registration modal on 'quote' button click
  const quoteBtn = document.querySelector('.btn.quote');
  if (quoteBtn) {
    quoteBtn.addEventListener('click', () => {
      console.log("Register button clicked");
      document.getElementById('registrationModal').style.display = 'block';
    });
  }

  // Close modals when clicking outside of them
  window.addEventListener('click', function (e) {
    const loginModal = document.getElementById('loginModal');
    const registerModal = document.getElementById('registrationModal');
    if (e.target === loginModal) loginModal.style.display = 'none';
    if (e.target === registerModal) registerModal.style.display = 'none';
  });
  </script>
  
  
  <script>
  	window.addEventListener('DOMContentLoaded', () => {
    const params = new URLSearchParams(window.location.search);
    const status = params.get("register");

    if (status === "success") {
      alert("✅ Registration successful! You can now login.");
    } else if (status === "fail") {
      alert("❌ Registration failed. Please try again.");
      document.getElementById('registrationModal').style.display = 'block';
    } else if (status === "exists") {
      alert("⚠️ Account already exists. Please use a different username.");
      document.getElementById('registrationModal').style.display = 'block';
    }
  });
</script>
 <!-- Error Handling of Login & Registration -->
  
  
  
</body>
</html>
