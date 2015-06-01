<%@page import="java.sql.Connection"%>
<%--
    Document   : main
    Created on : 7 May, 2015, 4:13:57 PM
    Author     : sangeetha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%@page import="customer.dbConnection"%>
         <% dbConnection con = new dbConnection();   
         
                String name = request.getParameter("name");
                String pass = request.getParameter("password");
                if (con.validate(name,pass)) {
                      RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);  
            } else {
            out.println("login successful");           
           session.setAttribute("name", request.getParameter("name"));
            if(!(request.getParameter("url")).equals("null")){
                RequestDispatcher rd1 = request.getRequestDispatcher(request.getParameter("url").toString().replaceAll("/.*/", ""));
                    rd1.forward(request, response);  
            }else{              
           
            String userName = (String) session.getAttribute("name");
            if (null == userName) {
                request.setAttribute("Error", "Session has ended.  Please login.");
                RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                rd1.forward(request, response);
            } else {%>
                <form action="welcome.jsp" method="POST">
            <div style="position:absolute;left:1000px;top:20px;
            background-color:yellow;">
<input type="submit" name="logout" Value="logout" />
<input type="hidden" name="f" value="<%=request.getRequestURI()%>">
</div>
            <input type="submit" value="proceed" name="proceed"> 
            
            </form><%
       }}}%>

        

    </body>
</html>
