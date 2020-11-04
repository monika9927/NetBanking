package netbankingDAO;

import java.sql.Connection;
import java.sql.DriverManager; 
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OnlinePayment {
  private String aadharNum;
  private String receiverAccNum;
  private int amount;
  private String pin;
  private String description;
  private String senderAccNum;
  private int senderBalance;
  private String senderAccountPin;
  private java.util.Date date=null;
  private Connection conn;
  private ResultSet rst;
  private PreparedStatement pst;
  private String sql;
  private String sql2;
  private PreparedStatement pst2;
  private ResultSet rst2;
  private String sql3;
  private PreparedStatement pst3;
  private String sql4;
  private PreparedStatement pst4;
  private ResultSet rst4;
  private String transferSuccess="";
  private int receiverNewBalance;
  private String pinErrorMsg="";
  private String balanceErrorMsg="";
  private String transactionFailed="";
  private String inactiveUserError="";
  
 
  
  public void setPaymentInfo(String aadharNum,String receiverAccNum,int amount,String pin,String description){
      this.aadharNum=aadharNum;
      this.receiverAccNum=receiverAccNum;
      this.amount=amount;
      this.pin=pin;
      this.description=description;
      date=new java.util.Date();
   }
  
  public String transferMoney() throws SQLException{
      try{
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbankingdb?serverTimezone=UTC","root","");
        System.out.println("connection established");
        sql="select  `AccountNum`,`Balance`,`AccountPin` from account_details where AadharNum=?";
        pst=conn.prepareStatement(sql);
        pst.setString(1, aadharNum);
        rst=pst.executeQuery();
        if(rst.next()){
            senderAccNum=rst.getString("AccountNum");
            senderAccountPin=rst.getString("AccountPin");
            senderBalance=rst.getInt("Balance");
            System.out.println("Sender Acc Num="+senderAccNum);
            System.out.println("receiver Acc Num="+receiverAccNum);
            if(!senderAccNum.equals(receiverAccNum)){
            if(pin.equals(senderAccountPin)){
                if(amount<=senderBalance){
                    sql2="select AccountStatus,Balance from account_details where AccountNum=? ";
                    pst2=conn.prepareStatement(sql2);
                    pst2.setString(1, receiverAccNum);
                    rst2=pst2.executeQuery();
                    if(rst2.next()){
                        if(rst2.getString("AccountStatus").equalsIgnoreCase("active")){
                            receiverNewBalance=amount+(int)rst2.getInt("Balance");
                            sql3="update `account_details` set `Balance`=? where AccountNum=?" ;
                            pst3=conn.prepareStatement(sql3);
                            pst3.setInt(1, receiverNewBalance);
                            pst3.setString(2,receiverAccNum);
                            int rowsUpdated=pst3.executeUpdate();
                            if(rowsUpdated>0){
                                System.out.println("Row affected"+rowsUpdated);
                            }else{
                                throw new SQLException();
                            }
                            int senderNewBalance=senderBalance-amount;
                            sql3="update `account_details` set `Balance`=? where AccountNum=?" ;
                            pst3=conn.prepareStatement(sql3);
                            pst3.setInt(1, senderNewBalance);
                            pst3.setString(2,senderAccNum);
                            rowsUpdated=pst3.executeUpdate();
                            if(rowsUpdated>0){
                                System.out.println("Row affected"+rowsUpdated);
                                
                            }else{
                                throw new SQLException();
                            }
                            java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            String transactionDateTime=sdf.format(date);
                            sql4="insert into `transcations_tbl` (`SenderAccount`, `Date`, `Description`, `AmountTransfer`, `ReciverAccNum`) values(?,?,?,?,?)";
                            pst4=conn.prepareStatement(sql4);
                            pst4.setString(1,senderAccNum);
                            pst4.setString(2,transactionDateTime);
                            pst4.setString(3, description);
                            pst4.setInt(4, amount);
                            pst4.setString(5,receiverAccNum);
                            pst4.execute();
                            sql4="select MAX(TransactionID) as `maxT` from transcations_tbl";
                            rst4=pst4.executeQuery(sql4);
                            rst4.next();
                            int transactionId=rst4.getInt("maxT");
                            System.out.println("Max transactionId="+transactionId);
                            sql4="insert into `closing_balance_tbl` (`AccountNum`,`TransactionId`,`ClosingBalance`) values(?,?,?)";
                            pst4=conn.prepareStatement(sql4);
                            pst4.setString(1,senderAccNum);
                            pst4.setInt(2,transactionId);
                            pst4.setInt(3, senderNewBalance);
                            if(pst4.execute()){
                                System.out.println("data entered into closing_balance_tbl with sender info");
                            }
                            else{
                                System.out.println("data  didn't entered into closing_balance_tbl with sender info");
                                
                            }
                            sql4="insert into `closing_balance_tbl` (`AccountNum`,`TransactionId`,`ClosingBalance`) values(?,?,?)";
                            pst4=conn.prepareStatement(sql4);
                            pst4.setString(1,receiverAccNum);
                            pst4.setInt(2,transactionId);
                            pst4.setInt(3, receiverNewBalance);
                            if(pst4.execute()){
                                System.out.println("data entered into closing_balance_tbl with receiver info");
                            }
                            else{
                                System.out.println("data  didn't entered into closing_balance_tbl with receiver info");
                            }

                            return transferSuccess="Money transfered succesfully";
//                                this.getSuccessMsg();
                        }
                        else{
                                return inactiveUserError="specified user is inacive(can't transfer money)";
//                                this.getInactiveUserErrorMsg();
                        }
                    }else{
                        return transactionFailed="Traction Failed(If money got deducted then it will be return in 48 hours)";
//                        this.getTransactionFailedErrorMsg();
                    }
                }
                else{
                    return balanceErrorMsg="your account does not have sufficient balance";
//                    this.getBalanceErrorMsg();
                }
            }else{
                return pinErrorMsg="Wrong Pin";
//                this.getPinErrorMsg();
            }
        }else{
                System.out.println("sender Account and receiver acc m prob");
            }
        }
        else{
            System.out.println("Andar hi nhi ghusa Onlinepayment.java ke phele if m");
        }
      }catch(SQLException se){
        System.out.println("SQL m dikkat");
        se.printStackTrace();
      }catch(Exception e){
          System.out.println("Dusri dikkat h");
          e.printStackTrace();
      }
      finally{
          if(rst!=null)rst.close();
          if(pst!=null)pst.close();
          if(rst2!=null)rst2.close();
          if(pst2!=null)pst2.close();
          if(pst3!=null)pst3.close();
          if(rst4!=null)rst4.close();
          if(pst4!=null)pst4.close();
          if(conn!=null)conn.close();
      }
      return "something went wrong";
  }
  
}
