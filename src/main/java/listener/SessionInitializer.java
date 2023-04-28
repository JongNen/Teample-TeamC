package Listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import data.User;

@WebListener
public class SessionInitializer implements HttpSessionListener {
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		se.getSession().setAttribute("logon", false);
		
	}
		
}

