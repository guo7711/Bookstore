<%-- 
    Document   : changeCode
    Created on : 2009-12-1, 18:10:32
    Author     : YJY & DRF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home</title>
        <link href="css/user.css" rel="stylesheet" type="text/css" media="screen"/>
    </head>
    <body>
        <div class="wrap">
        <%@include file = "header.jsp" %>
        <jsp:useBean id="change" class="bookstore.Register" scope="request" />
        
        <%
        String UserName=(String)session.getAttribute("UserName");
        if (UserName == null || UserName.equals("")) {
            response.sendRedirect("login.jsp");
        }
        %>
        <!--start main-->
        <div class="middle">
            <div id="main">
                <div class="myTitle">修改密码&nbsp;</div>
                <form action="changeCode.jsp" method="get">
                    <input type="hidden" name="firsttime" value="No" >
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="16%" height="40" align="right" scope="row">&nbsp;原密码：</td>
                            <td width="34%"><input type="password" name="oldcode"/></td>
                            <td width="50%" rowspan="3" align="left" valign="middle"><font size="5"><strong>
                                        <%
        String oldcode = "", newcode1 = "", newcode2 = "";
        if (!(session.isNew())) {
            oldcode = request.getParameter("oldcode");
            if (oldcode == null) {
                oldcode = "";
            }
            oldcode = codeString(oldcode);
            newcode1 = request.getParameter("newcode1");
            if (newcode1 == null) {
                newcode1 = "";
            }
            newcode1 = codeString(newcode1);
            newcode2 = request.getParameter("newcode2");
            if (newcode2 == null) {
                newcode2 = "";
            }
            newcode2 = codeString(newcode2);
        }
        if (!oldcode.equals("") && !newcode1.equals("") && !newcode2.equals("")) {
            

            /*out.print(oldcode);
            out.print(newcode1);
            out.print(newcode2);*/

            if (!newcode1.equals(newcode2)) {
                out.print("两次输入新密码不一致。");
            } else if (change.checkPassword(oldcode,UserName)) {
                //session.setAttribute("userID", userID);
                //response.sendRedirect("index.jsp");
                change.changeRegiPassword(newcode1,UserName);
                change.changeLoginPassword(newcode1, UserName);
                out.print("密码修改成功！");
            } else {
                out.print("旧密码输入错误。");
            }
        } else if (request.getParameter("firsttime")!=null) {
            out.print("信息输入不完整。");
        }
                                        %>
                                    </strong>
                                </font>
                            </td>
                        </tr>
                        <tr>
                            <td height="40" align="right" scope="row">&nbsp;新密码：</td>
                            <td><input type="password" name="newcode1"/></td>
                        </tr>
                        <tr>
                            <td height="40" align="right" scope="row">&nbsp;重复新密码：</td>
                            <td><input type="password" name="newcode2" id="textfield">
                            </td>
                        </tr>
                        <tr>
                            <td scope="row">&nbsp;</td>
                            <td><label>
                                    <input type="submit" name="button" id="button" value="修改">
                            </label></td>
                            <td><a href="usercenter.jsp">&nbsp;返回用户中心</a></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <!--end main-->
        <%@include file = "WEB-INF/jspf/footer.jspf" %>
        </div>
    </body>
</html>
