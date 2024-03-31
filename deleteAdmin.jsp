<%-- 
    Document   : deleteAdmin
    Created on : May 27, 2023, 2:28:14 AM
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
            Admin s = new Admin();
            DAOAdmin dao = new DAOAdmin();
            s.UserName = request.getParameter("email");
            int res = dao.Delete(s);
            if (res > 0) {
                response.sendRedirect("adminDisplay.jsp");
            }
        %>
    </body>
</html>
