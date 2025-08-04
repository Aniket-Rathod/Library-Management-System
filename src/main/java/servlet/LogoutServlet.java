package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Send response with JavaScript confirmation
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><head><title>Logging Out...</title></head><body>");
        out.println("<script type='text/javascript'>");
        out.println("if (confirm('Save and exit the session?')) {");
        out.println("    window.location.href = 'jsp/index.jsp';");
        out.println("} else {");
        out.println("    window.history.back();");
        out.println("}");
        out.println("</script>");
        out.println("</body></html>");
    }
}
