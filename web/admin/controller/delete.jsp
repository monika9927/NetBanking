<%-- 
    Document   : delete
    Created on : 3 Nov, 2020, 11:42:56 PM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
     try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn;
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbankingdb?serverTimezone=UTC","root","");
            Statement st;
             st=conn.createStatement();
             ResultSet rst;
              String anum=request.getParameter("aadharNum");
             String sql="UPDATE account_details SET AccountStatus='Inactive' where AadharNum="+anum ;
             st.executeUpdate(sql);
     }
       catch(Exception e){
       e.printStackTrace();
       }
%>