<%--
    Document   : addtofavorite
    Created on : 2009-11-26, 18:16:49
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
<jsp:useBean id="favorite" scope="session" class="bookstore.Favorite"/>

<%
        String favo[]=request.getParameterValues("choose");
        String name=(String )session.getAttribute("UserName");

        Vector favoriteISBN=new Vector();
        for(int i=0;i<favo.length;i++)
        {
            favoriteISBN.add(favo[i]);
            favorite.addFavorite(name, (String)favoriteISBN.get(i));
        }
        %>
<script>
           // window.navigate("ShopCart.jsp");
           location.href = "ShopCart.jsp";
        </script>
</body>
</html>
