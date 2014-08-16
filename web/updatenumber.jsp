<%-- 
    Document   : updatenumber
    Created on : 2009-11-25, 10:43:14
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@page import="java.util.Vector"%>
    </head>
    <body>
        <jsp:useBean id="cart" class="bookstore.ShopCart" scope="session"/>
        <%
        Vector V_ISBN=new Vector();
        Vector<Integer> V_Number=new Vector();
        String UserName=(String)session.getAttribute("UserName");
        int num=Integer.parseInt(request.getParameter("num"));
        String ISBN[]=request.getParameterValues("ISBN");
        String tempnumber[]=request.getParameterValues("number");
        
        int number[]=new int[tempnumber.length];
        for(int j=0;j<tempnumber.length;j++)
        {
            number[j]=Integer.parseInt(tempnumber[j]);
            V_ISBN.add(ISBN[j]);
            V_Number.add(number[j]);
        }
        cart.updatebooknumber(V_ISBN, V_Number, UserName);

        %>
        <jsp:forward page="ShopCart.jsp"/>
    </body>
</html>
