package netbanking.services;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
    
    private String receiver;
    private String accNum;
    private String netbankingNum;
    
    public void setAccNum(String accNum){
        this.accNum=accNum;
    }
    
    public void setNetbankingNum(String netbankingNum){
        this.netbankingNum=netbankingNum;
    }
    
    public SendMail(String receiver){
        this.receiver=receiver;
    }
    
 public   void sendMail() {
      // Recipient's email ID needs to be mentioned.
      String to = receiver;//change accordingly

      // Sender's email ID needs to be mentioned
      String from = "krishna.flyright@gmail.com";//change accordingly
      final String username = "krishna.flyright@gmail.com";//change accordingly
      final String password = "indianarmy-";//change accordingly

      // Assuming you are sending email through relay.jangosmtp.net
      String host = "smtp.gmail.com";

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", "587");

      // Get the Session object.
      Session session = Session.getInstance(props,
      new javax.mail.Authenticator() {
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
         }
      });

      try {
         // Create a default MimeMessage object.
         Message message = new MimeMessage(session);

         // Set From: header field of the header.
         message.setFrom(new InternetAddress(from));

         // Set To: header field of the header.
         message.setRecipients(Message.RecipientType.TO,
         InternetAddress.parse(to));

         // Set Subject: header field
         message.setSubject("Your Account has been activated");

         // Now set the actual message
         message.setText(" Your Account Number="+accNum+"/n"+"Your Netbanking Number="+netbankingNum);

         // Send message
         Transport.send(message);

         System.out.println("Sent message successfully....");

      } catch (MessagingException e) {
            throw new RuntimeException(e);
      }
   }
}    

