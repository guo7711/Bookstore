<%-- 
    Document   : newAddress
    Created on : 2009-12-1, 19:20:54
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>�������-�û�����</title>
       
        <link href="css/user.css" rel="stylesheet" type="text/css" media="screen"/>
    </head>
    <body>
    <div class="wrap">
        <%@include file = "WEB-INF/jspf/header.jspf" %>
        <jsp:useBean id="user" class="bookstore.Register" scope="session" />
        <%String UserName = (String) session.getAttribute("UserName");
        String address = user.getAdd(UserName);
        String code = user.getmailcode(UserName);
        %>
        <% if (UserName == null || UserName.equals("")) {
            response.sendRedirect("login.jsp");
        }
        %>
        <!--start main-->
        <div class="middle">
            <div id="main">
                <div class="myTitle">�޸��ͻ���ַ&nbsp;</div>
                <form action="newAddress.jsp" method="post">
                    <input type="hidden" name="firsttime" value="No" >
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="10%" height="40" scope="row">&nbsp;ԭ��ַ:</td>
                            <td><%=address%>     </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td height="40" scope="row">&nbsp;�µ�ַ��</td>
                            <td width="43%"><input type="text" name="newcode" value="" ></td>
                            <td width="47%" rowspan="2" valign="middle"><font size="5"><strong>
                                        <% String newaddress = "";
        String newcode = "";
        if (!(session.isNew())) {
            newaddress = request.getParameter("newcode");
            if (newaddress == null) {
                newaddress = "";
            }
            newaddress = codeString(newaddress);
        }
        if (!(session.isNew())) {
            newcode = request.getParameter("postcode");
            if (newcode == null) {
                newcode = "";
            }
            newcode = codeString(newcode);
        }
        if (request.getParameter("firsttime") != null) {
            if ((newaddress.equals("") || newcode.equals(""))) {
                out.print("��Ϣ��д��������");
            } else {
                user.changeAddr(newaddress,UserName, newcode);
                out.print("��ַ�޸ĳɹ���");
            }
        }
                                        %>
                            </strong></font></td>
                        </tr>
                        <tr>
                            <td height="40" scope="row">&nbsp;ԭ�ʱࣺ</td>
                            <td>&nbsp;<% out.print(code);%></td>
                        </tr>
                        <tr>
                            <td height="40" scope="row">&nbsp;���ʱࣺ</td>
                            <td><label>
                                    <input type="text" name="postcode" value="">
                            </label></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td scope="row">&nbsp;</td>
                            <td><label>
                                    <input type="submit" name="button" id="button" value="�޸�">
                            </label></td>
                            <td><a href="usercenter.jsp">&nbsp;�����û�����</a></td>
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
