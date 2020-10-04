package ch18.com.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MailSenderController2")
public class MailSenderController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			mailSender(request);
			RequestDispatcher rd
			  = request.getRequestDispatcher("./mailSender2.jsp");
			rd.forward(request, response);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	public void mailSender(HttpServletRequest request) throws AddressException, MessagingException{
	    //String subject = (String) request.getParameter("subject"); // 메일 제목
	    //String message = (String) request.getParameter("message"); // 메일 내용
	    

StringBuffer temp = new StringBuffer();
Random rnd = new Random();

for (int i = 0; i < 20; i++) {
    int rIndex = rnd.nextInt(3);
    switch (rIndex) {
    case 0:
        // a-z
        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
        break;
    case 1:
        // A-Z
        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
        break;
    case 2:
        // 0-9
        temp.append((rnd.nextInt(10)));
        break;
    }
}
  String email="vctor@naver.com";
  
	  	
		//String message =request.getParameter("message").trim(); // 메일 내용
		//String email=request.getParameter("email").trim();
		
		request.setAttribute("message", temp);
		request.setAttribute("email", email);
		
		String subject="인증메일";
		String message=temp.toString().trim(); 
		
		
	    // SMTP 서버 설정
	    final String host = "smtp.gmail.com"; // 사용할 smtp host, naver라면 smtp.naver.com
	    final String accountId = "메일계정";
	    final String accountPwd = "메일비밀번호";
	    final int port = 465; // SMTP 포트
	     
	    String receiver = email; // 받는사람 이메일
	    String sender = "메일계정"; // 보내는사람 이메일
	     
	    // Property 정보 생성
	    Properties props = System.getProperties();
	    props.put("mail.smtp.user", sender);
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.port", port);
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.ssl.enable", "true");
	    props.put("mail.smtp.ssl.trust", host);
	    props.put("mail.smtp.socketFactory.port", "465"); 
	    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
	    props.put("mail.smtp.socketFactory.fallback", "false");    

	    // 사용자 인증
	    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	        protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
	            return new javax.mail.PasswordAuthentication(accountId, accountPwd);
	        }
	    });
	    session.setDebug(true);
	     
	    Message mimeMessage = new MimeMessage(session); //MimeMesage 생성
	    mimeMessage.setFrom(new InternetAddress(sender)); // 보내는 EMAIL (정확히 적어야 SMTP 서버에서 인증 실패되지 않음)
	    mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver)); 
	     
	    // Message Setting
	    mimeMessage.setSubject(subject);
	    mimeMessage.setText(message);
	    Transport.send(mimeMessage); // Transfer
	}
	
}
