<%-- 
    Document   : showPerson
    Created on : 2009-12-1, 17:48:25
    Author     : YJY & DRF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <link href="css/user.css" rel="stylesheet" type="text/css" media="screen"/>
    </head>
    <body>
        <div class="wrap">
        <%@include file = "header.jsp" %>
        <% 
        %>
        <!--start main-->
        <jsp:useBean id="user" class="bookstore.Register" scope="request" />
        <%String userName = (String) session.getAttribute("UserName");
        
        %>

        <div class="middle">
            <div id="main">
                <div class="myTitle">My Profile&nbsp;</div>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="12%"><strong><br>&nbsp;E-Mail Address: </strong></td>
                        <td><br>&nbsp;
                            <%
        out.print(userName);
                            %>
                        </td>
                        <td width="33%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><strong><br>&nbsp;Full Name：</strong></td>
                        <td><br>&nbsp;
                            <%
        out.print(user.getRealName(userName));
                            %>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td width="12%"><strong><br>&nbsp;Gender: </strong></td>
                        <td><br>&nbsp;
                            <%
                            out.print(user.getSex(userName));
                            %>
                        </td>
                        <td width="33%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td width="12%"><strong><br>&nbsp;Phone: </strong></td>
                        <td><br>&nbsp;
                            <%
                            out.print(user.getPhone(userName));
                            %>
                        </td>
                        <td width="33%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><strong><br>&nbsp;Shipping Address: </strong></td>
                        <td><br>&nbsp;
                            <%
                            out.print(user.getAdd(userName));
                            %>&nbsp;<font size="-1"><a href="newAddress.jsp">Update</a></font>
                        </td>
                    </tr>
                    <tr>
                        <td><strong><br>&nbsp;Zip Code: </strong></td>
                        <td><br>&nbsp;
                            <%
                            out.print(user.getmailcode(userName));
                            %>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        
                        <td><a href="usercenter.jsp">Back to My Account</a></td>
                    </tr>
                </table>
            </div>
        </div>
        <!--end main-->
        <%@include file = "WEB-INF/jspf/footer.jspf" %>
        </div>
    </body>
</html>
