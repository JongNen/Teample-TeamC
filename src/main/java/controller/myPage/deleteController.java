package controller.myPage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.Like;
import data.User;
import repository.PostDAO;
import repository.UserDAO;

@WebServlet("/user/delete")
public class deleteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		User logonUser = (User) session.getAttribute("logonUser");
		Boolean logon = (Boolean) session.getAttribute("logon");
		if (logon == null || !logon) {
			resp.sendRedirect("/user/login");
			return;
		}

		String id = req.getParameter("id");
		

		PostDAO.allDeleteCamp(id);

		PostDAO.deleteAllReview(id);

		UserDAO.delete(id);

		session.invalidate();

		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
	}

}
