package controller.myPage;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String area = req.getParameter("area");

		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		map.put("name", name);
		map.put("area", area);

		UserDAO.updateUser(map);
		
		
		req.getRequestDispatcher("/WEB-INF/views/user/myPage.jsp").forward(req, resp);
			
		
		
				
	}
	
}
