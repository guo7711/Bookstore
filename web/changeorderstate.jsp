<%-- 
    Document   : changeorderstate
    Created on : 2009-12-2, 16:48:58
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
        <jsp:useBean id="order" class="bookstore.Order" scope="session"/>
        <%
        String UserName=(String)session.getAttribute("UserName");
        String type=request.getParameter("type");
        String OrderID=request.getParameter("OrderID");
        String state= new String(request.getParameter("state").getBytes("ISO-8859-1"),"gb2312");
        //String state=request.getParameter("state");
        //out.print(UserName+"!"+OrderID+"!!"+state);
        if(state.equalsIgnoreCase("In Process")){
            //order.deleteOrder(UserName, OrderID);

            order.changeOrder1(UserName, OrderID);
        }
        else if(state.equalsIgnoreCase("Shipped")){
            //order.deleteOrder(UserName, OrderID);
            order.changeOrder2(UserName, OrderID);
        }
        else if(state.equalsIgnoreCase("Cancelled")){
            order.deleteOrder(UserName, OrderID);
        }
        %>

        <jsp:include page="Allorder.jsp">
            <jsp:param name="type" value="<%=type%>"/>
        </jsp:include>
</body>
    </body>
</html>
