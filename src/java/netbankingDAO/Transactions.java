package netbankingDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.Timestamp;

public class Transactions {
  
        private String aadharNum;
        private Connection con=null;
        private PreparedStatement pst=null;
        private ResultSet rs=null;
        private PreparedStatement pst2=null;
        private ResultSet rs2=null;
        private String sql;
        private String sql2;
        private String senderAccNum;
        private String[] senderAccountNumArray;
        private String[] recieverAccountNumArray;
        private String[] descriptionArray;
        private int[] transactionIDArray;
        private int[] amountTransferArray;
        private Timestamp[] transactionDateArray;
        private int[] closingBalanceArray;
        private int length;
//    System.out.println("transaction_view.jsp");
        public Transactions(String aadharNum){
            this.aadharNum=aadharNum;
        }
        public String getUserAccNum(){
            return senderAccNum;
        }
        public int numberOfRows(){
            return length;
        }
        public String getSenderAccNum(int i){
            return senderAccountNumArray[i];
        }
        public String getRecieverAccNum(int i){
            return recieverAccountNumArray[i];
        }
        public String getDescription(int i){
            return descriptionArray[i];
        }
        public int getTransactionID(int i){
            return transactionIDArray[i];
        }
        public int getAmountTransfer(int i){
            return amountTransferArray[i];
        }
        public Timestamp getTransactionDate(int i){
            return transactionDateArray[i];
        }
        public int getClosingBalance(int i){
            return closingBalanceArray[i];
        }    
       
        public void viewTransaction(){
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbankingdb?serverTimezone=UTC","root","");
                System.out.println("connection established");
                System.out.println(aadharNum);
                sql2="select `AccountNum`  from `account_details` where `AadharNum`=? ";
                pst2=con.prepareStatement(sql2);
                pst2.setString(1, aadharNum);
                rs2=pst2.executeQuery();
                rs2.next();
                System.out.println(rs2);
                senderAccNum=rs2.getString("AccountNum");
                System.out.println(senderAccNum);
                sql="select * from `transcations_tbl` where `SenderAccount`=? OR `ReciverAccNum`=? order by `Date`";
                pst=con.prepareStatement(sql);
                pst.setString(1, senderAccNum);
                pst.setString(2,senderAccNum);
                sql2="select `ClosingBalance` from closing_balance_tbl where AccountNum=? order by TransactionId";
                pst2=con.prepareStatement(sql2);
                pst2.setString(1, senderAccNum);
                rs=pst.executeQuery();
                rs2=pst2.executeQuery();
                rs.last();
                length=rs.getRow();
                System.out.println("length="+length);
                senderAccountNumArray=new String[length];
                recieverAccountNumArray=new String[length];
                descriptionArray=new String[length];
                amountTransferArray=new int[length];
                transactionIDArray=new int[length];
                closingBalanceArray=new int[length];
                transactionDateArray=new Timestamp[length];
                rs.beforeFirst();
                int i=0;
                while(rs.next()&&rs2.next()){
                    System.out.println(i);
                    senderAccountNumArray[i]=rs.getString("SenderAccount");
                    recieverAccountNumArray[i]=rs.getString("ReciverAccNum");
                    descriptionArray[i]=rs.getString("Description");
                    amountTransferArray[i]=rs.getInt("AmountTransfer");
                    transactionIDArray[i]=rs.getInt("TransactionID");
                    closingBalanceArray[i]=rs2.getInt("ClosingBalance");
                    transactionDateArray[i]=rs.getTimestamp("Date");
                    i++;
                }
                
                
            }catch(SQLException se){
                System.out.println("Sql m dikkat");
                se.printStackTrace();
            }catch(Exception e){
                System.out.println("dusri dikkat h");
                e.printStackTrace();
            }
        }
        public void closeConnection(){
            try{
                if(rs!=null)rs.close();
                if(rs2!=null)rs2.close();
                if(pst!=null)
                    pst.close();
                if(pst2!=null)
                    pst2.close();
                if(con!=null)
                    con.close();
            }catch(SQLException se){
                System.out.println("connection close nhi hora");
                se.printStackTrace();
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
}
