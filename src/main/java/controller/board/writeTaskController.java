package controller.board;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.Review;
import data.User;
import repository.PostDAO;

//글쓰기 작업을 마무리해주는 컨트롤러
@WebServlet("/write-task")
public class writeTaskController extends HttpServlet {

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

			String writerName = logonUser.getName();
			String writerId = logonUser.getId();
			String title = req.getParameter("title");
			String postBody = req.getParameter("postBody");
			
			if (title == null || title.matches("")) {
				resp.sendRedirect("/write?cause=valid");
				return;
			}
			
			
			Review review = new Review();

			review.setWriterName(writerName);
			review.setWriterId(writerId);
			review.setTitle(title);
			review.setPostBody(postBody);
			review.setWrited(new Date());

			

			
			

			int r = PostDAO.createReview(review);

			if (r == 1) {
				req.setAttribute("writesuccess", true);
			}

			

			resp.sendRedirect("/board");


	}
}