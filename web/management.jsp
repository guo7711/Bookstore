<%-- 
    Document   : management
    Created on : 2009-11-11, 22:21:45
    Author     : YJY
--%>

<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <% String UserName = (String) session.getAttribute("UserName");
        if (UserName == null || UserName.equals("")) {
            response.sendRedirect("");
        }
        %>
        <script language=javascript >
            function expand() {
              //  if(item_collapsed.style.display=="none"){
                    item_collapsed.style.display="block";
               // }else {
                 //   item_collapsed.style.display="none";
               // }
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator</title>
        <link rel="icon" href="/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon" />
        <link href="css/admin.css" rel="stylesheet" type="text/css" media="screen"/>

        <%@page import="java.util.Vector" %>
        <%@page import="java.util.ArrayList" %>
    </head>
    <body>
        <div class="wrap1">
        <!--start header-->
        <div id="header">
            <!--<div style="height:20px;">
                <div id="info">2009&nbsp;年&nbsp;12&nbsp;月&nbsp;2&nbsp;日</div>-->
            <div id="option">Hi!&nbsp;<%=UserName%>&nbsp;&middot;&nbsp;
                <a href="#">Settings</a>&nbsp;&middot;&nbsp;<a href="quit.jsp">Sign Out</a>
            </div>
            <!--</div>-->
            
            <!--<div id="search">
                <form>
                    <input type="text" size="40"/>
                    <input type="radio" name="type" value="0">图书
                    <input type="submit" value="搜索"/>
                </form>
        </div>-->
        </div>
        <!--end header-->
        <!--start page-->
        
            <!--start navigation-->
            <div id="sidebar">
                <ul>
                    <li></li>
                    <% if (request.getParameter("face").equalsIgnoreCase("order")) {
                    %>
                    <li style="background:olive;"><a href="management.jsp?face=order&branch=new">Orders</a></li>
                    <li><a href="management.jsp?face=book&branch=new">Books</a></li>
                    <%}
        if (request.getParameter("face").equalsIgnoreCase("book")) {
                    %>
                    <li><a href="management.jsp?face=order&branch=new">Orders</a></li>
                    <li style="background:olive;"><a href="management.jsp?face=book&branch=new">Books</a></li>
                    <%     }
                    %>
                </ul>
            </div>
            <!--end nav-->
        
        <!--end page-->
        <!--start main-->
        <div id="content">
            <jsp:useBean id="book" class="bookstore.Book" scope="request" />
            <jsp:useBean id="order" class="bookstore.Order" scope="page" />
            <jsp:useBean id="user" class="bookstore.Register" scope="page" />
            <!--Order Interface Start-->
        <%
        if (request.getParameter("face") == null || request.getParameter("face").equalsIgnoreCase("order")) {
            if (request.getParameter("body") == null || request.getParameter("body").equalsIgnoreCase("neworder")) {
            %>
            <form action="admin_fav.jsp" method="post">

                <div id="item">
                    <input type="submit" value="Ship" />
                    <div id="option"><strong>New Orders</strong>&nbsp;&middot;&nbsp;<a href="management.jsp?face=order&body=allorder">All Orders</a></div>
                </div>
                <%
                ArrayList<String[]> newOrder = new ArrayList<String[]>();
                newOrder = order.showNewOrder();
                Vector<String[]> item = new Vector<String[]>();
                for (int i = 0; i < newOrder.size(); i++) {
                    item = order.getOneOrder(newOrder.get(i)[0]);
                %>

              
               <div id="item">
                    <input type="checkbox" name="checkbox<%=i%>"/>
                    Order
                    <%
                    out.print(newOrder.get(i)[0]);
                    %>
                    <!--<a href="#" onclick=expand(); style="text-decoration: none;">&nbsp;Order Details&raquo;&nbsp;</a>-->
                    
                    
                    <div id="item_collapsed_NEW">
                        <%
                    out.print("<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" height=\"40\">" +
                            "<tr height=\"35\">" +
                            "<td width=\"30%\">&nbsp;User Name: " + newOrder.get(i)[1] + "</td>" +
                            "<td width=\"20%\">&nbsp;Subtotal: $" + newOrder.get(i)[3] + "</td>" +
                            "<td width=\"50%\">&nbsp;Shipping Address: " + user.getAdd(newOrder.get(i)[1]) + "</td>" +
                            "</tr></table>");
                    for (int j = 0; j < item.size(); j++) {
                        out.print("<table width=\"100%\"border=\"0\"cellspacing=\"0\" cellpadding=\"0\" height=\"40\">" +
                                "<tr>" +
                                "<td width=\"2%\"></td>" +
                                "<td width=\"25%\">&nbsp;\"" + book.getBookName(item.get(j)[0]) + "\"</td>" +
                                "<td width=\"30%\">&nbsp;Price: " + book.getBookPrice(item.get(j)[0]) +
                                "<td width=\"33%\">&nbsp;Quantity: " + item.get(j)[1] +
                                "</tr></table>");
                    }
                        %>
                    </div>
                </div>
                <input type="hidden" name="send<%=i%>" value="<%=newOrder.get(i)[0]%>" />
                <%}%>
                <input type="hidden" name="size" value="<%=newOrder.size()%>"/>
            </form>
            <%}%>
            <%if (request.getParameter("body") != null) {
                if (request.getParameter("body").equalsIgnoreCase("allorder")) {
            %>
            <div id="item">
                &nbsp;
                <div id="option"><a href="management.jsp?face=order&body=neworder">New Orders</a>&nbsp;&middot;&nbsp;<strong>All Orders</strong></div>
            </div>
            <%
                String state = new String("");
                Vector<String[]> allOrder = new Vector<String[]>();
                allOrder = order.showAllOrder();
                Vector<String[]> item = new Vector<String[]>();
                int money = 0;
                for (int i = 0; i < allOrder.size(); i++) {
                    item = order.getOneOrder(allOrder.get(i)[0]);
                    state = allOrder.get(i)[1];

            %>
            <div id="item">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" height="40">
                    <tr>
                        <td width="30%">&nbsp;Order
                            <%
                out.print(allOrder.get(i)[0]);
                            %>
                        </td>
                        <td width="30%">&nbsp;Order Status：
                            <%
                out.print(allOrder.get(i)[2]);
                            %>
                        </td>

                        <td width="30%"><a href="#" onclick=expand(); style="text-decoration: none;">&nbsp;Order Details&raquo;&nbsp;</a>
                            <div id="item_collapsed" style="display:block">
                                <%
                out.print("<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" height=\"40\">" +
                        "<tr height=\"35\">" +
                        "<td width=\"30%\">&nbsp;User Name: <br>  " + allOrder.get(i)[1] + "</td>" +
                        "<td width=\"20%\">&nbsp;Subtotal: <br>  $"  + allOrder.get(i)[3] + "</td>" +
                        "<td width=\"50%\">&nbsp;Shipping Address: <br>" + user.getAdd(allOrder.get(i)[1]) + "</td>" +
                        "</tr></table>");
                for (int j = 0; j < item.size(); j++) {
                    out.print("<table width=\"100%\"border=\"0\"cellspacing=\"0\" cellpadding=\"0\" height=\"40\">" +
                            "<tr>" +
                            "<td width=\"2%\"></td>" +
                            "<td width=\"50%\">&nbsp;\"" + book.getBookName(item.get(j)[0]) + "\"</td>" +
                            "<td width=\"24%\">&nbsp;Price: " + book.getBookPrice(item.get(j)[0]) +
                            "<td width=\"24%\">&nbsp;Quantity: " + item.get(j)[1] +
                            "</tr></table>");
                }
                                %>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <%
                    }
                }
            }
        }
            %>
            <!--Order end-->


            <!--Book Interface Start-->
                <% if (request.getParameter("face").equals("book")) {
            %>
            <%--新书界面--%>
            <% if (request.getParameter("branch").equals("new")) {
            %>
            <div id="item">
                <strong>Add A New Book</strong>&nbsp;&middot;&nbsp;
                <a href="management.jsp?face=book&branch=all&start=0">All Books</a>
            </div>
            <form action="addbook.jsp" method="post" >
                <table id="addBook">
                    <tr>
                        <td>
                            Book Name
                        </td>
                        <td>
                            <input type="text" name="bookName" size="40" />
                        </td>
                        <td rowspan="6">
                            <img id="preview" style="margin-top:15px;margin-left:20px;display:none" />
                            <script for="preview" event="onerror">
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ISBN
                        </td>
                        <td>
                            <input type="text" name="ISBN" size="20" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Author
                        </td>
                        <td>
                            <input type="text" name="author" size="30" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Edition
                        </td>
                        <td>
                            <input type="text" name="Version" size="20" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Publisher
                        </td>
                        <td>
                            <input type="text" name="Publish" size="20" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Price
                        </td>
                        <td>
                            $<input type="text" name="gold" size="6" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Quantity
                        </td>
                        <td>
                            <input type="text" name="number" size="6" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Category
                        </td>
                        <td>
                            <select name="catalog">
                                <option value="Computer-Technology">Computer-Technology</option>
                                <option value="Finance">Finance</option>
                                <option value="Sports">Sports</option>
                                <option value="Education">Education</option>
                                <option value="Literature">Literature</option>
                                <% 
                                %>
                                <!--<option value="-1">添加类别...</option>-->
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Upload Book Image
                        </td>
                        <td>
                            <input type="file" name="upload"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            <input type="submit" name="insertBook" value="Submit">
                        </td>
                    </tr>
                </table>
            </form>
            <%----------------------------------------------------%>
                <%--所有图书界面--%>
            <% } else if (request.getParameter("branch").equals("all")) {
            %>
            <form action="manage_fb.jsp" method="post">
                <div id="item">
                    <a href="management.jsp?face=book&branch=new">Add A New Book</a>
                    &nbsp;&middot;&nbsp;<strong>All Books</strong>
                    
                </div>
                <table id="allBook" cellpadding="1" cellspacing="1">
                    <tr>
                        <td valign="bottom"><strong>Book Name</strong></td>
                        <td valign="bottom"><strong>Author</strong></td>
                        <td valign="bottom"><strong>Price</strong></td>
                        <td valign="bottom"><strong>Stock</strong></td>
                        <td valign="bottom"><strong>Sale</strong></td>
                        <td valign="bottom"><strong>Category</strong></td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <div id="line"></div>
                        </td>
                    </tr>
                    <% Vector<String[]> allBook = book.getAllBook();
     int max = allBook.size();
     int length = 10;
     int start = Integer.parseInt(request.getParameter("start"));
     int end = start + length;
     if (end > max) {
         end = max;
     }
     session.setAttribute("bookNumber", max);
     for (int i = start; i < end; i++) {
                    %>
                    <tr>
                        <td>
                            <input type="checkbox" name="check" value="<%=allBook.get(i)[0]%>"/>
                            <input type="hidden" name="book" value="<%=allBook.get(i)[0]%>" />
                            <%=allBook.get(i)[1]%>
                        </td>
                        <td><%=allBook.get(i)[2]%></td>
                        <td><%=allBook.get(i)[3]%></td>
                        <td><%=allBook.get(i)[5]%></td>
                        <td><%=allBook.get(i)[4]%></td>
                        <td><%=allBook.get(i)[6]%></td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <div id="line"></div>
                            <% if ((i + 1) % length == 0 || i == max - 1) {
                            String url = request.getServletPath();
                            url = url.substring(1, url.length());
                            %>
                            <div style="padding-top:20px;">
                        Add&nbsp;<input type="text" name="change" size="3" >&nbsp;More&nbsp;
                        <input type="submit" name="increase" value="OK"/>
                        <!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            按名称过滤：<input type="text" name="search" onchange=""/>-->
                            </div>
                            <div style="text-align:right;margin:5px 40px 5px 5px;">
                                <a href="management.jsp?face=book&branch=all&start=0">
                                    &laquo;First
                                </a>
                                &nbsp;
                                <% for (int j = 0; j <= (max - 1) / length; j++) {
         out.print("<a href=\"management.jsp?face=book&branch=all&start=" + (j * length) + "\">" + (j + 1) + "</a>&nbsp;&nbsp;");
     }
                                %>
                                <a href="<%="management.jsp?face=book&branch=all&start=" + (max - 1) / length * length%>">
                                    Last&raquo;
                                </a>
                                <% }
                                %>
                            </div>
                        </td>
                    </tr>
                    <% }
                    %>
                </table>
            </form>
            <%  }
        }
            %>
            <!--Book Interface End-->
        
        </div>
        <!--end main-->
        </div>
    </body>
</html>
