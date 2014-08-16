<%--
    Document   : addtocart
    Created on : 2009-11-15, 22:11:45
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
<%      String name=request.getParameter("UserName");
        //String name=(String)session.getAttribute("UserName");
          String ISBN=request.getParameter("ISBN");
          String url=(String)session.getAttribute("url");
          if(name.equalsIgnoreCase("null")||name.equalsIgnoreCase(""))
              {
        %>
<script>
            alert("Please sign in first.:-)");
          location.href = "login.jsp";
        </script>
<%}else{%>
<jsp:useBean id="cart" class="bookstore.ShopCart" scope="session"/>

<%
        int i=cart.addtoShopCart(name, ISBN);
        if(i==1){%>
<script>
            alert("This book is added to Cart.\uff01Continue shopping.");
            window.history.go(-1);

        </script>
<%}else{%>
<script>
            alert("This book is in Wish List already.");
            window.history.back(-1);
        </script>
<%}}%>
</body>
</html>
