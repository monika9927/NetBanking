package netbankingDAO.adminDAO;

import java.sql.Connection;
import java.sql.DriverManager; 
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AllotAccNetNum {
    private String accNum;
    private String netNum;
    private String aadharNum;
    public AllotAccNetNum(String accNum,String netNum,String aadharNum){
        this.accNum=accNum;
        this.netNum=netNum;
        this.aadharNum=aadharNum;
    }
    
    public int alloting() throws SQLException{
        Connection conn=null;
        ResultSet rst=null;
        PreparedStatement pst=null;
        String sql=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbankingdb?serverTimezone=UTC","root","");
            System.out.println("connection established");
            sql="update account_details set AccountNum=?,NetBankingNum=?,AccountType=?,AccountStatus=?,Balance=? where AadharNum=?";
            pst=conn.prepareStatement(sql);
            pst.setString(1,accNum);
            pst.setString(2,netNum);
            pst.setString(3,"Saving");
            pst.setString(4,"Active");
            pst.setInt(5,10000);
            pst.setString(6, aadharNum);
            return pst.executeUpdate();
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
            if(conn!=null)conn.close();
        }
        return 0;
    }
}
