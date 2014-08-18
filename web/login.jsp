<%--
    Document   : register
    Created on : 2009-11-14, 21:06:06
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
//session.setAttribute("UserName", "");
//session.setAttribute("Password", "");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/layout.css" rel="stylesheet" type="text/css" media="screen"/>
<title>JSP Page</title>
</head>
<body>
    <div class="wrap">
<%@include file="header.jsp" %>
<div class="login">
  <form  method="post"action="login.jsp">
    <div style="height:auto; margin-bottom:10px;">
      <p style="font-weight:bold;text-align:center;margin-top:10px;">Don't have an account? Sign Up Now.</p>
      <input style="margin-left:70px;" type="button" value="Sign Up" onclick="window.location='register.jsp'">
    </div>
    <table style="border-style:none">
      <tr>
        <td>E-Mail Address: </td>
        <td><input type="text" name="UserName"></td>
        <span></span> </tr>
      <tr>
        <td>Password: </td>
        <td><input type="password" name="Password"></td>
      </tr>
      <tr>
        <td><img src="./images/captcha.jpeg"></td>
      </tr>
      <tr>
        <td>Captcha: </td>
        <td><input type="text" name="Code"></td>
      </tr>
      <tr>
        <td style="padding-left:70px; padding-top:20px;" colspan="2"><input type="submit" name="submit" value="Login"/></td>
      </tr>
    </table>
  </form>
</div>
<jsp:useBean id="bookstore" class="bookstore.Login" scope="session">
</jsp:useBean>
<%
 //提交信息后，进行注册操作：
String inputCode = request.getParameter("Code");
String code=(String)session.getAttribute("rand");
   String Password="",UserName="";

 //if(inputCode.equals(code)){
     if(!(session.isNew()))
    { Password=request.getParameter("Password");
      if(Password==null)
        {Password="";
        }
     Password=codeString(Password);
     UserName=request.getParameter("UserName");
       if(UserName==null)
        {UserName="";
        }
     UserName=codeString(UserName);


   }
  if(!(Password.equals(""))&&!(UserName.equals("")))
   {%>
<jsp:setProperty  name= "bookstore"  property="password"  value="<%=Password%>" />
<jsp:setProperty  name= "bookstore"  property="userName" value="<%=UserName%>" />
<%

     int i;
     i=bookstore.getLoginInfo();
     if(i==1)
     {

         session.setAttribute("UserName", UserName);
     %>
<jsp:forward page="index.jsp">
  <jsp:param name="UserName" value="<%=UserName%>"/>
</jsp:forward>
<%
     }
     else if(i==2)
         {
          session.setAttribute("UserName", UserName);
          response.sendRedirect("management.jsp?face=order&branch=new");
         %>

<%
     }
     else {
         %>
<script>
    alert("There was an error with your E-Mail/Password combination. Please try again.");
</script>
<%
     }
     }
     //}
   //else{
     %>
<%//}%>
<p></p>
</div>
<%@include file="/WEB-INF/jspf/footer.jspf" %>
</body>
</html>
