<%-- 
    Document   : main1
    Created on : 12 May, 2015, 7:22:19 PM
    Author     : sangeetha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="mysheet.css">
   
    </head>
    <body>
        <h1> Survey Monkey!!!</h1>
         <%String userName = (String)request.getSession().getAttribute("name");
            if (null == userName) {
                request.setAttribute("error", "Session has ended.  Please login.");
                RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                rd1.forward(request, response);
            } else {%>
       <form action="view" method="POST">
            <div style="position:absolute;left:1000px;top:20px;
            background-color:yellow;">
                <a href="logout">logout</a>
</div>
           
           <p class="info"><%out.print(request.getAttribute("details"));%></p>
           <br>
           <input type="submit" value="proceed" name="proceed" class="button">             
            </form>
           <%}%>
    </body>
</html>
