<%-- 
    Document   : adminDisplay
    Created on : May 26, 2023, 1:07:45 AM
    Author     : Shahjahan Akbar
--%>

<%@page contentType="text/html" import="classes.*,java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        
         <style>
        /* Custom CSS styles */
        body {
            padding: 20px;
        }

        .container {
            max-width: 600px;
        }
        table {
            max-width: 600px;
        }

        .btn {
            margin-right: 5px;
        }
        
        
         th {
            background-color: #f2f2f2;
            text-align: left;
            padding: 8px;
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        td {
            padding: 8px;
        }
        
        tr:hover {
            background-color: #e2e2e2;
        }

        /* Add border to table cells */
        td, th {
            border: 1px solid #dddddd;
        }
        
        
        
    </style>
        
    </head>
    <body>
        <%
            try {
                

                    DAOAdmin dao = new DAOAdmin();
                    ArrayList<Admin> list = dao.SelectAll();
        %>
    <center>
        <div >
        <h1>Admin List</h1>
        <table border="1px" >
            <tr>

                <th>Name</th>
                <th>Email</th>
                <th>Cnic</th>
                <th>Contact.No</th>
                <th>Password</th>
                <th>Gender</th>
                <th>Nationality</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <% for (Admin s : list) {%>
            <tr>
                
                <td><%=s.Name%></td>
                <td><%=s.UserName%></td>
                <td><%=s.Cnic%></td>
                <td><%=s.Contact%></td>
                <td><%=s.Password%></td>
                <td><%=s.Gender%></td> 
                <td><%=s.Nationality%></td>
                <td><a href="updateAdmin.jsp?email=<%=s.UserName%>" class="btn btn-primary btn-sm">Update</a></td>
                <td> <a href="deleteAdmin.jsp?email=<%=s.UserName%>" class="btn btn-danger btn-sm">Delete</a></td>
            </tr>
            <% } %>
        </table>
        <br>
        <!--<button <a href="Logout.jsp">Logout</button>-->
        </div>
    </center>
        <center><form action="Form.jsp"><input type="submit" value="Back" ></form></center>
    <% 
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }%>
    </body>
</html>