package com.spring.returnscroll.Service;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("tjdwns784@gmail.com", "efdjzfypohfkzzaq");
	}
}
