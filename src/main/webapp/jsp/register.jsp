<%@ page language="java" %>
<html>
<head><title>Register</title></head>
<body>
    <h2>Register</h2>
    <form action="<%= request.getContextPath() %>/RegisterServlet" method="post">
        Username: <input type="text" name="username"/><br/>
        Password: <input type="password" name="password"/><br/>
        Email: <input type="email" name="email"/><br/>
        <input type="submit" value="Register"/>
    </form>
    <p style="color:red">${error}</p>
</body>
</html>
