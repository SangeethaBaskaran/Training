<%-- 
    Document   : index
    Created on : 7 May, 2015, 4:45:46 PM
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
        
       <h1>Login here</h1>
       <p><%if(request.getAttribute("error")!=null){
                out.print(request.getAttribute("error"));           
            }
       %></p>
           
        <form action="validate" method="POST"> 
           
           <label>name</label><input type="text" name="name"><br>
            <label>password</label><input type="password" name="password"><br>
            <input type="submit" value="submit" class="button"><br>
        </form> 
      
    </body>
</html>
