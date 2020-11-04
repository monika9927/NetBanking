package netbankingDAO.adminDAO;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Date;

public class NewRequest {
    private int lengthResultSet;
    private String[] aadharNum=null;
    private String[] userName=null;
    private String[] emailId=null;
    private String[] mobileNum=null;
    private Date[] registerDate=null;
    
    public String getAadharNum(int i){
        return aadharNum[i];
    }
    
    public int getLengthResultSet(){
        return lengthResultSet;
    }
    public String getUserName(int i){
        return userName[i];
    }
    public String getEmailId(int i){
        return emailId[i];
    }
    public String getMobieNum(int i){
        return mobileNum[i];
    }
    public java.sql.Date getRegisterDate(int i){
        return registerDate[i];
    }
    
    public void fetchNewUserInfo() throws SQLException{
        Connection conn=null;
        Statement st=null;
        ResultSet rst=null;
        String sql;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbankingdb?serverTimezone=UTC","root","");
            System.out.println("Connection Established");
            sql="select users_info_tbl.AadharNum,Name,EmailId,MobileNum,RegisterDateTime from `users_info_tbl` inner join `account_details`"
                    + " on users_info_tbl.AadharNum=account_details.AadharNum where account_details.AccountNum IS NULL";
            st=conn.createStatement();
            rst=st.executeQuery(sql);
            rst.last();
            lengthResultSet=rst.getRow();
            System.out.println("length of result set="+lengthResultSet);
            aadharNum=new String[lengthResultSet];
            userName=new String[lengthResultSet];
            emailId=new String[lengthResultSet];
            mobileNum=new String[lengthResultSet];
            registerDate=new java.sql.Date[lengthResultSet];
            rst.beforeFirst();
            int i=0;
            while(rst.next()){
                System.out.println(i);
                aadharNum[i]=rst.getString("AadharNum");
                userName[i]=rst.getString("Name");
                emailId[i]=rst.getString("EmailId");
                mobileNum[i]=rst.getString("MobileNum");
                registerDate[i]=rst.getDate("RegisterDateTime");
                i++;
            }
        }catch(SQLException se){
            System.out.println("sql m dikkat");
            se.printStackTrace();
        }catch(Exception e){
            System.out.println("dusri koi dikkat in NewRequest.java");
            e.printStackTrace();
        }finally{
            if(rst!=null)rst.close();
            if(st!=null)st.close();
            if(conn!=null)conn.close();
        }
    }
}
