<%--
    Document   : search
    Created on : 2009-11-16, 1:14:58
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String catelog=new String(request.getParameter("catelog").getBytes("ISO-8859-1"),"GB2312");
        %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=catelog%>--Hannah's BookStore</title>
<%@page import="java.util.Vector"%>
<link href="/css/layout.css" rel="stylesheet" type="text/css" media="screen"/>
</head>
<body background="/images/crossword.png">
    <div class="wrap">
<%@include file="header.jsp" %>
<%@include file="catelog.jsp" %>
<jsp:useBean id="book" class="bookstore.Book" scope="page"/>
    
<%
        book.searchBasedCatelog(catelog);
        Vector V_Name=new Vector();
        Vector V_Price=new Vector();
        Vector V_image=new Vector();
        Vector V_ISBN=new Vector();
        Vector V_Catelog=new Vector();
        V_Name=book.getV_Name();
        V_Price=book.getV_Price();
        V_image=book.getV_image();
        V_ISBN=book.getV_ISBN();
        V_Catelog=book.getV_Catelog();
        %>
<div class="content">
  <h1 class="catelogtop" style="margin:0px; font-size:36px; color:#855E42; border-bottom:#999999 1px dashed; margin-left: 150px" >Category-<%=catelog%></h1>
  <br/>
  <br/>
  <div class="cateloglist" style="margin-left: 150px">
    <%int page1=1;
                int page2=1;
                try   {page2=Integer.parseInt(request.getParameter("page"));   }
  catch(NumberFormatException   e)
  {//i=0;
  }
                page1=page2;
            int i=V_Name.size();
            int totalpage;
            if(i%6==0) totalpage=(i/6);
            else totalpage=(i/6)+1;
            if(page1!=totalpage){
            %>
    <div class="searchInfo" style="color:red; font-size:16;" ><%=page1*6-5%>-<%=page1*6%> of <%=i%> results</div>
    
    <%}else{%>
    <div class="searchInfo" style="color:red; font-size:16;" ><%=page1*6-5%>-<%=i%> of <%=i%> results</div>
    <%}
            if(i%6==0){
            int d=page1*6-6;
            for(int b=0;b<2;b++){
            %>
    <div class="catelogresult">
      <%for(int c=0;c<3;c++){
                    %>
                    
      <div class="catelogItem">
        <div class="catelogproductImage"> <a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(d)%>&catelog=<%=V_Catelog.get(d)%>"><img width="100" height="115" src="<%=V_image.get(d)%>"></a> </div>
        <div class="producttitle"> <a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(d)%>&catelog=<%=V_Catelog.get(d)%>"><%=V_ISBN.get(d)%></a> </div>
        <div class="catelogprice"><%=V_Price.get(d)%> </div>
      </div>
      <%   d++;}   %>
      
     
    </div>
    <%}}
                    if((i%6)!=0){
                        int resultlist;
                    if(page1!=totalpage){ resultlist=2;}
                    else resultlist=(i-(page1-1)*6)/3;
                        int d=page1*6-6;
                    for(int b=0;b<resultlist;b++){
                     %>
    <div class="catelogresult">
      <%for(int c=0;c<3;c++){
                    %>
      <div class="catelogItem">
        <div style="float:left"><%=d+1%></div>
        <div class="catelogproductImage"> <a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(d)%>&catelog=<%=V_Catelog.get(d)%>"><img width="100" height="115" src="<%=V_image.get(d)%>"></a> </div>
        <div class="producttitle"> <a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(d)%>&catelog=<%=V_Catelog.get(d)%>"><%=V_Name.get(d)%></a> </div>
        <div class="catelogprice"><%=V_Price.get(d)%> </div>
      </div>
      
      <%  d++;}  %>
       
    </div>
    <%}
                    %>
    <%if(page1==totalpage){%>
    <div class="catelogresult">
      <%d=i-i%3;
                         for(int c=0;c<(i%3);c++){
                    %>
      <div class="catelogItem">
        <div style="float:left"><%=d+1%></div>
        <div class="catelogproductImage"> <a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(d)%>&catelog=<%=V_Catelog.get(d)%>"><img width="100" height="115" src="<%=V_image.get(d)%>"></a> </div>
        <div class="producttitle"> <a href="bookdetail.jsp?ISBN=<%=V_ISBN.get(d)%>&catelog=<%=V_Catelog.get(d)%>"><%=V_Name.get(d)%></a> </div>
        <div class="catelogprice"><%=V_Price.get(d)%> </div>
      </div>
      <%d++;}}%>
    </div>
    <%}
                      %>
    <div class="page">
      <%if(page1!=1){%>
      <span><a href="search.jsp?catelog=<%=catelog%>&page=<%=page1-1%>"><<Previous Page |</a></span>
      <%}else{%>
      <span>Previous Page </span>
      <%}%>
      <span>| </span>
      <%for(int p=0;p<totalpage;p++)
                              {if(page1!=p+1){
                          %>
      <span><a href="search.jsp?page=<%=p+1%>&catelog=<%=catelog%>"><%=p+1%> </a></span>
      <%}else{%>
      <span style="font-weight:bold;"><%=p+1%></span>
      <%}}%>
      <span> |</span>
      <%if(page1!=totalpage){%>
      <span><a href="search.jsp?catelog=<%=catelog%>&page=<%=page1+1%>">| Next Page>></a></span>
      <%}else{%>
      <span> Next Page>></span>
      <%}%>
    </div>
  </div>
</div>
</div>
<%@include file="/WEB-INF/jspf/footer.jspf" %>

</body>
</html>
