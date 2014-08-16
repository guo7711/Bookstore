<%--
    Document   : searchdetail
    Created on : 2009-11-17, 22:27:04
    Author     : user
--%>
<%@ page contentType="text/html" pageEncoding="GB2312" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%! //处理字符串的方法：
  public String toChinese(String s)
    { String str=s;
       try{byte b[]=str.getBytes("ISO-8859-1");
           str=new String(b);
           return str;
         }
      catch(Exception e)
         { return str;
         }
    }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" media="screen"/>

<%@page import="java.util.Vector"%>
</head>
<body>
    <div class="wrap">
    <%@include file="/WEB-INF/jspf/header.jspf" %>
<%
        String UserName=(String)session.getAttribute("UserName");
        String catelog=new String(request.getParameter("catelog").getBytes("ISO-8859-1"),"gb2312");
        //catelog=toChinese(catelog);
        String keyword = new String(request.getParameter("keywords").getBytes("ISO-8859-1"),"gb2312");

        //keyword=toChinese(keyword);

        //String according=request.getParameter("according");
        String according= new String(request.getParameter("according").getBytes("ISO-8859-1"),"gb2312") ;

        //according=toChinese(according);

        %>
<jsp:useBean id="book" class="bookstore.Book" scope="page"/>

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
            if(according.equalsIgnoreCase("Book Name")){
            book.detailsearch_1(keyword,catelog);
            V_ISBN=book.getV_ISBN();
            V_Name=book.getV_Name();
            V_Author=book.getV_Author();
            V_Version=book.getV_Version();
            V_Introduction=book.getV_Introduction();
            V_Publish=book.getV_Publish();
            V_Price=book.getV_Price();
            V_image=book.getV_image();
            V_Sales=book.getV_Sales();
            V_Stock=book.getV_Stock();
            V_Catelog=book.getV_Catelog();
            }
            if(according.equalsIgnoreCase("Author")){
                book.detailsearch_2(catelog,keyword);
                V_ISBN=book.getV_ISBN();
            V_Name=book.getV_Name();
            V_Author=book.getV_Author();
            V_Version=book.getV_Version();
            V_Introduction=book.getV_Introduction();
            V_Publish=book.getV_Publish();
            V_Price=book.getV_Price();
            V_image=book.getV_image();
            V_Sales=book.getV_Sales();
            V_Stock=book.getV_Stock();
            V_Catelog=book.getV_Catelog();
            }
            %>
<div class="content">
<h1 class="contenttop" style="margin-left:60px; font-size:36px; color: #855E42 ">Search--<%=keyword%></h1>
<div class="detailsearchlist">
<%
            int i=V_ISBN.size();
            if(i!=0){
            for(int a=0;a<i;a++){
            %>
<div class="result">
  <div class="productImage"> <a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(a)%>&catelog=<%=V_Catelog.get(a)%>"><img width="100" height="115" src="<%=V_image.get(a)%>" ></a> </div>
  <div class="productdata">
    <div class="producttitle"> 
        <a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(a)%>&catelog=<%=V_Catelog.get(a)%>"><%=V_Name.get(a)%></a>        
        <br>
                     <span style="font-size: 15px" >Author: <%=V_Author.get(a)%></span>
                     <br>
                     <span style="font-size: 15px">Publisher: <%=V_Publish.get(a)%></span>                   
       </div>
    <div class="addtocart">
      <form  name="submitcart" action="addtocart.jsp" method="post">
        <input name="UserName" type="hidden" value="<%=UserName%>"/>
        <input name="ISBN" type="hidden" value="<%=V_ISBN.get(a)%>"/>
        
        <%if(V_Stock.get(a)!=0){%>
       <input name="submit.addtocart" width="143.1" height="33.3" type="image" alt="Add to Cart"  src="./images/addtocart.png"/>
        <%}%>
                            <br/>
                            <input width="143.1" height="33.3" src="./images/addtowishlist.png" type="image" value="Add to Favorites" onclick="window.location='addtofavo.jsp?ISBN=<%=V_ISBN.get(a)%>'" />
      </form>
    </div>
    <div class="price" style="color:red;margin-top:10px;"><%=V_Price.get(a)%> </div>
    <%
                         if(V_Stock.get(a)!=0)
                         {%>
    <div style="margin-top:15px;">In Stock</div>
    <%
                         }
                         else{
                             %>
    <div style="margin-top:15px;">Not In Stock</div>
    <%
                         }
                         %>
  </div>
</div>
<%}}if(i==0){out.print("Your search did not match any books.");}
                     %>
       </div>
       </div>
<%@include file="/WEB-INF/jspf/footer.jspf" %>
</div>
</body>
</html>
