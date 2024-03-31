<%-- 
    Document   : Studentdata
    Created on : May 25, 2023, 6:23:19 PM
    Author     : Shahjahan Akbar
--%>



<%@page contentType="text/html" import="java.util.*,classes.*,java.sql.* " pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">-->
        
         <style>
            html, body {
                
                margin: 0 auto;
                justify-content: center;
                width: 800px ;
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
            #logout{
                 background-color: red;
                color: white;
                 width: 40%;
                 border: 2px solid black;
                 border-radius: 4px;
                
                 padding: 8px auto;
                 cursor: pointer;
                 
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
            try {
                HttpSession sesion = request.getSession();
//                String a = session.getAttribute("sesion").toString();
                if (request.getSession().getAttribute("uname") == null) {

                    response.sendRedirect("loginStudent.jsp");
                } else {
                    
                     
                     String value = (String) session.getAttribute("uname");
                     
                    DAOForm dao = new DAOForm();
                    ArrayList<Form> list = dao.SelectAll();
        %>
        
       
        
        
        <form action="studentdata.jsp" method="post">
            <h1>Admission Form</h1>
            <div class="formcontainer">
                <hr/>
                <div class="container">
                    <label><strong>Name</strong></label>
                    <input type="text" placeholder="Enter Full Name" name="name" required>
                    <label><strong>Father's Name</strong></label>
                    <input type="text" placeholder="Enter Father's Name" name="father" required>
                    <label><strong>CNIC</strong></label>
                    <input type="text" placeholder="Enter Cnic" name="cnic" required>
                    <label><strong>Cell No</strong></label>
                    <input type="text" placeholder="Enter Cell.No" name="contact" required>
                   
                    
                    
                    <input type="hidden" name="email"  value="<%= value %>" ><br>
                    
                    <label><strong><h4>Select Gender</h4></strong></label>
                    Male<input type="radio" name="gender" value="male">&emsp;
                    Female<input type="radio" name="gender" value="female"><br><br>
                    <label><strong><b>Choose Degree:<b></strong></label>&emsp;
                                    <select name="nationality">
                                        <option disabled="disabled" selected="selected">Choose</option>
                                        <option value="BSCS">BSCS</option>
                                        <option value="BSSE">BSSE</option>
                                        <option value="BSIT">BSIT</option>
                                        <option value="BSAI">BSAI</option>
                                        <option value="BSML">BSML</option>
                                        <option value="BSDS">BSDS</option>
                                        <option value="BSDL">BSDL</option>
                                        <option value="BSCA">BSCA</option>
                                        <option value="BS-CSE">BS-CSE</option>
                                        <option value="BS-CIS">BS-CIS</option>
                                    </select><br>
                                    </div>
                                    <button type="submit" name="Insert">SignUp</button>
                                    
                                    </form>
        
        <a  id="logout" href="Logout.jsp" name="logout">Logout</a>
        
        
        
        
        
                                    <%
                                        Form s = new Form();
//                                        DAOStudent dao = new DAOStudent();
                                        s.Name = request.getParameter("name");
                                        s.Father = request.getParameter("father");
                                        s.Cnic = request.getParameter("cnic");
                                        s.Contact = request.getParameter("contact");
                                        s.UserName = request.getParameter("email");
                                        s.Gender = request.getParameter("gender");
                                        s.Nationality = request.getParameter("nationality");
                                        if (request.getParameter("Insert") != null) {
                                            int res = dao.Insert(s);
                                            if (res > 0) {
                                   
//                                                response.sendRedirect("Login.jsp");
                                                      
                                                  
                                            }
                                        }
                                  }}catch(Exception e){}
                                    %>
                                   
   

                                    
    </body>
</html>
