package netbankingDAO.adminDAO;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDetails {
    private Connection conn;
    private Statement st;
    private ResultSet rst;
    private String sql;
    public ResultSet fetchUserInfo() throws SQLException{
       try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbankingdb?serverTimezone=UTC","root","");
            System.out.println("Connection Established"); 
            sql="SELECT users_info_tbl.AadharNum,Name ,EmailId,MobileNum,StreetAddress,City,State,DOB,AccountNum,NetBankingNum,AccountType,AccountStatus,Balance,RegisterDateTime FROM"
                    + " `users_info_tbl` inner join `account_details` on users_info_tbl.AadharNum=account_details.AadharNum";
            st=conn.createStatement();
            rst=st.executeQuery(sql);
            return rst;
        }catch(SQLException se){
            System.out.println("SQL m Dikkat");
            se.printStackTrace();
        }
        catch(Exception e){
            System.out.println("Dusri koi dikkat h");
            e.printStackTrace();
        }
//        }finally{
//           //if(rst!=null)rst.close();
//           if(st!=null)st.close();
//           if(conn!=null)conn.close();
//       }
       return null;
    }    
    public void closeConn() throws SQLException{
//        if(rst!=null)
            rst.close();
//        if(st!=null)
            st.close();
//        if(conn!=null)
            conn.close();
    }
}
