<%-- 
    Document   : view
    Created on : 11 May, 2015, 11:43:42 AM
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
        <form action="logout.jsp" method="post">
            <h1>Welcome to Survey Monkey!!!</h1>
       <div style="position:absolute;left:1000px;top:20px;
            background-color:yellow;">
           <a href="logout">logout</a>
<input type="hidden" name="f" value="<%=request.getRequestURI()%>">
</div>
         <%@page import="customer.dbConnection"%>
         <% dbConnection con=new dbConnection();
         String result[]=con.select((String)session.getAttribute("name"));
         out.print("Hey "+session.getAttribute("name")+"!!!!");
         out.print("Happy "+result[0]+" !!! Found that you love "+result[1]+" ! Thanks for giving survey !!!");
         %>
         </form>
        <%}}%>
    </body>
</html>
