<%-- 
    Document   : Logout
    Created on : May 25, 2023, 6:36:50 PM
    Author     : Shahjahan Akbar
--%>

<%@page contentType="text/html" import="classes.*,java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
            session.removeAttribute("uname");
              session.invalidate();
            response.sendRedirect("Login.jsp");
        %>
    </body>
</html>
