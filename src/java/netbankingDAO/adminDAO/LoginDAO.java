package netbankingDAO.adminDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
    private String userName;
    private String password;
    private Connection conn;
    private PreparedStatement pst;
    private ResultSet rst;
    private String sql;
    
    public LoginDAO(String userName,String password){
        this.userName=userName;
        this.password=password;
    }
    public boolean checkLogin() throws SQLException{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbankingdb?serverTimezone=UTC","root","");
            System.out.println("Connection Established"); 
            sql="select `Password` from `admin_tbl` where `AdminID`=?";
            pst=conn.prepareStatement(sql);
            pst.setString(1, userName);
            rst=pst.executeQuery();
            if(rst.next()){
                if(rst.getString("Password").equals(password)){
                    return true;
                }else{
                    return false;
                }
            }else{
                return false;
            }
        }catch(SQLException se){
            System.out.println("SQL m Dikkat");
            se.printStackTrace();
        }
        catch(Exception e){
            System.out.println("Dusri koi dikkat h");
            e.printStackTrace();
        }finally{
           if(rst!=null)rst.close();
           if(pst!=null)pst.close();
           if(conn!=null)conn.close();
       }
        return false;
    }
    
}
