package servlets;

import com.pulse.Entity.Note;
import com.pulse.Helper.FactoryProvider;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class modifyservlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session s = null;
        Transaction tx = null;
        try {
            // Validate input parameters
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String noteIdParam = request.getParameter("noteId");

            if (title == null || content == null || noteIdParam == null || title.trim().isEmpty() || content.trim().isEmpty()) {
                throw new ServletException("Invalid parameters. Title, content, and noteId are required.");
            }

            // Parse noteId and open session
            int noteId = Integer.parseInt(noteIdParam.trim());
            s = FactoryProvider.getFactory().openSession();
            tx = s.beginTransaction();

            // Fetch the note and update
            Note note = s.get(Note.class, noteId);
            if (note == null) {
                throw new ServletException("Note not found for the provided ID.");
            }

            note.setTitle(title);
            note.setContent(content);
            note.setAddedDate(new Date());

            // Commit transaction
            tx.commit();

            // Redirect after successful update
            response.sendRedirect("all_notes.jsp");
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback(); // Rollback in case of error
            }
            e.printStackTrace();
            throw new ServletException("An error occurred while updating the note.", e);
        } finally {
            if (s != null) {
                s.close(); // Ensure session is closed
            }
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
        return "Servlet for modifying notes";
    }

}

