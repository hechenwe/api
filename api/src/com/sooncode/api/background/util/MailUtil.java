package com.sooncode.api.background.util;

 
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 * 邮件发送工具类
 * @author pc
 *
 */
public class MailUtil {
 
	static final String SERVER  = "smtp.sina.com";//邮件服务器mail.cpip.net.cn
    static final int PORT = 25;
 
    static final String FROM = "SOON CODE";//发送者,显示的发件人名字
 
    static final String USER = "sooncode@sina.com";//发送者邮箱地址
 
    static final String PASSWORD   = "zz080506";//密码
 
    
    public static void sendEmail(String email, String subject, String body) throws UnsupportedEncodingException {
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", SERVER);
            props.put("mail.smtp.port", String.valueOf(PORT));
            props.put("mail.smtp.auth", "true");
            Transport transport = null;
            Session session = Session.getDefaultInstance(props, null);
            transport = session.getTransport("smtp");
            transport.connect(SERVER, USER, PASSWORD);
            MimeMessage msg = new MimeMessage(session);
            msg.setSentDate(new Date());
            InternetAddress fromAddress = new InternetAddress(USER,FROM,"UTF-8");
            msg.setFrom(fromAddress);
            InternetAddress[] toAddress = new InternetAddress[1];
            toAddress[0] = new InternetAddress(email);
            msg.setRecipients(Message.RecipientType.TO, toAddress);
            msg.setSubject(subject, "UTF-8");   
            msg.setText(body, "UTF-8");
            msg.saveChanges();
            transport.sendMessage(msg, msg.getAllRecipients());
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    public static void main(String args[]) throws UnsupportedEncodingException
    {
 
        sendEmail("592794139@qq.com","SOON CODE 注册验证码","欢迎您注册!您的验证码为:888888");//收件人
        
    }
}