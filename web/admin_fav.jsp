<%-- 
    Document   : admin_fav
    Created on : 2009-12-9, 19:30:38
    Author     : HunTerDD
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
        <%@page import="java.util.Vector"%>
        <jsp:useBean id="order" class="bookstore.Order" scope="page"/>
        <%
             Vector<String> send = new Vector<String>();
             String temp =new String("");
             for(int i=0;i<Integer.parseInt(request.getParameter("size"));i++){
                temp = request.getParameter("checkbox"+i);
                if(temp != null){
                    temp = request.getParameter("send"+i);
                    send.add(temp);
                }
             }
             for(int j=0;j<send.size();j++){
                order.alterState(send.get(j));
             }
             response.sendRedirect("management.jsp?face=order");
             %>

    </body>
</html>
