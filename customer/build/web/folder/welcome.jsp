<%-- 
    Document   : welcome
    Created on : 11 May, 2015, 3:51:45 PM
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
            if(request.getParameter("logout")!=null){
           request.setAttribute("ff", request.getParameter("f"));
        %>
            
            <%@include file="logout.jsp" %>
            <%}else{
            String userName = (String) session.getAttribute("name");
            if (null == userName) {
                request.setAttribute("Error", "Session has ended.  Please login.");
                RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                rd1.forward(request, response);
            } else {            
            %>
        <form action="info.jsp" method="POST">
        <input type="hidden" value="inserted.jsp" name="jspName">
        <h1>Welcome to Survey Monkey!!!</h1>
        <div style="position:absolute;left:1000px;top:20px;
            background-color:yellow;">
<input type="submit" name="logout" Value="logout" />
<input type="hidden" name="f" value="<%=request.getRequestURI()%>">
</div>
        Welcome <% out.print(session.getAttribute("name")); %>
        <input type="submit" value="Give us your survey !! Click here!!">
        </form>
        <%}}%>
    </body>
</html>