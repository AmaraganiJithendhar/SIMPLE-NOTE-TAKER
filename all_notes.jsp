<%@page import="java.util.List"%>
<%@page import="com.pulse.Entity.Note"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.pulse.Helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>All Notes</title>
    <%@include file="components.jsp"%>
    <style>
        .card-img-top {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin: 0 auto;
        }
        .card {
            margin-bottom: 20px;
        }
        .card-body {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .card-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <h1>All Notes</h1>
    <div class="container">
        <div class="row">
            <% 
                Session s = FactoryProvider.getFactory().openSession();
                Query q = s.createQuery("from Note");
                List<Note> note = q.list();
                for(Note notes : note) {
            %>
            <div class="col-12">
                <div class="card">
                    <img class="card-img-top" src="img/note.png" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"><%= notes.getTitle() %></h5>
                        <p class="card-text"><%= notes.getContent() %></p>
                        <div class="card-buttons">
                            <a href="DeleteServlet?note_id=<%=notes.getId()%>" class="btn btn-danger">Delete</a>
                            <a href="update.jsp?note_id=<%=notes.getId()%>" class="btn btn-primary">Update</a>
                        </div>
                    </div>
                </div>
            </div>
            <% 
                }    
                s.close();
            %>
        </div>
    </div>
</body>
</html>



