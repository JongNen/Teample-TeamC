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
		System.out.println("check = " + check);
		
		User found = UserDAO.findById(id);
		
		//DB에 저장된 아이디 비번 확인
		if (found != null && BCrypt.checkpw(pass, found.getPass())) {
			HttpSession session = req.getSession();
			session.setAttribute("logon", true);
			session.setAttribute("logonUser", found);
			resp.sendRedirect("/");
	
			// 로그인이 되면 쿠키생성
			if(check != null && check.equals("on")) {
				Cookie c = new Cookie("ID_SAVE", found.getId());
				c.setPath("/");
				c.setMaxAge(60*60*24*30*3);
				resp.addCookie(c);
				System.out.println("c =" + c);

			}
		} else {
			
			resp.sendRedirect("/user/signIn?error=1");

			return;
		}

		
		
	}
}
