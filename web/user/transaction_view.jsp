<%@page  import="netbankingDAO.Transactions" %>  
<%!
    int i=0;
    Transactions t;
%>

<%
    t=(Transactions)request.getAttribute("t");
    i=0;
%>    
<!DOCTYPE html>
<html lang="en">
<head>
<title>Transaction History</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Net Banking Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="../../fontawesome-free-5.14.0-web/css/all.min.css">
<link rel="stylesheet" href="../../css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="../../css/owl.carousel.css" type="text/css" media="all">
<link href="../../css/owl.theme.css" rel="stylesheet">
<link href="../../css/user_css/transaction.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="../../css/cm-overlay.css" />
<link href="../../css/font-awesome.css" rel="stylesheet"> 
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
						<h1><a  href="../userhome.html">Net <span>Banking</span></a></h1>
					</div>
					<!--navbar-header-->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li class="hov"><a href="../userhome.html" class="active">Home</a></li>
							
							<li class="topnav-centered" style="height: 5vh;"><a href="logout.jsp" class="topnav-centere" style="background-color: black;text-align: center;"><span style="font-size: 20px;color: orange;text-align: center;"><br>User</span><hr>LOGOUT</a></li>
							
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
					<a href="../userhome.html" style="margin-top: 6.7em;">User Home</a>
					<a href="userprofile.jsp">User Profile</a>
                                        <a href="useraccdetails_controller.jsp">User Account Details</a>
					<a href="transactions.jsp">Transaction History</a>
					<a href="../onlinepayment_view.jsp">Online Payment</a>
				  </div>
			</div>
		</div>
                <h3 style="text-align:center;background-color:slateblue">Dedit</h3>
        <div id="tab">
				<table id="t01">
					<tr><th colspan="8" style="color: red;font-size: 30px;font-family: monospace;letter-spacing: 3px;text-decoration: underline;">Transaction History</th>
					</tr>
					<tr>
					  <th>Transaction Date Time</th>
					  <th>Reference No</th> 
					  <th>Description</th>
					  <th>Withdraw</th>
                                          <th>Deposit</th>
                                          <th>Closing Balance</th>
					  <!--<th>Account Balance</th>-->
					</tr>
                                        <% try{System.out.println(t); while(i<t.numberOfRows()){
                                            %>
					<tr>
                                            <td><%= t.getTransactionDate(i) %></td>
                                            <td><%= t.getTransactionID(i) %></td>
                                            <td><%= t.getDescription(i) %></td>
                                            <td><%  if(t.getUserAccNum().equals(t.getSenderAccNum(i))){ %>
                                                Rs.<%= t.getAmountTransfer(i)  %><% } %></td>
                                           <td><%  if(!t.getUserAccNum().equals(t.getSenderAccNum(i))){ %>
                                           Rs.<%= t.getAmountTransfer(i)  %>
                                           <% } %></td>
                                           <td>Rs.<%= t.getClosingBalance(i) %></td>
					</tr>
                                        <% i++;} }catch(Exception e){
                                                e.printStackTrace();
                                                System.out.println("transaction history m dikkat h");
                                        }%>
				  </table>
			</div>
                                     </div>
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