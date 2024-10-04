<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Main</title>
    <%@include file="components.jsp"%>
    <style>
      body {
        background-color: #f8f9fa;
      }
      .container {
        margin-top: 50px;
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
      .form-group label {
        font-weight: bold;
      }
      .btn-primary {
        background-color: #3300cc;
        border-color: #3300cc;
      }
      .btn-primary:hover {
        background-color: #290099;
        border-color: #290099;
      }
    </style>
  </head>
  <body>
      <%@include file="navbar.jsp"%>
      <div class="container">
          <h2 class="mb-4">Add a Note</h2>
          <form action="inputservlet" method="post">
                <div class="form-group">
                  <label for="title">Title</label>
                  <input type="text" class="form-control" name="title" id="title" required>
                </div>
              <div class="form-group">
                <label for="content">Content</label>
                <textarea name="content" class="form-control" id="content" required rows="5"></textarea>
              </div>
                <button type="submit" class="btn btn-primary">Submit</button>
          </form>
      </div>
  </body>
</html>
