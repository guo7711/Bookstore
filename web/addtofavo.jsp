<%--
    Document   : addtofavo
    Created on : 2009-11-29, 15:13:52
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
<%
        //String name=(String)session.getAttribute("UserName");
          String name=request.getParameter("UserName");
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
<jsp:useBean id="favorite" class="bookstore.Favorite" scope="session"/>
<%
int i=favorite.addFavorite(name, ISBN);
        if(i==1){%>
<script>
            alert("This is book is added to Wish List.\uff01Continue Shopping.");
            window.history.back(-1);

        </script>
<%}else{%>
<script>
            alert("This book is in Wish List already.");
            window.history.back(-1);
        </script>
<%}}%>
</html>
