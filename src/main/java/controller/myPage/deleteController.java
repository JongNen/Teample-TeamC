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
		

		String id = logonUser.getId();
		
		PostDAO.deleteAllCampReview(id);
		
		PostDAO.DeleteLikeCamp(id);

		PostDAO.deleteAllReview(id);

		UserDAO.delete(id);

		session.invalidate();

		resp.sendRedirect("/index");
	}

}
