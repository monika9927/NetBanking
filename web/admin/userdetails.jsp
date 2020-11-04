<%@page import="java.sql.SQLException"%>
<%@page import="netbankingDAO.adminDAO.UserDetails"%>
<%@page  import="java.sql.ResultSet ,java.sql.Connection, java.sql.DriverManager" %>
<%!
    Connection conn;
    ResultSet rst;
 %>
 
 <%
     try{
//            Class.forName("com.mysql.jdbc.Driver");
//            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbankingdb?serverTimezone=UTC","root","");
            System.out.println("Connection Established"); 
            rst=(ResultSet)request.getAttribute("rst");
            System.out.println(rst);
            
//     }catch(SQLException se){
//            System.out.println("SQL m Dikkat");
//            se.printStackTrace();
//        }
     }catch(Exception e){
            System.out.println("Dusri koi dikkat h");
            e.printStackTrace();
        }
   
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>User Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Net Banking Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="../../css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="../../css/owl.carousel.css" type="text/css" media="all">
<link href="../../css/owl.theme.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="../../css/cm-overlay.css" />
<link href="css/font-awesome.css" rel="stylesheet"> 
<link href="../../css/admin_css/userdetails.css" rel="stylesheet"> 
<link href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<script src="../../js/jquery-1.11.1.min.js"></script>
<script src="../../js/bootstrap.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<link href="../../css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="../../js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<script>
$(document).ready(function() { 
	$("#owl-demo").owlCarousel({
 
		autoPlay: 3000,
		autoPlay:true,
		items : 3,
		itemsDesktop : [640,5],
		itemsDesktopSmall : [414,4]
 
	});
	
}); 
</script>
<style>
    body{
     background: url(https://source.unsplash.com/1600x900/?indian-bank,money) repeat 0px 0px;
    background-size: cover;
    }
   
    </style>
    
</head>
<body>

	
	
	<div class="banner">
		
		<div class="header">
			<div class="container">		
				<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<h1><a  href="../../index.html">Net <span>Banking</span></a></h1>
					</div>
					<!--navbar-header-->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li class="hov"><a href="../adminhome.html" class="active">Home</a></li>
							
							<li class="topnav-centered" style="height: 5vh;"><a href="../../index.html" class="topnav-centere" style="background-color: black;text-align: center;"><span style="font-size: 20px;color: orange;text-align: center;"><br>Admin</span><hr>LOGOUT</a></li>
							
						</ul>
							
						<div class="clearfix"> </div>	
					</div>
				</nav>
			</div>
		</div>
		<!--//header-->
		<!--Login-->
		
		<div id="grid">
			<div id="side">
				<div class="sidenav">
					<a href="../adminhome.html" style="margin-top: 6.7em;">Admin Home</a>
					<a href="userdetails.jsp">User Details</a>
					<a href="request_controller.jsp">New Request</a>
				  </div>
			</div>
			
		
			<div id="tab">
				<table id="t01">
					<tr><th colspan="13" style="color: red;font-size: 30px;font-family: monospace;letter-spacing: 3px;text-decoration: underline;">User personal and Account Details</th>
					</tr>
					<tr>
					  <th>UserName</th>
					  <th>Account No.</th> 
					  <th>Net Banking<br>Number</th>
                                           <th>Balance</th>
					  <th>Account Type</th>
					  <th>Account Status</th>
                                          <th>Registration Date</th>
					  <th>View Statement</th>
					  <th>Email Address</th>
					  <th>Mobile</th>
					  <th>Address</th>
					  <th>Date Of Birth</th>
                                           
                                           <th>Action</th>
					</tr>
                                        <% try{ 
                                            while(rst.next()){
                                         %>
                                         String a=rst.getString("AadharNum");
					<tr>
                                          <td><%= rst.getString("Name")  %></td>
					  <td><%= rst.getString("AccountNum")  %></td>
                                          <td><%= rst.getString("NetBankingNum")  %></td>
                                          <td><%= rst.getString("Balance")  %></td>
                                          <td><%= rst.getString("AccountType")  %></td>
                                          <td><%= rst.getString("AccountStatus")  %></td>
                                          <td><%= rst.getDate("RegisterDateTime")  %></td>
                                          <td><a href="userstatement_controller.jsp?aadharNum=<%= rst.getString("AadharNum")%>" class="tda"><u>Statement</u></a></td>
                                          <td><%= rst.getString("EmailId")  %></td>
                                          <td><%= rst.getString("MobileNum")  %></td>
					  <td><%= rst.getString("StreetAddress")%><%=","+ rst.getString("City")%><%="," +rst.getString("State")%></td>
                                          <td><%= rst.getDate("DOB")%></td>
					  
					  <td><a href="delete.jsp?aadharNum=<%= rst.getString("AadharNum")%>" class="tda"><u>Delete</u></a></td>
					</tr>
                                        <% 
                                             }
                                            }catch(Exception e){
                                                System.out.println("userdetails");
                                                e.printStackTrace();
                                            } 
                                        %>
					
				  </table>
		
			</div>
		
		</div>

        </div>	
	<!-- //contact -->
	<!-- footer -->
	
	<footer style="margin-top: 21%;">
		<div class="copyright" style="align-items: flex-end;">
			<p style="text-align: center;color: white;background-color: black;">© year Net Banking. All rights reserved | Design by <a href="../../Self Web/index.html">NIKHIL DUBEY</a></p>
		</div>
	</footer>
		
	
	
	<!-- //copyright -->
	<script src="../../js/jarallax.js"></script>
	<script src="../../js/SmoothScroll.min.js"></script>
	<script type="text/javascript">
		/* init Jarallax */
		$('.jarallax').jarallax({
			speed: 0.5,
			imgWidth: 1366,
			imgHeight: 768
		});
	</script>
<script type="text/javascript" src="../../js/move-top.js"></script>
<script type="text/javascript" src="../../js/easing.js"></script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
<script src="../../js/owl.carousel.js"></script>  
</body>	
</html>
<%
  UserDetails ud=(UserDetails)request.getAttribute("ud");
  ud.closeConn();
%>

