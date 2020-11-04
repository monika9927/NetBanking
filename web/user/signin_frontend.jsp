<%--<%@ include  file = "jsp/signin.jsp" %>--%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <title>Login</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="../../css/flipbox.css">
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"  crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"  crossorigin="anonymous">


<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" crossorigin="anonymous"></script>
<style>
    @import url('https://fonts.googleapis.com/css?family=Numans');

html,body{
background-image: url('https://source.unsplash.com/1600x900/?rupees,INR');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}
.container{
height: 100%;
align-content: center;
}



.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow:  0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;

}

.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}


</style>
</head>

<body>
  <div class="wrapper" style="height:90vh;margin-left:100px;margin-top:40px;"> <a href="../../index.html"><button type="button" class="btn" style="margin: 0% 40%; margin-top: -10px;margin-bottom: 15px;color: black; box-shadow: -1px 1px 10px  rgb(253, 214, 38);border: 2px solid black ;background: -webkit-linear-gradient(-595rad , rgb(107, 0, 128 ), rgb(247, 0, 255) 40%,red 99%);
    transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55);font-weight: bolder;font-size: 20px;" >HOME</button>
  </a>
    <div class="title-text">
      <div class="title login" style="background-color: blanchedalmond;border-top: 2px solid black;border-top-left-radius: 25px;border-left: 2px solid black;border-bottom: 2px solid black;">
       User Login<br></div>
    </div>
    <div class="form-container">
        <br>
        <br>
            <div class="form-inner">
          <form action="" method="post" class="login">
          <div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
              <input type="text" class="form-control" name="signinNetBankingNum"  placeholder="Net Banking Number" required><br><span style="color:red" >${wrongNetbankingNumMsg}</span>
						
          </div>
          
         <div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
             <input type="password" name="signinPassword" class="form-control" placeholder="password" required><br><span style="color:red" >${wrongPasswordMsg}</span>
          </div>
              <br>
              <input type="submit" name="submit" style="margin-left:130px; " value="LogIn">
            <div class="signup-link" style="color: rgb(133, 2, 2);">
            Not an account? <a href="../newaccount.jsp"
              style=" font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; font-size: larger;font-weight: 500;">Create
              account</a></div>
        </form>
        
        
      </div>
    </div>
   
    </div>
  
  <script>
    const loginText = document.querySelector(".title-text .login");
    const loginForm = document.querySelector("form.login");
    const loginBtn = document.querySelector("label.login");
    const signupBtn = document.querySelector("label.signup");
    const signupLink = document.querySelector("form .signup-link a");
    signupBtn.onclick = (() => {
      loginForm.style.marginLeft = "-50%";
      loginText.style.marginLeft = "-50%";
    });
    loginBtn.onclick = (() => {
      loginForm.style.marginLeft = "0%";
      loginText.style.marginLeft = "0%";
    });
    signupLink.onclick = (() => {
      signupBtn.click();
      return false;
    });
  </script>

</body>

</html>
<%
    session.removeAttribute("wrongNetbankingNumMsg");
    session.removeAttribute("wrongPasswordMsg");
 %>
