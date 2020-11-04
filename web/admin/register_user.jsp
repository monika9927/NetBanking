<%@page  import="netbankingDAO.UserProfile" %>
<%@page  import="netbankingDAO.UserAccDetails" %>

<%!
    String profileImg;
    String aadharFrontImg;
    String aadharBackImg;
%>
<% 
    System.out.println(request.getAttribute("useraccinfo"));
    UserAccDetails uad=(UserAccDetails)request.getAttribute("useraccinfo");
    System.out.println(request.getAttribute("userinfo"));
    UserProfile up=(UserProfile)request.getAttribute("userinfo");
    profileImg="data:image/png;base64,"+up.getProfilePic();
    aadharFrontImg="data:image/png;base64,"+up.getAadharFrontPic();
    aadharBackImg="data:image/png;base64,"+up.getAadharBackPic();
    session.setAttribute("userName", up.getUserName());
    session.setAttribute("email", up.getEmail());
    session.setAttribute("profilePic", profileImg);
    session.setAttribute("aadharNum", up.getAadharNum());
%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>User Information</title>

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
<link href="../../css/admin_css/register_user.css" rel="stylesheet">
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
<style>
    body{
     background: url(https://source.unsplash.com/1600x900/?indian-bank,money) repeat 0px 0px;
    background-size: cover;
    }
    </style>        
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
						<h1><a  href="../index.html">Net <span>Banking</span></a></h1>
					</div>
					<!--navbar-header-->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li class="hov"><a href="adminhome.html" class="active">Home</a></li>
							
							<li class="topnav-centered" style="height: 5vh;"><a href="../index.html" class="topnav-centere" style="background-color: black;text-align: center;"><span style="font-size: 20px;color: orange;text-align: center;"><br>Admin</span><hr>LOGOUT</a></li>
							
						</ul>
							
						<div class="clearfix"> </div>	
					</div>
				</nav>
			</div>
		</div>
		<!--//header-->
		<!--Login-->
		
		<div id="side">
				<div class="sidenav">
					<a href="../adminhome.html" style="margin-top: 6.7em;">Admin Home</a>
					<a href="controller/userdetails.jsp">User Details</a>
					<a href="controller/request_controller.jsp">New Request</a>
				  </div>
			</div>
    <div class="frame">
  <div class="center">
    
		<div>
		<h1><b>User Information</b></h1>
		<h3 style="text-align:center; background-color:slateblue">Personal Information</h3>
                <label>User Name:</label><%= up.getUserName() %><br><br>
		<label>Email id:</label><%= up.getEmail() %><br><br>
		<label>Contact:</label><%= up.getMobileNum() %><br><br>
                <label>Register Date:</label><%= uad.getDate() %><br><br>
		<label>Date of Birth:</label><%= up.getDOB() %><br><br>
                <label>Gender:</label><%= up.getGender() %><br>
                <h3 style="text-align:center;background-color:slateblue">Address Information</h3>
		<label>Address:</label><%= up.getAddress() %><br><br>
		<label>City:</label><%= up.getCity() %><br><br>
                <h3 style="text-align:center;background-color:slateblue">Verification Information</h3>
                <label>Aadhar Number:</label><%= up.getAadharNum() %><br><br>
                <div class="profile">
			<div class="image">
				<div class="zoom">
				<div class="circle-2"></div>
                                <img src="<%= profileImg %>" width="150" height="150"  style="margin-top:25px" alt="User Photo">

			<div class="name">User Profile Picture</div>
                        			</div>
                                </div>   
                </div>
                <div class="profile">
			<div class="image">
				<div class="zoom">
				<div class="circle-2"></div>
				<img src="<%= aadharFrontImg %>"  width=150 height="150"  style="margin-top:25px;margin-left:40px;" alt="Aadhar Card Front Side Photo">
			<div class="name" style="margin-left:30px;">Aadhar Card Front Side Photo</div>
                    </div>
                        </div>
                        </div>
                <div class="profile">        
                        <div class="image">
				<div class="zoom">
				<div class="circle-2"></div>
				<img src="<%= aadharBackImg %>" width="150" height="150"  style="margin-top:25px;margin-left:60px;" alt="Aadhar Card Back Side Photo">
			<div class="name" style="margin-left:45px;">Aadhar Card Back Side Photo</div>
		</div>
                </div>
                        <br><br>
                <a href="../allote.jsp">
                <input type="submit" value="Assign Account Number" style="width:190px;">
                </a>
		</div>
		
		
  </div>	
  </div>
</div>
	
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