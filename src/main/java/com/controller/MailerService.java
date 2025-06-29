package com.controller;

import java.io.IOException;
import java.nio.charset.Charset;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailerService
{
	@Autowired
	JavaMailSender mailSender;
	
	public void sendmailold(String mail)
	{
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("krishkpatelk2005@gmail.com");
		message.setTo(mail);
		message.setSubject("welciome to spring boot");
		message.setText("This is a test mail");
		message.setSubject("Testmail");
		
		mailSender.send(message);
		
	}
	
	 public void sendmail(String mail, String firstName) throws MessagingException 
	 {
	        MimeMessage message = mailSender.createMimeMessage();

	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
	        ClassPathResource resource = new ClassPathResource("templates/Welcome.html");
	        
	        String htmlContent;
			try {
				htmlContent = resource.getContentAsString(Charset.defaultCharset());
				htmlContent = htmlContent.replace("{{name}}", firstName);
				   helper.setFrom("krishkpatelk2005@gmail.com");
			        helper.setTo(mail);
			        helper.setSubject("welciome to spring boot");
			        helper.setText(htmlContent, true); 
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       
	     

	        mailSender.send(message);
	    }
	
	
	
	

}
