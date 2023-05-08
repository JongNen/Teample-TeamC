package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;

import util.CampingAPI;

@WebListener
public class CampingInitializer implements ServletContextListener {
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		CampingAPI.loadOn();
	}
}
