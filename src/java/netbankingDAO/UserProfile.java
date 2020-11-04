package netbankingDAO;

import java.sql.Connection;
import java.sql.DriverManager; 
import java.sql.ResultSet;
import java.sql.Blob ;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.io.InputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import netbankingModel.UserProfileModel;

public class UserProfile {
   private String userName="";
   private String emailId;
   private String mobileNum;
   private String aadharNum; 
   private String dOB;
   private String address;
   private String city;
   private String gender;
   private String profilePic;
   private String aadharFrontPic;
   private String aadharBackPic;
   private String sql;
   private Connection conn=null;
   private PreparedStatement pst=null;
   private ResultSet rst=null;
   private Blob blob;
   private Blob aadharFrontBlob;
   private Blob aadharBackBlob;
   
   public UserProfile(UserProfileModel upm) throws IOException, SQLException{
       aadharNum=upm.getAadharNum();
   }
    public String getUserName(){
        return userName;
    }
    public String getEmail(){
        return emailId;
    }
    public String getMobileNum(){
        return mobileNum;
    }
    public String getDOB(){
        return dOB;
    }
    public String getAddress(){
        return address;
    }
    public String getCity(){
        return city;
    }
    public String getGender(){
        return gender;
    }
    public String getProfilePic(){
        return profilePic;
    }
    public String getAadharFrontPic(){
        return aadharFrontPic;
    }
    public String getAadharBackPic(){
        return aadharBackPic;
    }
    public String getAadharNum(){
        return aadharNum;
    }
    
   public boolean fetchUserInfo() throws IOException, SQLException{
       try{
          Class.forName("com.mysql.jdbc.Driver");
          conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/netbankingdb?serverTimezone=UTC","root","");
        System.out.println("connection established");
        sql="select * from users_info_tbl where AadharNum=?";
        pst=conn.prepareStatement(sql);
        pst.setString(1,(aadharNum));
        rst=pst.executeQuery();
        if(rst.next()){
          userName=rst.getString("Name");
          emailId=rst.getString("EmailId");
          mobileNum=rst.getString("MobileNum");
          dOB=rst.getString("DOB");
          address=rst.getString("StreetAddress");
          city=rst.getString("City");
          gender=rst.getString("Gender");
          blob = rst.getBlob("ProfilePic");
          aadharFrontBlob=rst.getBlob("AadharCardFrontPic");
          aadharBackBlob=rst.getBlob("AadharCardBackPic");
          profilePic=fetchImage(blob);
          aadharFrontPic=fetchImage(aadharFrontBlob);
          aadharBackPic=fetchImage(aadharBackBlob);
          System.out.println("chl gaya niche tk in userprofile.java DAO vala");
          return true;
      }
      
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
   public String fetchImage(java.sql.Blob blob) throws IOException{
    InputStream inputStream=null;
    ByteArrayOutputStream outputStream=null;
    byte[] buffer;
    int bytesRead;
    byte[] imageBytes;
    String base64Image;
   
       try{
           inputStream = blob.getBinaryStream();
           outputStream=new ByteArrayOutputStream();
          buffer = new byte[4096];
          bytesRead = -1;
          while ((bytesRead = inputStream.read(buffer)) != -1) {
              outputStream.write(buffer, 0, bytesRead);
          }
          imageBytes = outputStream.toByteArray();
          return base64Image = Base64.getEncoder().encodeToString(imageBytes);        
       }catch(SQLException se){
           System.out.println("image fetch nhi hori in userprofile.java");
           se.printStackTrace();
       }catch(Exception e){
           e.printStackTrace();
       }
       finally{
           if(inputStream!=null)inputStream.close();
           if(outputStream!=null)outputStream.close();
       }
       return null;
   }
}
