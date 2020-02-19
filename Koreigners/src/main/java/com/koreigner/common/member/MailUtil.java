package com.koreigner.common.member;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 
public class MailUtil extends Authenticator{
    
    PasswordAuthentication pa;
    
    public MailUtil() {
        String mail_id = "jeyi2756@gmail.com";
        String mail_pw = "selnrakvupozckvg";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
