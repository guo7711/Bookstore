<%--
    Document   : addtoshopcart
    Created on : 2009-11-26, 23:48:03
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
<jsp:useBean id="cart" scope="session" class="bookstore.ShopCart"/>

<%
        String shopcart[]=request.getParameterValues("choose");
        String name=(String )session.getAttribute("UserName");
        Vector favoriteISBN=new Vector();
        for(int i=0;i<shopcart.length;i++)
        {
            favoriteISBN.add(shopcart[i]);
            cart.addtoShopCart(name, (String)favoriteISBN.get(i));
        }
        %>
<script>
            window.navigate("ShopCart.jsp");
        </script>
</body>
</html>
