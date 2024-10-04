package servlets;

import com.pulse.Entity.Note;
import com.pulse.Helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class inputservlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Getting the parameters from the request
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            // Creating and saving the note
            Note note = new Note(title, content, new Date());
            Session session = FactoryProvider.getFactory().openSession();
            Transaction tx = session.beginTransaction();
            session.save(note);
            tx.commit();
            session.close();

            // Sending the response
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            // Adding background color to the page
            out.println("<html>");
            out.println("<head><title>Note Added</title></head>");
            out.println("<body style='background-color: #f0f8ff;'>"); // Light blue background color

            // Inline CSS to create a box around the content
            out.println("<div style='margin: 50px auto; width: 50%; border: 2px solid #4CAF50; padding: 20px; text-align: center; font-family: Arial, sans-serif;'>");
            out.println("<h1 style='color: #4CAF50;'>Note is added successfully!</h1>");
            out.println("<p><a href='all_notes.jsp' style='text-decoration: none; color: #2196F3;'>View All Notes</a></p>");
            out.println("</div>");

            // Closing body and HTML tags
            out.println("</body>");
            out.println("</html>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}


