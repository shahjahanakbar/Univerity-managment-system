

<%@page contentType="text/html" import="java.util.*,classes.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Registration Management System</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
      overflow: hidden;
    }
    
    .container {
      max-width: 600px;
      margin: 0 auto;
      padding: 40px;
      text-align: center;
      position: relative;
      z-index: 1;
    }
    
    h1 {
      font-size: 36px;
      font-weight: bold;
      color: #333333;
      margin-bottom: 30px;
    }
    
    .btn-primary {
      font-size: 24px;
      font-weight: bold;
      padding: 20px 40px;
      margin-bottom: 20px;
    }
    
    .btn-primary:hover {
      background-color: #007bff;
    }
    
    .btn-secondary {
      font-size: 24px;
      font-weight: bold;
      padding: 20px 40px;
      margin-bottom: 20px;
    }
    
    .btn-secondary:hover {
      background-color: #6c757d;
    }
    
    .btn-success {
      font-size: 24px;
      font-weight: bold;
      padding: 20px 40px;
      margin-bottom: 20px;
    }
    
    .btn-success:hover {
      background-color: #28a745;
    }
    
    .navbar {
      background-color: #333333;
      padding: 10px;
    }
    
    .navbar-brand {
      color: #ffffff;
      font-size: 24px;
      font-weight: bold;
    }
    
    .navbar-nav {
      margin-left: auto;
    }
    
    .nav-link {
      color: #ffffff;
      font-size: 18px;
      font-weight: bold;
      margin-left: 10px;
    }
    
    .nav-link:hover {
      color: #28a745;
    }
  </style>
</head>
<body>
    
     <%
            try {
                HttpSession sesion = request.getSession();
//                String a = session.getAttribute("sesion").toString();
                if (request.getSession().getAttribute("uname") == null) {

                    response.sendRedirect("Login.jsp");
                } else {
                    
                     
                     
                     
                    DAOAdmin dao = new DAOAdmin();
                    ArrayList<Admin> list = dao.SelectAll();
        %>
    
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Student Registration</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="adminAdd.jsp">Add Admin</a>
        </li>
        
        
        <li class="nav-item">
          <a class="nav-link btn-danger" href="Logout.jsp">Logout</a>
        </li>
      </ul>
    </div>
  </nav>
    
  <div class="container">
      
      <h1>Management System</h1>
      
     
    
    <a href="adminDisplay.jsp" class="btn btn-primary">Admin Records</a>
    <a href="Display.jsp" class="btn btn-secondary">Student Registration Records</a>
    <a href="formDisplay.jsp" class="btn btn-success">Student Admission Records</a>
  </div>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
       <%
  
      }
                                        
                                  } catch(Exception e){}
                                    %>
                                   
  
  
</body>


</html>

