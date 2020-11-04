    <%@page import="java.text.ParsePosition, java.security.MessageDigest,java.io.InputStream,java.util.Date,
            java.text.SimpleDateFormat,java.io.File,java.io.FileInputStream , java.sql.*" contentType="text/html"
            pageEncoding="UTF-8"
    %>
    <%!
        String userName;
        String password;
        String emailId;
        String mobileNo;
        java.util.Date registerDate=new java.util.Date();
        java.sql.Date sqlRegisterDate;
        java.util.Date dob;
        java.sql.Date sqlDOB;
        String dOBirth;
        String profilePicLoc;
        //Blob profilePic;
        String gender;
        String streetAddress;
        String city;
        String state;
        String pin;
        String aadharNum;
        String aadharFrontPicLoc;
        String aadharBackPicLoc;
        //Blob aadharFrontPic;
        //Blob aadharBackPic;
        SimpleDateFormat sdf=null;
        File profileImage=null;
        File aadharFrontImage=null;
        File aadharBackImage=null;
        FileInputStream fisProfileImage=null;
        FileInputStream fisAadharFrontImage=null;
        FileInputStream fisAadharBackImage=null;
        Connection con=null;
        PreparedStatement pst=null;
//        ResultSet rs=null;
        String sql;
    %>

    <% 
        System.out.println("signup.jsp");
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbankingdb?serverTimezone=UTC","root","");
                        System.out.println("connection established");
                        con.setAutoCommit(false);
    //                    String ss=request.getParameter("formID");
    //                    System.out.println(ss);
                        userName=request.getParameter("user");
                        password=request.getParameter("pwd1");
                        emailId=request.getParameter("email");
                        mobileNo=request.getParameter("contact");
                       // dOBirth=request.getParameter("birth ");
                       dOBirth=request.getParameter("birth");
                        profilePicLoc=request.getParameter("profilePic");
                        gender=request.getParameter("gender");
                        streetAddress=request.getParameter("streetAdd");
                        city=request.getParameter("city");
                        state=request.getParameter("state");
                        pin=request.getParameter("pin1");
                        aadharNum=request.getParameter("aadharNum");
                        aadharFrontPicLoc=request.getParameter("aadharFront");
                        aadharBackPicLoc=request.getParameter("aadharBack");
                        sdf=new SimpleDateFormat("dd/MM/yyyy");
                        try{
                            dob=sdf.parse(dOBirth);
                            System.out.println(dob.toString());
                        }catch(Exception pe){
                            System.out.println("parse m dikkat h");
                            pe.printStackTrace();
                         }
                        sqlDOB= new java.sql.Date(dob.getTime());
                        profileImage=new File(profilePicLoc);
                        aadharFrontImage=new File(aadharFrontPicLoc);
                        aadharBackImage=new File(aadharBackPicLoc);
                        fisProfileImage= new FileInputStream(profileImage);
                        fisAadharFrontImage=new FileInputStream(aadharFrontImage);
                        fisAadharBackImage=new FileInputStream(aadharBackImage);
                        sql="Insert into users_info_tbl values(?,?,?,?,?,?,?,?,?,?,?,?)";
                        pst=con.prepareStatement(sql);
                        pst.setString(1,aadharNum);
                        pst.setString(2,userName);
                        pst.setString(3,emailId);
                        pst.setString(4,mobileNo);
                        pst.setDate(5,sqlDOB);
                        pst.setBinaryStream(6,(InputStream)fisProfileImage,(int)(profileImage.length()));
                        pst.setString(7,gender);
                        pst.setString(8,streetAddress);
                        pst.setString(9,city);
                        pst.setString(10,state);
                        pst.setBinaryStream(11,(InputStream)fisAadharFrontImage,(int)(aadharFrontImage.length()));
                        pst.setBinaryStream(12,(InputStream)fisAadharBackImage,(int)(aadharBackImage.length()));
                          //sql="insert into users_info_tbl (AadharNum)values(?)";
                          //pst=con.prepareStatement(sql);
                          //pst.setString(1,aadharNum);
                        pst.executeUpdate();

                        /* 
                            encrypting password                    
                        
                        byte[] unencodedPassword = password.getBytes();
                        MessageDigest md = null;
                        try {
                            md = MessageDigest.getInstance("MD5");
                        } catch (Exception e) {}
                        md.reset();
                        md.update(unencodedPassword);
                        byte[] encodedPassword = md.digest();
                        StringBuffer buf = new StringBuffer();
                        for (int i = 0; i < encodedPassword.length; i++) {
                            if (((int) encodedPassword[i] & 0xff) < 0x10) {
                                buf.append("0");
                            }
                            buf.append(Long.toString((int) encodedPassword[i] & 0xff, 16));
                        }
                        String passw=buf.toString();
                            
                        */
                        //Savepoint savepoint1=con.setSavepoint("savepoint1"); 
                        try{
                            sql="insert into account_details (AadharNum,RegisterDateTime,NetBankingPassword,AccountPin) values(?,?,?,?)";
                            pst=con.prepareStatement(sql);
                            sqlRegisterDate=new java.sql.Date(registerDate.getTime());
                            pst.setString(1,aadharNum);
                            pst.setDate(2,sqlRegisterDate);
                            pst.setString(3,password);
                            pst.setString(4,pin);
                            pst.execute();
                        }catch(Exception e){
                            System.out.println("account_detail m nhi jara");
                        }
                        con.commit();
                        response.sendRedirect("../informUser.html");
                    }
                    catch(SQLException se){
                        se.printStackTrace();
                        System.out.println("sql m dikkat h");
                        response.sendRedirect("../newaccount.jsp"); 
                    }
                    catch(Exception e){
                        e.printStackTrace();
                        response.sendRedirect("../newaccount.jsp"); 
                    }
                    finally{
                        if(pst!=null)
                            pst.close();
                        if(con!=null)
                            con.close();
                    }
    %>