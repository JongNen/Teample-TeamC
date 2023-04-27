package controller.sign;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CookieService;

@WebServlet("/user/signIn")
public class SignInController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		Cookie[] cookies = req.getCookies();
		Cookie idSave = CookieService.findByName(cookies, "ID_SAVE"); 
		System.out.println("idSave = " + idSave);
		
		if(idSave != null) {
			req.setAttribute("idSave", idSave.getValue());
		}
		
		req.getRequestDispatcher("/WEB-INF/views/user/signIn.jsp").forward(req, resp);
	}
}
