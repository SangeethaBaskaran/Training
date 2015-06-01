<%-- 
    Document   : inserted
    Created on : 11 May, 2015, 12:07:18 PM
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
        <%             if (request.getParameter("logout") != null) { 
        request.setAttribute("ff", request.getParameter("f"));
        %>
        <%@include file="logout.jsp" %>

        <%} else {

            String userName = (String) session.getAttribute("name");
            if (null == userName) {
                request.setAttribute("Error", "Session has ended.  Please login.");
                RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                rd1.forward(request, response);
            } else {
                dbConnection con = new dbConnection();

                String name = request.getParameter("age");
                String pass = request.getParameter("pet");

                if (!con.validateinput(name, pass, (String) session.getAttribute("name"))) {
                   request.setAttribute("errorMessage", "Invalid age and pet values");
                    RequestDispatcher rd1= request.getRequestDispatcher("info.jsp");
                    rd1.forward(request, response);  
                    } else {
                        out.println("successfully updated");%>
        <form method="POST" action="view.jsp">
            <h1>Welcome to Survey Monkey!!!</h1>
            <input type="submit" value="view your submission">
            <div style="position:absolute;left:1000px;top:20px;
                 background-color:yellow;">
                <input type="submit" name="logout" Value="logout" />
                <input type="hidden" name="f" value="<%=request.getRequestURI()%>">
            </div>
        </form>
        <% }
                   }
               }%>       





    </body>
</html>
