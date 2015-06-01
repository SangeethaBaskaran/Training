<%--
    Document   : info
    Created on : 8 May, 2015, 5:57:26 PM
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
        <%String userName = (String)request.getSession().getAttribute("name");
            if (null == userName) {
                request.setAttribute("error", "Session has ended.  Please login.");
                RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                rd1.forward(request, response);
            } else {%>
        <h1> Survey Monkey!!!</h1>
        <p><%if(request.getAttribute("errorMessage")!=null){
                out.print(request.getAttribute("errorMessage"));                
            }
        %></p>
         
        <form method="POST" action="update">
           
               <div style="position:absolute;left:1000px;top:20px;
            background-color:yellow;">
                   <a href="logout">logout</a>
</div>          
        <label>Age</label><input type="text" name="age"><br>
        <label>Pet</label><input type="text" name="pet"><br>
        <input type="submit" value="update" class="button">
        </form>
       <%}%>
    </body>
</html>
