/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package netbankingDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import netbankingModel.UserAccDetailsModel;

/**
 *
 * @author karan
 */
public class UserAccDetails {
   private String aadharNum;
   private String accountNum;
   private String netbankingNum;
   private String accountStatus;
   private String accountType; 
   private int balance;
   private java.sql.Date date;
   private String sql;
   private Connection conn=null;
   private PreparedStatement pst=null;
   private ResultSet rst=null;
   
   public UserAccDetails(UserAccDetailsModel uadm){
       aadharNum=uadm.getAadharNum();
   }
    public String getAccountNum(){
        return accountNum;
    }
    public String getNetbankingNum(){
        return netbankingNum;
    }
    public String getAccountStatus(){
        return accountStatus;
    }
    public String getAccountType(){
        return accountType;
    }
    public int getBalance(){
        return balance;
    }
    public java.sql.Date getDate(){
        return date;
    }
   public boolean fetchUserAccInfo() throws SQLException{
       try{
      Class.forName("com.mysql.jdbc.Driver");
      conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbankingdb?serverTimezone=UTC","root","");
      System.out.println("connection established");
      sql="select AccountNum,NetBankingNum,AccountType,AccountStatus,Balance,RegisterDateTime from account_details where AadharNum=?";
      pst=conn.prepareStatement(sql);
      System.out.println(aadharNum);
      pst.setString(1,(aadharNum));
      rst=pst.executeQuery();
      if(rst.next()){
          accountNum=rst.getString("AccountNum");
          netbankingNum=rst.getString("NetBankingNum");
          accountType=rst.getString("AccountType");
          accountStatus=rst.getString("AccountStatus");
          balance=rst.getInt("Balance");
          date=rst.getDate("RegisterDateTime");
          System.out.println("chl gaya niche tk in userprofile.java DAO vala");
          return true;
      }
      else{
          System.out.println("Query nhi chli");
      }
//        imgLen=rst.getString("ProfilePic");
//      imgB=new byte[imgLen.length()];
//      readImg=rst.getBinaryStream("ProfilePic");
//      int index=readImg.read(imgB, 0, imgLen.length()); 
//       System.out.println("index"+index);
//      response.sendRedirect(request.getHeader("Referer"));
//        dispatcher=request.getRequestDispatcher("../userprofile_frontend.jsp");
//        dispatcher.forward(request,response);
        
      
  }
  catch(SQLException se){
      se.printStackTrace();
      System.out.println("sql m dikkat h");
  }
  catch(Exception e){
      e.printStackTrace();
  }
  finally{
      if(pst!=null)
          pst.close();
      if(conn!=null)
          conn.close();
  }
       return false;
   }

  
}
