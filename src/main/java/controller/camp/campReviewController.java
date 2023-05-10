package controller.camp;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.User;
import repository.PostDAO;

@WebServlet("/camp/review")
public class campReviewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		User logonUser = (User) session.getAttribute("logonUser");
		Boolean logon = (Boolean) session.getAttribute("logon");
		String contentId = req.getParameter("contentId");

		if (logon == null || !logon) {
			resp.sendRedirect("/detail?cause=valid&contentId=" + contentId);
			return;
		}

		String id = logonUser.getId();
		String body = req.getParameter("body");
		String name = logonUser.getName();

		Map<String, Object> review = new HashMap<>();
		review.put("campId", contentId);
		review.put("writerId", id);
		review.put("body", body);
		review.put("writerName", name);

		PostDAO.campReviewCreate(review);

		resp.sendRedirect("/detail?review=1&contentId=" + contentId);

	}

}
