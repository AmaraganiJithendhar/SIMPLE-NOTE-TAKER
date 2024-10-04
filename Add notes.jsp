<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <title>Main</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
      body {
        background-color: #f8f9fa;
      }

      .container {
        margin-top: 50px;
        background-color: #ff0000; /* Red background color for the container */
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      }

      .form-group label {
        color: #495057;
        font-weight: bold;
      }

      .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
      }

      .btn-primary:hover {
        background-color: #0056b3;
        border-color: #004085;
      }

      .navbar {
        margin-bottom: 50px;
      }
    </style>

    <!-- Include components -->
    <%@include file="components.jsp"%>

  </head>
  <body>

    <!-- Navbar -->
    <%@include file="navbar.jsp"%>

    <!-- Form container -->
    <div class="container">
      <form action="inputservlet" method="post">
        <div class="form-group">
          <label for="title">Title</label>
          <input type="text" class="form-control" id="title" name="title" required>
        </div>

        <div class="form-group">
          <label for="content">Content</label>
          <textarea name="content" class="form-control" id="content" required rows="3"></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </div>

  </body>
</html>


