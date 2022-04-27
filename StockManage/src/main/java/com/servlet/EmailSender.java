package com.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/sendInvoice")
@MultipartConfig
public class EmailSender extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String to = req.getParameter("To");
		String from = req.getParameter("From");
		String subject = req.getParameter("Subject");
		String message = req.getParameter("Message");
		String Password = req.getParameter("Password");
		Part part = req.getPart("Attachment");
		String invoice = part.getSubmittedFileName();
		
		HttpSession sess = req.getSession();
		sendAttachment(to,from,subject,message,Password,part,invoice,sess,resp);
		
	}

	private void sendAttachment(String to, String from, String subject, String message, 
			String Password, Part part, String invoice,HttpSession sess,HttpServletResponse resp) {
String host = "smtp.gmail.com";
		
		// gettting the system properties.
		Properties properties = System.getProperties();
		System.out.println(properties);
//		host properties
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");
		
		
		
		// Step 1 : to get session object
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, Password);
			}
		});
		
		
		
		session.setDebug(true);
		
		// Step 2 : Compose the message (Photo, msg, media)
		MimeMessage mimeMessage = new MimeMessage(session);
		try {
			// from email
			mimeMessage.setFrom(from);
			
			//add recipient to message
			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		
			// adding subject to message
			mimeMessage.setSubject(subject);
			
			//adding message with attachment
			
			MimeMultipart multipart = new MimeMultipart();
			//text
			//file
			
			MimeBodyPart textBody = new MimeBodyPart();
			MimeBodyPart fileBody = new MimeBodyPart();

			try {
				textBody.setText(message);
				String path = getServletContext().getRealPath("") + "Invoices";
				part.write(path + File.separator + invoice);
				File file = new File(new File(path), invoice);
				fileBody.attachFile(file);
				
				multipart.addBodyPart(textBody);
				multipart.addBodyPart(fileBody);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mimeMessage.setContent(multipart);
			
			
		// Step 3 : send message using transport class
			Transport.send(mimeMessage);
			System.out.println("Message send Successfully!");
			
			sess.setAttribute("SendSuccessfully", "M");
			resp.sendRedirect("allSellingList.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
