<%-- 
    Document   : Update
    Created on : May 25, 2023, 6:37:00 PM
    Author     : Shahjahan Akbar
--%>

<%@page contentType="text/html" import="classes.*,java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
        
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
            } 
        </style>
        
    </head>
    <body>
        <%
            Student s = new Student();
            DAOStudent dao = new DAOStudent();
            s.UserName = request.getParameter("email");
            s = dao.SelectById(s);
        %>
        <form action="Update.jsp" method="post">
            <h1>Update Form</h1>
            <div class="formcontainer">
                <hr/>
                <div class="container">
                    <label><strong>Name</strong></label>
                           <input type="text" placeholder="Enter Full Name" name="name" value="<%=s.Name%>" required>
                    <label><strong>CNIC</strong></label>
                    <input type="text" placeholder="Enter Cnic" name="cnic" value="<%= s.Cnic%>" 
                           required>
                    <label><strong>Cell No</strong></label>
                           <input type="text" placeholder="Enter Cell.No" name="contact" value="<%=s.Contact%>" required>
                    <label><strong>UserName(Email)</strong></label>
                           <input type="email" placeholder="Enter UserName" name="email" value="<%=s.UserName%>" required><br>
                    <label><strong>Password</strong></label>
                           <input type="Password" placeholder="Enter Password" name="pasw" value="<%=s.Password%>" required>
                    <label><strong><h4>Select Gender</h4></strong></label>
                    Male<input type="radio" name="gender" value="male">&emsp;
                    Female<input type="radio" name="gender" value="female"><br><br>
                    <label><strong><b>Choose Nationality<b></strong></label>&emsp;
                                    <select name="nationality" value="<%= s.Nationality%>" >
                                        <option disabled="disabled" selected="selected">Choose</option>
                                        <option value="Pakistani">Pakistani</option>
                                        <option value="Indian">Indian</option>
                                        <option value="Aghani">Afghani</option>
                                    </select><br>
                                    </div>
                                    <button type="submit" name="Insert">Update</button>
                                    </form>
                                    <%
                                        s.Name = request.getParameter("name");
                                        s.Cnic = request.getParameter("cnic");
                                        s.Contact = request.getParameter("contact");
                                        s.UserName = request.getParameter("email");
                                        s.Password = request.getParameter("pasw");
                                        s.Gender = request.getParameter("gender");
                                        s.Nationality = request.getParameter("nationality");
                                        if (request.getParameter("Insert") != null) {
                                            int res = dao.Update(s);
                                            if (res > 0) {
                                                response.sendRedirect("Display.jsp");
                                            }
                                        }
                                    %>
    </body>
</html>
