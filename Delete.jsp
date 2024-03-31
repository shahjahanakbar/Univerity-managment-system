

<%@page contentType="text/html" import="classes.*,java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <body>
        <%
            Form s = new Form();
            DAOForm dao = new DAOForm();
            s.UserName = request.getParameter("email");
            int res = dao.Delete(s);
            if (res > 0) {
                response.sendRedirect("formDisplay.jsp");
            }
        %>
    </body>
</html>
