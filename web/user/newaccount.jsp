<!DOCTYPE html>
<html lang="en">
<head>
<title>User Registration</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Net Banking Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="../fontawesome-free-5.14.0-web/css/all.min.css">
<link rel="stylesheet" href="../css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="../css/owl.carousel.css" type="text/css" media="all">
<link href="../css/owl.theme.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="../css/cm-overlay.css" />
<link href="../css/font-awesome.css" rel="stylesheet"> 
<link href="../css/user_css/newaccount.css" rel="stylesheet"> 
<link href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<script src="../js/jquery-1.11.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<link href="../css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="../js/wow.min.js"></script>
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
						<h1><a  href="../index.html">Net <span>Banking</span></a></h1>
					</div>
					<!--navbar-header-->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li class="hov"><a href="../index.html" class="active">Home</a></li>
						</ul>
							
						<div class="clearfix"> </div>	
					</div>
				</nav>
			</div>
		</div>
		<!--//header-->
		<!--Login--> 
    <div class="frame">
  <div class="center">
		
      <script src="../js/checkingForm.js"></script>
				<!--action="jsp/signup.jsp"-->	
                                <!--enctype="multipart/form-data"-->
		    <h1 style="text-align:center"><b>Open New Account</b></h1>
		    <p style="margin-left:20px">Please register your account with us to take the benefits of our facilities.</p>
                    <form  action="jsp/signup_conditionsCheck.jsp"  method="post"  id="formID"  onsubmit="return checkingForm()">
			<h3 style="text-align:center;background-color:slateblue">Personal Information</h3>
		    <label style="margin-left:20px">User Name:</label><input type="text" name="user" required  ><br><br>
                    <label style="margin-left:20px">Password (For Netbanking):</label><input type="password" name="pwd1"   required><br><br>
                    <label style="margin-left:20px">Confirm Password:</label><input type="password" name="pwd2"  required><span id="passMessage" style="color:red" ></span>
                    <br><br>
		    <label style="margin-left:20px">Email id:</label><input type="email" name="email"  required><span id="emailtMessage" style="color:red" >${emailErrorMsg}</span><br><br>
		    <label style="margin-left:20px">Contact:</label><input type="text" name="contact"  required><span id="contactMessage" style="color:red" >${mobileNumErrorMsg}</span><br><br>
                        <label style="margin-left:20px">Date of Birth:</label><input type="text" style="height:28px" name="birth" required><span id="dateMessage" style="color:red" >${dateErrorMsg}</span><br><br>
		    <label style="margin-left:20px">Profile Picture:</label><input type="file" id="myFile" name="profilePic" required>
  <br><br>
  <label style="margin-left:20px">Gender:</label><select style="height:28px" name="gender"><option>Female</option><option>Male</option><option>Other</option></select><br>
		    <h3 style="text-align:center;background-color:slateblue">Address Information</h3>
			<label style="margin-left:20px">Address:</label><input type="text" name="streetAdd" required><br><br>
                        <label style="margin-left:20px">City:</label><input type="text" name="city" required><br><br>
			<label style="margin-left:20px">State:</label><input type="text" name="state" required><br>
			<h3 style="text-align:center;background-color:slateblue">Bank Account Information</h3>
                        <label style="margin-left:20px">Account Pin:</label><input type="password" placeholder="4-digit" name="pin1" required><br><br>
                        <label style="margin-left:20px">Verify Account Pin:</label><input type="password" name="pin2" required><span id="pinMessage" style="color:red" ></span><br><br>
                    <h3 style="text-align:center;background-color:slateblue">Verification Information</h3>
                   <label style="margin-left:20px">Aadhar Number:</label><input type="text" name="aadharNum" required ><span id="aadharMessage" style="color:red" >${aadharNumErrorMsg}</span><br><br>
                    <label style="margin-left:20px">AadharCard FrontSide Pic:</label><input type="file" id="myFile" name="aadharFront" required><br><br>
                    <label style="margin-left:20px">AadharCard BackSide Pic:</label><input type="file" id="myFile" name="aadharBack" required><br><br>
                    <br>
                    <input type="submit" value="Register" id="checkFirst" style="margin-left:280px;width:75px;">
		    </form>
                    
        </div>
    </div>
        </div>
    <!--value="Register" name="register"--> 
	<!-- //contact -->
	<!-- footer -->
	<!-- //copyright -->
	<script src="../js/jarallax.js"></script>
	<script src="../js/SmoothScroll.min.js"></script>
	<script type="text/javascript">
		/* init Jarallax */
		$('.jarallax').jarallax({
			speed: 0.5,
			imgWidth: 1366,
			imgHeight: 468
		});
	</script>
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
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
<script src="../js/owl.carousel.js"></script>  
</body>	
</html>
<%
    System.out.println(request.getHeader("referer"));
                        session.removeAttribute("emailErrorMsg");
                        session.removeAttribute("dateErrorMsg");
                        session.removeAttribute("aadharNumErrorMsg");
                        session.removeAttribute("mobileNumErrorMsg");
    %>