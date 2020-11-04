
            function checkingForm()
            {
                var form=document.getElementById("formID");
                console.log(form.method);                                                           
                var pwd1 = document.getElementsByName("pwd1")[0].value;
                console.log(pwd1);
                var pwd2 = document.getElementsByName("pwd2")[0].value;
                console.log(pwd2);
                var pin1 = document.getElementsByName("pin1")[0].value;
                var pin2 = document.getElementsByName("pin2")[0].value;
                var mobileNum=document.getElementsByName("contact")[0].value;
                var aadharNum=document.getElementsByName("aadharNum")[0].value;
                var check=1;
                if(pwd1.length<8){
                    document.getElementById('passMessage').innerHTML="password length should be greater than 8 character";
                    check=0;
                }
                else
                if(pwd1!==pwd2){
                    document.getElementById('passMessage').innerHTML="password doesn't match";
                    check=0;
                }
                else{
                    document.getElementById('passMessage').innerHTML="";
                }
                if(pin1!==pin2){
                    document.getElementById('pinMessage').innerHTML="pin doesn't match";
                    check=0;
                }
                else{
                    if(pin1.length!==4){
                        document.getElementById('pinMessage').innerHTML="pin should be of 4 digit";
                        check=0;
                    }
                    else{
                        document.getElementById('pinMessage').innerHTML="";
                    }
                
                }
                
                console.log(mobileNum);
                if(mobileNum.length!==10){
                    document.getElementById('contactMessage').innerHTML="contact should be of 10 digit";
                    check=0;
                }
                else{
                    document.getElementById('contactMessage').innerHTML="";
                }
                if(aadharNum.length!==16){
                    document.getElementById('aadharMessage').innerHTML="Aadhar number should be of 16 digit.";
                    check=0;
                }
                else{
                    document.getElementById('aadharMessage').innerHTML="";
                }
                if(check===1){
                    console.log(" check==1");
                    return true;
                }
                else{
                    return false;
                }
            }