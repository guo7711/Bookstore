
<%--
    Document   : bookdetail
    Created on : 2009-11-18, 13:04:32
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
        String ISBN=new String(request.getParameter("ISBN").getBytes("ISO-8859-1"),"GB2312");
        String category=new String(request.getParameter("catelog").getBytes("ISO-8859-1"),"GB2312");
        String UserName=(String)session.getAttribute("UserName");
        session.setAttribute("url", "bookdetail.jsp");
        %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%=category%>Hannah's Book Store-Book Detail</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" media="screen"/>
<%@page import="java.util.Vector"%>
<script language="javascript">
            function  submit(UserName,ISBN){
      submitcart.UserName.value   = UserName   ;
      submitcart.ISBN.value   =   ISBN   ;
      submitcart.submit();
  }

        </script>
</head>
<body>
    <div class="wrap">
<%@include file="/WEB-INF/jspf/header.jspf" %>
<%

        Vector V_ISBN=new Vector();
            Vector V_Name=new Vector();
            Vector V_Author=new Vector();
            Vector V_Version=new Vector();
            Vector V_Introduction=new Vector();
            Vector V_Publish=new Vector();
            Vector V_Price=new Vector();
            Vector V_image=new Vector();
            Vector V_Catelog=new Vector();
            Vector<Integer> V_Sales=new Vector();
            Vector<Integer> V_Stock=new Vector();

        %>
<jsp:useBean id="book" class="bookstore.Book" scope="session"/>

<div class="page">
<div class="left">
  <div class="samecategory">
    <div class="lefttop">Other Best Sellers In <%=category%></div>
    <MARQUEE onMouseOver="this.stop()" onMouseOut="this.start()" scrollAmount=4 scrollDelay=30 direction=up width="100%" height="350">
    <%
                book.samecategory(category);
                V_ISBN=book.getV_ISBN();
                V_Name=book.getV_Name();
                V_image=book.getV_image();
                V_Catelog=book.getV_Catelog();
                for(int a=0;a<3;a++)
                    { 
                        if(V_ISBN.size()>=a)
                    {
                %>
                <li style="padding-top:10px;"><a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(a)%>&catelog=<%=V_Catelog.get(a)%>"><%=V_Name.get(a)%><img height="150" src="<%=V_image.get(a)%>"></a></li>
    <%}
                    }%>
    </MARQUEE>
  </div>

  </div>
<div class="bookdetail">
  <div class="basedInfo">
    <jsp:useBean id="book1" class="bookstore.Book" scope="session"/>

    <%
                    V_ISBN.clear();
                    V_Name.clear();
                    V_Author.clear();
                    V_Version.clear();
                    V_Introduction.clear();
                    V_Publish.clear();
                    V_Price.clear();
                    V_image.clear();
                    V_Sales.clear();
                    V_Stock.clear();;
                    V_Catelog.clear();
                    book1.searchBasedISBN(ISBN);
                    V_ISBN=book1.getV_ISBN();
                    V_Name=book1.getV_Name();
                    V_Author=book1.getV_Author();
                    V_Version=book1.getV_Version();
                    V_Introduction=book1.getV_Introduction();
                    V_Publish=book1.getV_Publish();
                    V_Price=book1.getV_Price();
                    V_image=book1.getV_image();
                    V_Sales=book1.getV_Sales();
                    V_Stock=book1.getV_Stock();
            V_Catelog=book1.getV_Catelog();
                %>
    <h1 style="text-align:left;margin-top:0px;margin-left:15px;font-family:Comic Sans MS;"><%=V_Name.get(0)%></h1>
    <h3 style="text-align:left;margin-left:15px;">Author: <%=V_Author.get(0)%></h3>
    <div class="bigImage"> <img width="160" height="180" src="<%=V_image.get(0)%>" > </div>
    <div class="otherInfo">
      <div style="font-size:25px;color:red;text-align:left"><%=V_Price.get(0)%></div>
      <br/>
      <%if(V_Stock.get(0)!=0){
                    %>
      <div style="text-align:left"><%=V_Stock.get(0)%> In Stock</div>
      <%}else{%>
      <span>Sold Out</span>
      <%}%>
      <br/>
      <div class="Hackbox1" style="text-align:left">
      Publisher: <%=V_Publish.get(0)%><br>
      Edition: <%=V_Version.get(0)%><br>
      ISBN: <%=V_ISBN.get(0)%><br> 
      </div>
      
      </div>
    
    
    <div class="addtocart">
      <form  name="submitcart" action="addtocart.jsp" method="post">
        <input name="UserName" type="hidden" value="<%=UserName%>"/>
        <input name="ISBN" type="hidden" value="<%=V_ISBN.get(0)%>"/>
        <%if(V_Stock.get(0)!=0){%>
        <input name="submit.addtocart" width="143.1" height="33.3" type="image" alt="Add to Cart" src="./images/addtocart.png"/>
        <%}%>
        <br/>
        <br/>
        <input width="143.1" height="33.3" src="./images/addtowishlist.png" type="image" value="Add to Favorites" onclick="window.location='addtofavo.jsp?ISBN=<%=V_ISBN.get(0)%>&UserName=<%=UserName%>'" />
      </form>
    </div>
  </div>
  <div class="contentIntroduction">
    <h1 style="color:orange; text-align:left;">Introduction: </h1>
    <div>
        <p style="width: 750px;text-align: left" >
      <%=V_Introduction.get(0)%>
   </p></div>
    </div>
  </div>
</div>
<%
        V_ISBN.clear();
                    V_Name.clear();
                    V_Author.clear();
                    V_Version.clear();
                    V_Introduction.clear();
                    V_Publish.clear();
                    V_Price.clear();
                    V_image.clear();
                    V_Sales.clear();
                    V_Stock.clear();
                    V_Catelog.clear();
        %>
        </div>
<%@include file="/WEB-INF/jspf/footer.jspf" %>
</div>

</body>
</html>
