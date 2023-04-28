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

@WebServlet("/user/delete")
public class deleteController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
//		Boolean logon = (Boolean)session.getAttribute("logon");
//		if(logon == null || !logon) {
//			resp.sendRedirect("/user/login");
//			return;
//		}
		
		String id = req.getParameter("id");
		
		UserDAO.delete(id);
		
		session.invalidate();
		
		
		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
	}

}
