<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">        
        
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
    </head>
    
    <body>
        <!-- Sidebar Start-->
			<!-- Menu for tablets and mobile -->
			
                        <div class="sidebar">
				<!-- Logo of company -->
				<div class="logo text-center">
					<h1><a href="#">Category</a></h1>
					<p><i class="icon-home scolor"></i></p>
				</div>
                                <!--
				<div class="sidebar-search">
					<form>
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Text to search">
							<span class="input-group-btn">
								<button class="btn btn-danger" type="button"><i class="icon-search"></i></button>
							</span>
						</div>
					</form>
				</div>
                                -->
				<!-- Navigation menu list -->
				<ul class="list-unstyled list">
					<li><a class="book" href="search.jsp?catelog=<%=java.net.URLEncoder.encode("Computer-Technology")%>">Computer-Technology</a></li>
					<li><a class="book" href="search.jsp?catelog=<%=java.net.URLEncoder.encode("Finance")%>">Finance</a></li>
					<li><a class="book" href="search.jsp?catelog=<%=java.net.URLEncoder.encode("Sports")%>">Sports</a></li>
					<li><a class="book" href="search.jsp?catelog=<%=java.net.URLEncoder.encode("Education")%>">Education</a></li>
					<li><a class="book" href="search.jsp?catelog=<%=java.net.URLEncoder.encode("Literature")%>">Literature</a></li>
					
					
				</ul>
                                
                                
				
			</div>
    </body>
</html>

