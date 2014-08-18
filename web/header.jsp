<%-- 
    Document   : header
    Created on : Aug 16, 2014, 9:07:54 PM
    Author     : Rachel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="jquery-ui-1.11.1.custom/jquery-ui.css" rel="stylesheet">
	<script src="jquery-ui-1.11.1.custom/external/jquery/jquery.js"></script>
	<script src="jquery-ui-1.11.1.custom/jquery-ui.js"></script>       
       <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,600' rel='stylesheet' type='text/css'>	 
		<!-- Styles -->
		<!-- Bootstrap CSS  -->
     	<link href="css/bootstrap.min.css" rel="stylesheet">
		<!-- Font awesome CSS  -->
		<link href="css/font-awesome.min.css" rel="stylesheet">	
		<!-- Animate CSS -->
		<link href="css/animate.min.css" rel="stylesheet">
		<!-- Custom CSS -->
                <link href="css/style.css" rel="stylesheet">
		<!-- Favicon -->
		<link rel="shortcut icon" href="#">
           <link href="css/layout.css" rel="stylesheet">
                <style>
	body{
		font: 100% "Trebuchet MS", sans-serif;
		margin: 50px;
	}
	.demoHeaders {
		margin-top: 2em;
	}
	#dialog-link {
		padding: .4em 1em .4em 20px;
		text-decoration: none;
		position: relative;
	}
	#dialog-link span.ui-icon {
		margin: 0 5px 0 0;
		position: absolute;
		left: .2em;
		top: 50%;
		margin-top: -8px;
	}
	#icons {
		margin: 0;
		padding: 0;
	}
	#icons li {
		margin: 2px;
		position: relative;
		padding: 4px 0;
		cursor: pointer;
		float: left;
		list-style: none;
	}
	#icons span.ui-icon {
		float: left;
		margin: 0 4px;
	}
	.fakewindowcontain .ui-widget-overlay {
		position: absolute;
	}
	select {
		width: 200px;
	}
	</style>
    </head>
    <body>
    
    <%-- any content can be specified here e.g.: --%>
<%! //处理字符串的方法：
  public String codeString(String s)
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


<script>
    
function myfunction()
{
document.search..submit();
}
function submit()
{
    document.search..submit();
}
function setHome()
{
document.body.style.behavior='url(#default#homepage)';
document.body.setHomePage('http://localhost:8088/BookStore/');
} 


</script>

  <div class="header">
    <div id="headerleft"> <a href="index.jsp">Hannah's Book Store</a>
      <p>The Smallest Book Store in the World</p>
    </div>
    <div id="headerright">
      <%String name=(String)request.getParameter("UserName");
                    String sname=(String)session.getAttribute("UserName");
                    if(sname==null||sname.equalsIgnoreCase(""))
                        {
                        %>
      <a href="register.jsp">Sign Up</a> <a href="login.jsp">Sign In</a> 
      <a href="#" onclick="window.external.addFavorite('http://localhost:8088/BookStore','BookStore')" title=title>Add to Bookmark</a>
      <%
                    }
                    else{
                    %>
      <h1 style="font-size:16px;">Welcome <%=sname%> </h1>
      <span style="font-size:14px;"><a href="ShopCart.jsp?UserName=<%=name%>">My Cart</a></span>
      <span style="font-size:14px;"><a href="ShopCart.jsp">My Wish List</a></span>
      <br/>
      <span style="font-size:14px;"><a href="usercenter.jsp">My Account</a></span>
      <span style="font-size:14px;">&nbsp;&nbsp;<a href="quit.jsp?UserName=name">Sign Out</a></span>
      <%}
                            %>
    </div>
  </div>
  <form  method="post" name="search" action="detailsearch.jsp" style="margin:2px 0px 0px">
    <div class="search">
      <table border="0">
        <tbody>
          <tr>
            <td align="center" >Search
            <td width="100">
                <div id="searchCategory" style="padding-left:10px;">
                <select class="category" name="catelog" style="width:200px;" onchange="myfunction()" id="selectmenu">
                  <option value="Computer-Technology" selected="selected">Computer-Technology</option>
                  <option value="Finance">Finance</option>
                  <option value="Sports">Sports</option>
                  <option value="Education">Education</option>
                  <option value="Literature">Literature</option>
                </select>         
                    
              </div>
                <td>
                    
                    <div id="radioset" style="padding-top:5px;padding-left: 10px">
                        <input type="radio" id="radio1" name="according" checked="checked" value="Book Name"><label for="radio1">Book Name</label>
		<input type="radio" id="radio2" name="according"><label for="radio2" value="Author">Author</label>
		
                </div>
                    
            <td width="250" style="padding-left:15px;">
                <div class="sidebar-search">
					
						<div class="input-group">
							<input type="text" class="form-control" name="keywords" placeholder="Text to search">
                                                        <span class="input-group-btn" style="color:#11abf3">
                                                            <button class="btn btn-danger" type="submit" value="Search" style="height:140%">
                                                                <i class="icon-search"></i></button>
							</span>
						</div>
					
                </div>
                <!--<input name="keywords" class="searchWord" type="text" size="25" />-->
            <td>
                
                
                <!--<input name="according" type="radio" value="Book Name" checked="checked">
              Book Name
            <td><input name="according" type="radio"  value="Author" >
              Author 
            <td><input name="button" type="submit"  value="Search" >-->
                
              
                    
          </tr>
        </tbody>
      </table>
    </div>
  </form>
  <script>
$( "#selectmenu" ).selectmenu();
$( "#radioset" ).buttonset();
</script>
</body>

</html>
