<%-- 
    Document   : signup
    Created on : 11 May, 2015, 7:11:31 PM
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
         <h1>Welcome to Survey Monkey!!!Sign up !!</h1>
         <p> <%if(request.getAttribute("errorMessage")!=null){
                out.print(request.getAttribute("errorMessage"));           
            }
         %></p>
        <form method="post" action="signup">
            
            <label>name</label><input type="text" name="name_su"><br>
            <label>password</label><input type="password" name="pass_su"><br>
            <input type="submit" value="sign up" class="button">
        </form>
    </body>
</html>
