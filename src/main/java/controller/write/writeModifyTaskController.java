package controller.write;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.Review;
import repository.PostDAO;

@WebServlet("/modifyReview-Task")
public class writeModifyTaskController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		int postNum = Integer.parseInt(req.getParameter("number"));

		String number = req.getParameter("number");
		String title = req.getParameter("title");
		String postBody = req.getParameter("postBody");
		String IMG = "";
		
		if(title == null || title.matches("")) {
			resp.sendRedirect("/modifyReview?cause=valid&number=" + number);
			return;
		}

		Review review = PostDAO.findByPost(number);

		req.setAttribute("post", review);

		int r = PostDAO.modifyReview(title, IMG, postBody, postNum);

		if (r == 1) {
			req.setAttribute("modifysuccess", true);
		}

		resp.sendRedirect("/boardDetail?number=" + number);

	}
}
