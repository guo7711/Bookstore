<%-- 
    Document   : changeAddress
    Created on : 2009-12-13, 18:08:55
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/layout.css" rel="stylesheet" type="text/css" media="screen"/>
    </head>
    <body>
        <%String UserName=(String)session.getAttribute("UserName");
        %>
        <jsp:useBean id="add" class="bookstore.Register" scope="session"/>
        <%String address=add.getAdd(UserName);
        %>
        <div class="wrap">
            <%@include file="header.jsp" %>
            <form name="chA" action="changeAddress.jsp" method="post">
            <div class="changeAdd">
                <table border="0" cellspacing="15">

                    <tbody>
                        <tr>
                            <td>
                            <p>旧地址:<%=address%></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>新地址:</label>
                            <input name="password" type="text">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" value="修改送货地址"/>
                                    <a href="usercenter.jsp" style="padding-left:100px;">返回用户中心</a>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
            </form>
            <%@include file="/WEB-INF/jspf/footer.jspf" %>
        </div>
    </body>
</html>
