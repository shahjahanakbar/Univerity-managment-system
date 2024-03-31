<%-- 
    Document   : regDelete
    Created on : May 27, 2023, 2:49:04 AM
    Author     : Shahjahan Akbar
--%>


<%@page contentType="text/html" import="classes.*,java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <body>
        <%
            Student s = new Student();
            DAOStudent dao = new DAOStudent();
            s.UserName = request.getParameter("email");
            int res = dao.Delete(s);
            if (res > 0) {
                response.sendRedirect("Display.jsp");
            }
        %>
    </body>
</html>

