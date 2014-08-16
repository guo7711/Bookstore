<%-- 
    Document   : Allorder
    Created on : 2009-12-2, 15:16:15
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Orders</title>
        <link href="css/layout.css" rel="stylesheet" type="text/css" media="screen"/>
        <%@page import="java.util.Vector"%>
        <%@page import="java.util.Iterator"%>
    </head>
    <body>
        <jsp:useBean id="order" class="bookstore.Order" scope="session"/>
        <%
        String UserName=(String)session.getAttribute("UserName");
        String type=request.getParameter("type");
        if(type.equalsIgnoreCase("1")){order.queryOrderID(UserName);}
        if(type.equalsIgnoreCase("2")){order.queryOrderID2(UserName);}
        if(type.equalsIgnoreCase("3")){order.queryOrderID3(UserName);}
        Vector V_OrderID=order.getV_OrderID();
        Vector V_state=order.getV_state();
        Vector V_totalprice=order.getV_totalprice();
        //out.print(V_OrderID.get(0)+"!!"+V_State.get(0)+"!!"+V_totalprice.get(0));
        %>
        <div class="wrap">
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        <form name="order" action="" method="post">
        <table  class="Allordertable"width="100" border="1" rules="groups">
        <tr>
          <td>Order</td>
          <td>Order ID</td>
          <!--<td>Order Details</td>-->
          <td align="center">Order Status</td>
        </tr>
        <%for(int a=0;a<V_OrderID.size();a++){%>
        <tr>
          <td><%=a+1%></td>
          <td><%=V_OrderID.get(a)%></td>
          <!--<td><a href="bookdetail.jsp?OrderID=<%=V_OrderID.get(a)%>">View Details</a></td>-->
          <%if(V_state.get(a).equals("In Process")){%>
          <td align="center"><%=V_state.get(a)%> <input type="button" value="Cancel Order" onclick="window.location='changeorderstate.jsp?OrderID=<%=V_OrderID.get(a)%>&state=<%=V_state.get(a)%>&type=<%=type%>'"></td>
          <%}else if(V_state.get(a).equals("Shipped")){%>
          <td align="center"><%=V_state.get(a)%> <input type="button" value="Confirm Delivery" onclick="window.location='changeorderstate.jsp?OrderID=<%=V_OrderID.get(a)%>&state=<%=V_state.get(a)%>&type=<%=type%>'"></td>
          <%}else if(V_state.get(a).equals("Cancelled")){%>
          <td align="center"><%=V_state.get(a)%> <input type="button" value="" onclick="window.location='changeorderstate.jsp?OrderID=<%=V_OrderID.get(a)%>&state=<%=V_state.get(a)%>&type=<%=type%>'"></td>
          <%}else{%>
          <td align="center"><%=V_state.get(a)%>
          <%}%>
        </tr>
        <%}
        V_OrderID.clear();
        V_state.clear();
        V_totalprice.clear();
        %>
      </table>
      </form>
        </div>
</body>
</html>
