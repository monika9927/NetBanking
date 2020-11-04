    <%@page import="java.text.ParsePosition,java.util.Date,
            java.text.SimpleDateFormat, java.sql.*" contentType="text/html"
            pageEncoding="UTF-8"
    %>
    
<%!
        boolean conditionsPassed=true;
        String aadharNum;
        String emailId;
        String mobileNo;
        String dOBirth;
        java.sql.Date sqlRegisterDate;
        java.util.Date dob;
        java.sql.Date sqlDOB;
        int dateNotParsed=0;
        Connection con=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        SimpleDateFormat sdf=null;
        String sql;
        String aadharNumErrorMsg="";
        String mobileNumErrorMsg="";
        String dateErrorMsg="";
        String emailErrorMsg="";
        RequestDispatcher dispatcher=null;
%>

<%
    System.out.println("signup_conditionsCheck.jsp");
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbankingdb?serverTimezone=UTC","root","");
                        System.out.println("connection established");
                        emailId=request.getParameter("email");
                        session.setAttribute("email", emailId);
                        mobileNo=request.getParameter("contact");
                        session.setAttribute("mobileNo", mobileNo);
                        dOBirth=request.getParameter("birth");
                        session.setAttribute("dob", dOBirth);                        
                        aadharNum=request.getParameter("aadharNum");
                        session.setAttribute("aadharNum", aadharNum);
                        sql="select EmailId from users_info_tbl where EmailId=? ";
                        pst=con.prepareStatement(sql);
                        pst.setString(1, emailId);
                        rs=pst.executeQuery();
                        if(rs.next()){
                            conditionsPassed=false;
                            emailErrorMsg="Account with this email already exists";
                            session.setAttribute("emailErrorMsg", emailErrorMsg);
                        }
                        else{
                            session.removeAttribute("emailErrorMsg");
                        }

                        sql="select AadharNum from users_info_tbl where AadharNum=? ";
                        pst=con.prepareStatement(sql);
                        pst.setString(1, aadharNum);
                        rs=pst.executeQuery();
                        if(rs.next()){
                            conditionsPassed=false;
                            aadharNumErrorMsg="Account with this Aadhar Number already exists";
                            session.setAttribute("aadharNumErrorMsg", aadharNumErrorMsg);
                        }
                        else{
                            session.removeAttribute("aadharNumErrorMsg");
                        }
                        sql="select MobileNum from users_info_tbl where MobileNum=? ";
                        pst=con.prepareStatement(sql);
                        pst.setString(1, mobileNo);
                        rs=pst.executeQuery();
                        if(rs.next()){
                            conditionsPassed=false;
                            mobileNumErrorMsg="Account with this Mobile Number already exists";
                            session.setAttribute("mobileNumErrorMsg", mobileNumErrorMsg);
                        }
                        else{
                            session.removeAttribute("mobileNumErrorMsg");
                        }
                        
                        sdf=new SimpleDateFormat("dd/MM/yyyy");
                        try{
                            dob=sdf.parse(dOBirth);
                            System.out.println(dob.toString());
                        }catch(Exception pe){
                            dateNotParsed=1;
                            System.out.println("parse m dikkat h");
                            pe.printStackTrace();
                            dateErrorMsg="Date format should be dd/mm/yyyy";
                            session.setAttribute("dateErrorMsg", dateErrorMsg);
                        }
                        if(dateNotParsed==1){
                            conditionsPassed=false;
                            System.out.println("dateNotParsed="+dateNotParsed);
                        }
                        else{
                            session.removeAttribute("dateErrorMsg");
                        } 
                        if(conditionsPassed){
                            dispatcher=request.getRequestDispatcher("signup.jsp");
                            dispatcher.forward(request,response);
                        }
                        else{
                            System.out.println("Referer");
                            response.sendRedirect(request.getHeader("Referer"));
                        }
                    }catch(SQLException se){
                        System.out.println("Sql m dikkat");
                        se.printStackTrace();
                    }catch(Exception e){
                        System.out.println("dusri dikkat h");
                        e.printStackTrace();
                    }  
                    finally{
                        if(pst!=null)
                            pst.close();
                        if(con!=null)
                            con.close();
                    }

%>