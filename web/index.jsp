<%@page contentType="text/html" pageEncoding="GB2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hannah's Book Store</title>
        <link href="css/layout.css" rel="stylesheet" type="text/css" media="screen"/>
        <link href="../jquery-ui-1.11.1.custom/jquery-ui.css" rel="stylesheet">
	<script src="../jquery-ui-1.11.1.custom/external/jquery/jquery.js"></script>
	<script src="../jquery-ui-1.11.1.custom/jquery-ui.js"></script>
        
        <%@page import="java.util.Vector"%>
        <script language="javascript">
            function  submit(UserName,ISBN){
      submitcart.UserName.value   = UserName   ;
      submitcart.ISBN.value   =   ISBN   ;
      submitcart.submit();
  }

        </script>
    <body background="/Internet Explorer Wallpaper.jpg">
        
<div class="wrap">
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        <%@include file="/WEB-INF/jspf/catelog.jspf" %>
<%
//session.setAttribute("UserName", "");
//session.setAttribute("Password", "");
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
            Vector<Integer> V_Sales=new Vector();
            Vector<Integer> V_Stock=new Vector();
            Vector V_Catelog=new Vector();
            book.getTop();
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
            %>
            <%
            session.setAttribute("url", "index.jsp");
            //String UserName=request.getParameter("UserName");
            String UserName=(String)session.getAttribute("UserName");
            %>

        <div class="content">
            <h1 class="contenttop" style="margin:0px; font-size:36px; color: #855E42 ">Best Sellers</h1>
            
            <div class="toplist">
                <%
            int i=V_ISBN.size();
            for(int a=0;a<i;a++){
            %>
            
                <div class="result">
                    <div class="productImage">
                        <a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(a)%>&catelog=<%=V_Catelog.get(a)%>"><img width="100" height="115" src="<%=V_image.get(a)%>" ></a>
                </div>
                 <div class="productdata">
                    <div class="producttitle">
                        <span style="font-size: 20px">
                            <a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(a)%>&catelog=<%=V_Catelog.get(a)%>"><%=V_Name.get(a)%></a>
                        </span>   
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
                            <input width="143.1" height="33.3" src="./images/addtowishlist.png" type="image" value="Add to Favorites" onclick="location.href='addtofavo.jsp?ISBN=<%=V_ISBN.get(a)%>&UserName=<%=UserName%>'" />
                        </form>
                            
                     </div>
                     <div class="price" style="color:red;margin-top:10px;"><%=V_Price.get(a)%>
                     </div>
                         <%
                         if(V_Stock.get(a)!=0)
                         {%>
                         <div style="margin-top:15px;">In Stock</div>
                         <%
                         }
                         else{
                             %>
                         <div style="margin-top:15px;">Sold Out</div>
                         <%
                         }
                         %>
                         
                     </div>
                     </div>
                     <%}
                     %>
                     </div>
                     </div>
                     </div>
                     <%@include file="/WEB-INF/jspf/footer.jspf" %>
           
    </body>
</html>