package web.mail;
 
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class MailSend {
	public void MailSendPW(String u_email, String u_new_pw) {
        Properties prop = System.getProperties();
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "587");
        
        Authenticator auth = new MailAuth();
        
        Session session = Session.getDefaultInstance(prop, auth);
        
        MimeMessage msg = new MimeMessage(session);
    
        try {
            msg.setSentDate(new Date());
            
            msg.setFrom(new InternetAddress("phjppo0918@gmail.com", "hyunjune park"));
            InternetAddress to = new InternetAddress(u_email);         
            msg.setRecipient(Message.RecipientType.TO, to);            
            msg.setSubject("안녕하세요 BREW MASTER 임시 비밀번호입니다.", "UTF-8");            
            msg.setText("항상 BREW MASTER를 사랑해주셔서 감사합니다. 회원님의 임시 비밀번호는   "+u_new_pw+"   입니다."
            		+ "로그인 후에 비밀번호를 꼭 변경해주세요!", "UTF-8");            
            
            Transport.send(msg);
            
        } catch(AddressException ae) {            
            System.out.println("AddressException : " + ae.getMessage());           
        } catch(MessagingException me) {            
            System.out.println("MessagingException : " + me.getMessage());
        } catch(UnsupportedEncodingException e) {
            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
        }
                
    }
	
	public void MailSendForUser(String u_email, String title, String user_textarea) {
        Properties prop = System.getProperties();
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "587");
        
        Authenticator auth = new MailAuth();
        
        Session session = Session.getDefaultInstance(prop, auth);
        
        MimeMessage msg = new MimeMessage(session);
    
        try {
            msg.setSentDate(new Date());
            
            msg.setFrom(new InternetAddress("phjppo0918@gmail.com", "hyunjune park"));
            InternetAddress to = new InternetAddress(u_email);         
            msg.setRecipient(Message.RecipientType.TO, to);            
            msg.setSubject(title, "UTF-8");            
            msg.setText(user_textarea, "UTF-8");            
            
            Transport.send(msg);
            
        } catch(AddressException ae) {            
            System.out.println("AddressException : " + ae.getMessage());           
        } catch(MessagingException me) {            
            System.out.println("MessagingException : " + me.getMessage());
        } catch(UnsupportedEncodingException e) {
            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
        }
                
    }
	
	 public void MailSendHB(String u_email, int h_beer_no, String h_beer_name, int amount, String u_id, String u_ph,
			 String input_address, String input_road_address, String sample4_jibunAddress, String input_detailAddress,
			 String order_request){
	        Properties prop = System.getProperties();
	        prop.put("mail.smtp.starttls.enable", "true");
	        prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.port", "587");
	        
	        Authenticator auth = new MailAuth();
	        
	        Session session = Session.getDefaultInstance(prop, auth);
	        
	        MimeMessage msg = new MimeMessage(session);
	    
	        try {
	            msg.setSentDate(new Date());
	            
	            msg.setFrom(new InternetAddress("phjppo0918@gmail.com", "hyunjune park"));
	            InternetAddress to = new InternetAddress(u_email);         
	            msg.setRecipient(Message.RecipientType.TO, to);            
	            msg.setSubject("안녕하세요 BREW MASTER 입니다. 하우스맥주 주문이 들어왔어요!", "UTF-8");            
	            msg.setText("항상 BREW MASTER를 사랑해주셔서 감사합니다.\n 주문상품번호: "+h_beer_no+"\n"
	            		+ "주문상품명:"+h_beer_name+"\n"
	            		+ "상품 개수:"+amount+"\n\n"
	            		+ "주문자 ID:"+u_id+"\n"
	            		+ "주문자 전화번호:"+u_ph+"\n"
	            		+ "우편번호 : "+input_address+"\n"
	            		+ "도로명 : "+input_road_address+"\n"
	            		+ "지번 : "+sample4_jibunAddress+"\n"
	            		+ "상세주소 : "+input_detailAddress+"\n"
	            				+ "주문시 요청사항:"+order_request+"\n\n 주문 부탁드립니다! ", "UTF-8");            
	            
	            Transport.send(msg);
	            
	        } catch(AddressException ae) {            
	            System.out.println("AddressException : " + ae.getMessage());           
	        } catch(MessagingException me) {            
	            System.out.println("MessagingException : " + me.getMessage());
	        } catch(UnsupportedEncodingException e) {
	            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
	        }
	                
	    }
	
	
	
    public void MailSend(){
        Properties prop = System.getProperties();
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "587");
        
        Authenticator auth = new MailAuth();
        
        Session session = Session.getDefaultInstance(prop, auth);
        
        MimeMessage msg = new MimeMessage(session);
    
        try {
            msg.setSentDate(new Date());
            
            msg.setFrom(new InternetAddress("phjppo0918@gmail.com", "hyunjune park"));
            InternetAddress to = new InternetAddress("jdmomo@naver.com");         
            msg.setRecipient(Message.RecipientType.TO, to);            
            msg.setSubject("안녕하세요 BREW MASTER 임시 비밀번호입니다.", "UTF-8");            
            msg.setText("항상 BREW MASTER를 사랑해주셔서 감사합니다. 회원님의 임시 비밀번호는", "UTF-8");            
            
            Transport.send(msg);
            
        } catch(AddressException ae) {            
            System.out.println("AddressException : " + ae.getMessage());           
        } catch(MessagingException me) {            
            System.out.println("MessagingException : " + me.getMessage());
        } catch(UnsupportedEncodingException e) {
            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
        }
                
    }
}