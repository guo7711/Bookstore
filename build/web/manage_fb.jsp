<%-- 
    Document   : manage_fb
    Created on : 2009-12-16, 19:07:30
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String modify[]=request.getParameterValues("check");
        String UserName=(String)session.getAttribute("UserName");
        int change=Integer.parseInt(request.getParameter("change"));
        %>
        <jsp:useBean id="book" class="bookstore.Book" scope="session"/>
        <%
        for(int i=0;i<modify.length;i++){
        book.modifyBookStock(modify[i], change);
        
        }
        response.sendRedirect("management.jsp?face=book&branch=all&start=0");
        %>
    </body>
</html>
