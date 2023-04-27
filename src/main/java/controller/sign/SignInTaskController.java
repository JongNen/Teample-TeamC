package controller.sign;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import data.User;
import repository.UserDAO;

@WebServlet("/user/signIn-task")
public class SignInTaskController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String check = req.getParameter("check");
		User found = UserDAO.findById(id);

		if (found != null && BCrypt.checkpw(pass, found.getPass())) {
			HttpSession session = req.getSession();
			session.setAttribute("logon", true);
			session.setAttribute("logonUser", found);

			Cookie c = new Cookie("ID_SAVE", id);
			// 쿠키 생성
			if (check != null) {
				c.setMaxAge(60 * 60 * 24 * 7);
				c.setPath("/");
				resp.addCookie(c);
				resp.sendRedirect("/");

				return;

			} else {
				c.setMaxAge(0);
				resp.addCookie(c);
			}

		} else {
			resp.sendRedirect("/user/signIn?error=1");

			return;
		}

	}
}
