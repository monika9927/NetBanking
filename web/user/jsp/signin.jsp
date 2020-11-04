<%@page import="java.sql.Connection ,java.sql.DriverManager, java.sql.PreparedStatement , java.sql.ResultSet ,java.sql.SQLException" 
%>

<%@include  file="../signin_frontend.jsp" %>

<%!
    boolean conditionPassed=true;
    String netBankingNum;
    String password;
    String sql;
    Connection conn;
    PreparedStatement pst;
    ResultSet rst=null;
%>

<%
    String submit=request.getParameter("submit");
    if(submit!=null){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbankingdb?serverTimezone=UTC","root","");
            System.out.println("Connextion established");
            netBankingNum=request.getParameter("signinNetBankingNum");
            password=request.getParameter("signinPassword");
            sql="select `AadharNum`,`NetBankingNum`,`AccountStatus`,`NetBankingPassword` from account_details where `NetBankingNum`=?";
            pst=conn.prepareStatement(sql);
            pst.setString(1,netBankingNum);
            rst=pst.executeQuery();
                if(rst.next()){
                    if(rst.getString("AccountStatus").equals("Inactive"))
                    {
                      %>
                      <script>
                          alert("Your account is Inactive");
                          </script>
                          
                      <%
                    }
                    else{
                    if(password.equals(rst.getString("NetBankingPassword"))){
                        System.out.println("Loging successfully");
                        session.setAttribute("AadharNum", rst.getString("AadharNum"));
                        response.sendRedirect("../userhome.html");
                    }
                    else{
                        conditionPassed=false;
                        session.setAttribute("wrongPasswordMsg","Wrong Password");
                    }
                    }
                }
                else{
                    conditionPassed=false;
                    session.setAttribute("wrongNetbankingNumMsg","Wrong Netbanking number");
                }
                if(!conditionPassed){
                    response.sendRedirect(request.getHeader("Referer"));
                }
        
        }catch(SQLException se){
            System.out.println("Sql m dikkat");
            se.printStackTrace();
        }
        catch(Exception e){
            System.out.println("dusri dikkat");
            e.printStackTrace();
        }
        finally{
            if(pst!=null)
                pst.close();
            if(conn!=null)
                conn.close();
        }
    }

 %>