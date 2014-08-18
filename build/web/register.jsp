<%-- 
    Document   : register
    Created on : 2009-11-14, 21:06:06
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="gb2312"%>
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
        <title>Free Sign Up</title>
        <link href="css/layout.css" rel="stylesheet" type="text/css" media="screen"/>
        <script type="text/javascript">
        function check()
        {

        }
        
        </script>
    </head>
    <body>
        <div class="wrap">
        <%@include file="header.jsp" %>
        <div class="register">
            <form name="register" action="" method="post" onsubmit="return check()">
                <ul>
                    <li class="field">
                        <div class="input">
                            E-Mail Address: <input name="email" id="aa" type="text" >
                        </div>
                    </li>
                    <li class="field">
                        <div class="input">
                            Password: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input name="password" type="password">
                        </div>
                    </li>
                    <li class="field">
                        <div class="input">
                            Type It Again: &nbsp;&nbsp;&nbsp;&nbsp;<input name="password1" type="password">
                        </div>
                    </li>
                    <li style="padding-left:80px; padding-top:20px;">
                        <input type="submit" value="submit" >
                    </li>
                </ul>
            </form>
        </div>
        <jsp:useBean id="reg" class="bookstore.Register" scope="session"/>
        <%
        String email="",password="",password1="";
        if(!(session.isNew()))
    { email=request.getParameter("email");
      if(email==null)
        {email="";
        }
     email=toChinese(email);
     password=request.getParameter("password");
       if(password==null)
        {password="";
        }
     password=toChinese(password);
     password1=request.getParameter("password1");
         if(password1==null)
        {password1="";
        }
     password1=toChinese(password1);
     }
        %>
        <%
        if(!(email.equals(""))&&!(password.equals(""))&&!(password1.equals("")))
        {
            int i=reg.register(email, password);
            if(i==0){%>
        <script>
            alert("Account already exists.");
        </script>
            <%}else{%>
        <jsp:useBean id="login" class="bookstore.Login" scope="session"/>
        <%
        login.addUser(email, password);
        %>
        <script>
            alert("Sign up succesfull!");
        </script>
        <%}}%>
        
        <%@include file="/WEB-INF/jspf/footer.jspf" %>
        </div>
   </body>
</html>
