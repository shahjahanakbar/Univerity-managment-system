

<%@page contentType="text/html" import="classes.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <style>
            html, body {
            display: flex;
            justify-content: center;
            font-family: Roboto, Arial, sans-serif;
            font-size: 15px;
            }
            form {
            border: 5px solid #f1f1f1;
            }
            input[type=text], input[type=password], input[type=email] {
            width: 100%;
            padding: 16px 8px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            }
            button {
            background-color: lightslategray;
            color: white;
            padding: 14px 0;
            margin: 10px 0;
            border: none;
            cursor: grabbing;
            width: 100%;
            }
            h1 {
            text-align:center;
            fone-size:18;
            }
            button:hover {
            opacity: 0.8;
            }
            .formcontainer {
            text-align: left;
            margin: 24px 50px 12px;
            }
            .container {
            padding: 16px 0;
            text-align:left;
            }
            span.psw {
            float: right;
            padding-top: 0;
            padding-right: 15px;
            }
            /* Change styles for span on extra small screens */
            @media screen and (max-width: 300px) {
            span.psw {
            display: block;
            float: none;
            }
        </style>
    </head>
    <body>
        <form action="Login.jsp" method="post">
            <h1>Admin</h1>
            <div class="formcontainer">
                <hr/>
                <div class="container">
                    <label><strong>Enter UserName</strong></label>
                    <input type="email" placeholder="Enter UserName" name="uname" required>
                    <label><strong>Enter Password</strong></label>
                    <input type="Password" placeholder="Enter Password" name="pasw" required>
                </div>
                <button type="submit" name="Insert">Login</button>
                <a href="loginStudent.jsp" class="btn btn-secondary">Back</a>
               
                
                
        </form>
        
        
        
        <%

            Admin s = new Admin();
            DAOAdmin dao = new DAOAdmin();

            s.UserName = request.getParameter("uname");
            s.Password = request.getParameter("pasw");
            if (request.getParameter("Insert") != null) {
                Boolean user = dao.validateUser(s);
                Boolean password = dao.validatePassword(s);
                if (user == false) {
        %>
        <h3>You are not Registered.Kindly Register at <a 
                href="Signup.jsp">Sign Up</a></h3>
            <%
            } else {
                if (password == false) {
            %>
        <h3>Incorrect Password</h3>
        <%
                    } else {
                        try {
                            String User = request.getParameter("uname");
                            session.setAttribute("uname", User);
                            out.println(User);
                            response.sendRedirect("Form.jsp");
                        } catch (Exception ex) {
                            System.out.println(ex.toString());
                        }
                    }
                }
            }
        %>
        
        
    </body>
</html>
