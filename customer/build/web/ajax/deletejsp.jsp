<%-- 
    Document   : deletejsp
    Created on : 27 May, 2015, 11:25:06 PM
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
        <% 
            String s=request.getParameter("val");
        out.print(s);
        %>
    </body>
</html>
