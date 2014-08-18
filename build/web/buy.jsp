<%--
    Document   : buy
    Created on : 2009-11-27, 19:58:37
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" media="screen"/>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
</head>
<body>
<jsp:useBean id="buybook" class="bookstore.Order" scope="session"/>

<%
        Vector V_ISBN=new Vector();
        Vector V_Name=new Vector();
        Vector V_image=new Vector();
        Vector V_Number=new Vector();
        Vector V_Catelog=new Vector();
        Vector V_OrderID=new Vector();
        Vector V_state=new Vector();
        String state,totalPrice;
        int num=Integer.parseInt(request.getParameter("num"));
        String tempnumber[]=request.getParameterValues("number");
        String totalprice=request.getParameter("totalprice");
        String UserName=(String)session.getAttribute("UserName");
        String buyisbn[]=request.getParameterValues("ISBN");
        Vector buyISBN=new Vector();
        Vector<Integer> buyNumber=new Vector();
        for(int i=0;i<num;i++)
        {
            buyISBN.add(buyisbn[i]);
            buyNumber.add(Integer.parseInt(tempnumber[i]));
        }
        String OrderID=buybook.getOrderID();
        buybook.addOrderBook(buyISBN, buyNumber, OrderID);
        buybook.addOrderUser(OrderID, UserName,totalprice);
        %>
<jsp:useBean id="book" class="bookstore.Book" scope="session"/>

<%
        book.substock(buyISBN, buyNumber);
        %>
<jsp:useBean id="cart" class="bookstore.ShopCart" scope="session"/>

<%
        cart.deleteAll(UserName);
        %>
<div class="wrap">
  <%@include file="header.jsp" %>
  <%@include file="catelog.jsp" %>
  <div class="detailOrder">
    <jsp:useBean id="order" class="bookstore.Order" scope="session"/>

    <%
                order.detailOrder(OrderID);
                V_ISBN=order.getV_ISBN();
                V_Number=order.getV_Number();
                order.Order(OrderID);
                state=order.getState();
                totalPrice=order.getTotalPrice();
                %>
    <jsp:useBean id="book1" class="bookstore.Book" scope="session"/>

    <%
                book1.ShopCartInfo(V_ISBN);
                V_Name=book1.getV_Name();
                V_image=book1.getV_image();
                V_Catelog=book1.getV_Catelog();
                %>
    <div class="ordertop">Order--View My Order</div>
    <table  class="detailtable"width="100" border="1" rules="groups" >
      <tr>
        <td>No.</td>
        <td align="center">ISBN</td>
        <td>Picture</td>
        <td>Book Name</td>
        <td>Quantity</td>
      </tr>
      <%for(int i=0;i<V_ISBN.size();i++){
                    %>
      <tr>
        <td><%=i+1%></td>
        <td align="center"><%=V_ISBN.get(i)%></td>
        <td><img width="50" height="50" src="<%=V_image.get(i)%>"></img></td>
        <td><a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(i)%>&catelog=<%=V_Catelog.get(i)%>"><%=V_Name.get(i)%></a></td>
        <td align="center"><%=V_Number.get(i)%></td>
      </tr>
      <%}%>
    </table>
    <div style="float:left;width:98%;background:silver;margin-top:15px;font-weight:bolder;">Order--Others</div>
    <div class="otherorder">
      <div style="float:left;width:98%;background:silver;margin-top:15px;font-weight:bolder;font-size:20px">Other Orders</div>
      <jsp:useBean id="order1" class="bookstore.Order" scope="session"/>

      <%
                        order1.queryOrderID(UserName);
                        V_OrderID=order1.getV_OrderID();
                        V_state=order1.getV_state();
                        %>
      <table  class="detailtable"width="100" border="1" rules="groups">
        <tr>
          <td>Order No.</td>
          <td>Order ID</td>
          <td>Order Detail</td>
          <td align="center">Order Status</td>
        </tr>
        <%for(int a=0;a<V_OrderID.size()-1;a++){
                     if(V_OrderID.get(a)!=OrderID){%>
        <tr>
          <td><%=a+1%></td>
          <td><%=V_OrderID.get(a)%></td>
          <td><a href="bookdetail.jsp?OrderID=<%=V_OrderID.get(a)%>">View Details</a></td>
          <td align="center"><%=V_state.get(a)%></td>
        </tr>
        <%}}%>
      </table>
    </div>
    <%
                V_ISBN.clear();
                V_Name.clear();
                V_image.clear();
                V_Catelog.clear();
                V_Number.clear();
                V_OrderID.clear();
                V_state.clear();

                %>
  </div>
</div>
</body>
</html>
