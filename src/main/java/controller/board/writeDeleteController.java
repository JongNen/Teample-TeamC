package controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.Review;
import data.User;
import repository.PostDAO;

//글 삭제하는 컨트롤러
@WebServlet("/deleteReview")
public class writeDeleteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		User logonUser = (User) session.getAttribute("logonUser");
		Boolean logon = (Boolean) session.getAttribute("logon");

		if (logonUser == null || !logon) {
			resp.sendRedirect("/board");
			return;
		}

		req.setCharacterEncoding("utf-8");

		int postNum = Integer.parseInt(req.getParameter("number"));

		int r = PostDAO.deleteReview(postNum);

		if (r == 1) {
			req.setAttribute("deletesuccess", true);
		}

		resp.sendRedirect("/board");
	}

}
