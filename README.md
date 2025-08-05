# Library-Management-System:
This project is a Library Management System (LMS) a dynamic web-based application designed to make handling library operations easier for librarians and users. 
It’s built for educational purposes and uses Java Servlets, JSP, and MySQL so you can learn full-stack Java development.

@ Key Features:
- Manage library catalog (books, availability, details)
- Register as a new user or log in
- Borrow and return books online
- Librarian approval process for borrowing requests
- Dashboards for librarians and users
- All data is securely handled with real-time updates

@ Core Objectives:
- Build a web app using Java Servlets for backend and JSP for the frontend
- Use MySQL for data storage and management
- Implement role-based access (Librarian/Admin, User/Borrower)
- Support full CRUD operations: add, view, update, and delete books and users
- Manage user sessions and authentication

@ User Roles:
1. Librarian (Admin)
- Add, update, and delete books in the inventory
- View all registered users
- Approve or reject book borrow/return requests
- Monitor transactions: borrow/return history, overdue books
- Get a dashboard overview: total books, borrowed count, overdue books

2. User (Borrower)
- Register and log in to the library portal
- Browse/search the catalog by title, author, etc.
- Request to borrow available books
- Return books they've borrowed

@ Technologies Used:
- Backend: Java Servlets (handles requests, business logic)
- Frontend: JSP (builds and displays web pages)
- Database: MySQL
- Web Server: Apache Tomcat
- Java Version: JDK 8 or higher
- IDE: Eclipse or IntelliJ IDEA
- Build Tool (Optional): Maven for dependency management
- Styling: Basic CSS (Bootstrap optional)

@ Database Schema Overview
1. Books Table
- book_id (Primary Key)
- title, author
- isbn (unique)
- publication_year
- quantity

2. Users Table
- user_id (Primary Key)
- username (unique)
- password (hashed)
- role (librarian or user)
- email

3. Transactions Table
- transaction_id (Primary Key)
- user_id (Foreign Key)
- book_id (Foreign Key)
- borrow_date, due_date, return_date
- status (pending, approved, returned, overdue)

@ Architecture:
- Follows the Model-View-Controller (MVC) pattern:
Model: Java classes for Book, User, Transaction entities
View: JSP pages for the web interface
Controller: Servlets handling requests and responses
- Ensures smooth data flow, separation of concerns, and easy future scaling.

@ How To Run:
1. Set up MySQL and create the database using the provided SQL scripts.
2. Import the source code into Eclipse or IntelliJ IDEA.
3. Start Apache Tomcat and deploy the application.
4. Access the LMS portal via your browser to test all features.
