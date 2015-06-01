<%-- 
    Document   : logout
    Created on : 11 May, 2015, 12:32:12 PM
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
        <h3>Thank you!!!!</h3>        
     <%  Cookie[] killMyCookies=request.getCookies();
     for(Cookie killMyCookie:killMyCookies){
     killMyCookie.setMaxAge(0);
     killMyCookie.setPath("/");
     response.addCookie(killMyCookie);
}
   session.setAttribute("name", null);
   session.removeAttribute("name");
  request.getSession().invalidate();
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
            request.setAttribute("url",request.getAttribute("ff"));
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);  
            
        %> 
            
            
    </body>
</html>
