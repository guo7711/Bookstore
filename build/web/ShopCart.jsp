<%--
    Document   : ShopCart
    Created on : 2009-11-22, 20:39:08
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shop Cart</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" media="screen"/>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

</head>
<script language="javascript">
        function  updatenumber(){
      document.cart.action="updatenumber.jsp";
      document.cart.submit();
        }
      function deleteshopcart()
      {
      document.cart.action="deleteshopcart.jsp";
      document.cart.submit();
      }
      function addtofavorite()
      {
      document.cart.action="addtofavorite.jsp";
      document.cart.submit();
      }
      function addtoshopcart()
      {
      document.favorite.action="addtoshopcart.jsp";
      document.favorite.submit();
      }
      function deletefavorite()
      {
      document.favorite.action="deletefavorite.jsp";
      document.favorite.submit();
      deleteshopcart();
      }
      function buy()
      {
          
          document.cart.action="buy.jsp";
          document.cart.submit();
      }

</script>

    <div class="wrap">
    <%@include file="/WEB-INF/jspf/header.jspf" %>
<%@include file="/WEB-INF/jspf/catelog.jspf" %>

<jsp:useBean id="cart" class="bookstore.ShopCart" scope="session"/>

<%
        Vector V_ISBN=new Vector();
        Vector V_Name=new Vector();
        Vector V_Author=new Vector();
        Vector V_Price=new Vector();
        Vector V_Publish=new Vector();
        Vector V_image=new Vector();
        Vector V_Catelog=new Vector();
        Vector<Integer> V_Stock=new Vector();
        Vector<Integer> V_Number=new Vector();
        //String UserName=request.getParameter("UserName");
        String UserName=(String)session.getAttribute("UserName");
        cart.getISBN(UserName);
        V_ISBN=cart.getV_ISBN();
        V_Number=cart.getV_Number();
        %>
<jsp:useBean id="book" class="bookstore.Book" scope="session"/>

<%
        book.ShopCartInfo(V_ISBN);
        V_Name=book.getV_Name();
        V_Author=book.getV_Author();
        V_Price=book.getV_Price();
        V_Publish=book.getV_Publish();
        V_Stock=book.getV_Stock();
        V_Catelog=book.getV_Catelog();
        double totalprice=0;
        Iterator iter=V_Price.iterator();
        for(int b=0;b<V_Price.size();b++)
        {
            String a=(String)V_Price.get(b);
            a=a.substring(1, a.length());
            double price=Double.parseDouble(a);
            totalprice+=price*V_Number.get(b);
        }
        String totalPrice=null;
        DecimalFormat df=new DecimalFormat();
        df.setMaximumFractionDigits(3);
        df.setMinimumFractionDigits(2);
        totalPrice=df.format(totalprice);
        totalPrice=totalPrice.replaceAll(",", "");
        %>
<div class="content1">
    <form name="cart" action="" method="post">
    
  <div class="cartbook">
      <div class="carttop">
    <div style="float:left;">
      <p style="color:blue;font-size:30px;padding-left:60px;padding-top:0px;">My<span style="font-weight:bolder"> Cart</span></p>
    </div>
    <div style="float:right;padding-right:80px;padding-top:30px;width:220px;"><span style="font-size:16px;font-weight:900">Subtotal: <span style="color:red">$<%=totalPrice%></span></span></div>
  </div>
    <%if(V_ISBN.size()!=0){
      for(int i=0;i<V_ISBN.size();i++){%>
      <div class="cartbookdetail">
        <div class="check">
          <input type="checkbox" name="choose" value="<%=V_ISBN.get(i)%>">
        </div>
        <div class="info"> <a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(i)%>&catelog=<%=V_Catelog.get(i)%>"><%=V_Name.get(i)%></a> <span/><span><%=V_Author.get(i)%></span> <span/><span><%=V_Publish.get(i)%></span> </div>
        <div class="price"><%=V_Price.get(i)%></div>
        <div class="booknumber">Quantity:
          <input type="text" name="number" size="5" value="<%=V_Number.get(i)%>">
        </div>
        <input type="hidden" name="ISBN" value="<%=V_ISBN.get(i)%>">
        <input type="hidden" name="num" value="<%=V_ISBN.size()%>">
            <input type="hidden" name="totalprice" value="<%=totalPrice%>">
      </div>
      <%}%>
      <div class="submitinfo">
        
        <div class="updatenumber">
          <input type="button" value="Update" onclick="updatenumber()">
        </div>
         
          
        <div class="delete">
          <input type="button" value="Delete" onclick="deleteshopcart()">
          <input style="margin-top:10px;" type="button" value="Add to Wish List" onclick="addtofavorite()">
        </div>          
      </div>
      <div style="float:right"><input type="image"  src="./images/order-button.png" value="Submit Order" onclick="buy()" width="184" height="45"></div>
      <%}else{%>
      <h3>No Book in Cart!</h3>
      <%
      }
        V_ISBN.clear();
        V_Name.clear();
        V_Price.clear();
        V_Author.clear();
        V_Publish.clear();
        V_image.clear();
        V_Stock.clear();
        V_Catelog.clear();
        V_Number.clear();
             %>
    </div>
  </form>
  
  <jsp:useBean id="favorite" class="bookstore.Favorite" scope="session"/>

  <%

         favorite.getISBN(UserName);
         V_ISBN=favorite.getV_ISBN();
         %>
  <jsp:useBean id="book1" class="bookstore.Book" scope="session"/>

  <%
         book1.ShopCartInfo(V_ISBN);
         V_Name=book1.getV_Name();
         V_image=book1.getV_image();
        V_Author=book1.getV_Author();
        V_Price=book1.getV_Price();
        V_Publish=book1.getV_Publish();
        V_Stock=book1.getV_Stock();
        V_Catelog=book1.getV_Catelog();
         %>
  <div class="favoritebook">
      <div class="favoritetop">Wish List</div>
    <form name="favorite" accept="" method="post">
      <%if(V_ISBN.size()!=0){
             for(int a=0;a<V_ISBN.size();a++){%>
      <div class="cartbookdetail1">
        <div class="check1">
          <input type="checkbox" name="choose" value="<%=V_ISBN.get(a)%>">
        </div>
        <div class="favoriteImage"> <a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(a)%>&catelog=<%=V_Catelog.get(a)%>"><img width="100" height="115" src="<%=V_image.get(a)%>" ></a> </div>
        <div class="info1"> <a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(a)%>&catelog=<%=V_Catelog.get(a)%>"><%=V_Name.get(a)%></a> <span/><span><%=V_Author.get(a)%></span> <span/><span><%=V_Publish.get(a)%></span> </div>
        <div class="price1"><%=V_Price.get(a)%></div>
        <input type="hidden" name="ISBN" value="<%=V_ISBN.get(a)%>">
        <input type="hidden" name="num" value="<%=V_ISBN.size()%>">
        
      </div>
      <%}%>
      <div class="delete">
        <input type="button" value="Delete from Wish List" onclick="deletefavorite()">
        <input style="margin-top:10px" type="button" value="Add to Cart" size="100" onclick="addtoshopcart()">
      </div>
      <%}else{out.print("No Book in Wish List");
      }
          V_ISBN.clear();
        V_Name.clear();
        V_Price.clear();
        V_Author.clear();
        V_Publish.clear();
        V_image.clear();
        V_Stock.clear();
        V_Catelog.clear();
             %>
    </form>
  </div>
</div>

<%@include file="/WEB-INF/jspf/footer.jspf" %>
</div>
</body>
</html>
