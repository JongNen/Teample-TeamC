package controller.myPage;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import data.Review;
import repository.PostDAO;
import repository.UserDAO;

@WebServlet("/user/modify")
public class ModifyController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
//		HttpSession session = req.getSession();
//		Boolean logon = (Boolean)session.getAttribute("logon");
//		if(logon == null || !logon) {
//			resp.sendRedirect("/user/login");
//			return;
//		}
		
		String id = req.getParameter("id");
		String pass = BCrypt.hashpw(req.getParameter("pass"), BCrypt.gensalt());
		String name = req.getParameter("name");
		String area = req.getParameter("area");
		

		Map<String, Object> update = new HashMap<>();
		update.put("id", id);
		update.put("pass", pass);
		update.put("name", name);
		update.put("area", area);

		UserDAO.updateUser(update);
		
		
	
		
		
		
		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
			
		
		
				
	}
	
}
