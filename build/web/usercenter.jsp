<%-- 
    Document   : usercenter
    Created on : 2009-11-29, 12:54:38
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Account</title>
        <link href="css/layout.css" rel="stylesheet" type="text/css" media="screen"/>
        <%@page import="java.util.Vector"%>
        <%@page import="java.util.Iterator"%>
    </head>
    <body>
        <jsp:useBean id="reg" class="bookstore.Register" scope="session"/>
        <%String UserName=(String)session.getAttribute("UserName");
        String address=reg.getAdd(UserName);
        %>
        <div class="wrap">
            <%@include file="header.jsp" %>
            <div class="usercenter">
            <table width="80%" border="0" cellspacing="5" cellpadding="0">
        <tr>
          <td width="22%" scope="row"><strong>&nbsp;View Orders</strong><br>
          <font size="2">&nbsp;View and Update Recent Orders<br></font></td>
          <td width="78%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="33%" scope="row">&nbsp;<a href="Allorder.jsp?UserName=<%=UserName%>&type=1">All Orders</a></td>
              <td width="33%">&nbsp;<a href="Allorder.jsp?UserName=<%=UserName%>&type=2">Orders in Process</a></td>
              <td width="34%">&nbsp;<a href="Allorder.jsp?UserName=<%=UserName%>&type=3">Delivered Orders Needing Confirm</a></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td scope="row">&nbsp;<strong>Shipping Address Management</strong><br>
          <font size="2">&nbsp;View and Update Shipping Address<br></font></td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="66%" scope="row">&nbsp;Current Shipping Address: <%=address%>
              </td>
              <td width="34%">&nbsp;<a href="newAddress.jsp?UserName=<%=UserName%>">Update Address</a></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td scope="row">&nbsp;<strong>User Profile Management</strong><br>
          <font size="2">&nbsp;View and Update User Profile</font></td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="33%" scope="row">&nbsp;<a href="showPerson.jsp?UserName=<%=UserName%>">View User Profile</a></td>
              <td width="33%">&nbsp;Update User Profile</td>
              <td width="34%">&nbsp;<a href="changeCode.jsp?UserName=<%=UserName%>">Update Password</a></td>
            </tr>
          </table>
        <tr>
            </tr>
          </td>
        </tr>
        
      </table>
      </div>
        </div>
    </body>
</html>
