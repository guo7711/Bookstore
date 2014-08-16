<%-- 
    Document   : addbook
    Created on : 2009-12-16, 15:22:07
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/admin.css" rel="stylesheet" type="text/css" media="screen"/>
    </head>
    <body>
        <jsp:useBean id="book" class="bookstore.Book" scope="session"/>
        <%
        String UserName=(String)session.getAttribute("UserName");
        String Name=new String(request.getParameter("bookName").getBytes("ISO-8859-1"),"gb2312");
        String ISBN=new String(request.getParameter("ISBN").getBytes("ISO-8859-1"),"gb2312");
        String Author=new String(request.getParameter("author").getBytes("ISO-8859-1"),"gb2312");
        String Version=new String(request.getParameter("Version").getBytes("ISO-8859-1"),"gb2312");
        String Publish=new String(request.getParameter("Publish").getBytes("ISO-8859-1"),"gb2312");
        String Price=new String(request.getParameter("gold").getBytes("ISO-8859-1"),"gb2312");
        int Stock=Integer.parseInt(new String(request .getParameter("number").getBytes("ISO-8859-1"),"gb2312"));
        String image="./images/books/"+new String(request.getParameter("upload").getBytes("ISO-8859-1"),"gb2312");
        String catelog=new String(request.getParameter("catalog").getBytes("ISO-8859-1"),"gb2312");
        //String catelog=request.getParameter("catalog");
        book.addItem(ISBN, Name, Author,Version,Publish,Price,Stock ,catelog,image);
        response.sendRedirect("management.jsp?face=book&branch=all&start=0");
        %>

    </body>
</html>
