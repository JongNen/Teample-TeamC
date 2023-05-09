package controller.write;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.User;

import repository.PostDAO;

//글쓰기 작업을 마무리해주는 컨트롤러
@WebServlet("/write-task")
public class writeTaskController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		User logonUser = (User) req.getSession().getAttribute("logonUser");

		String writerName = logonUser.getName();
		String writerId = logonUser.getId();
		String title = req.getParameter("title");
		String postBody = req.getParameter("postBody");
		String IMG = "";
		
		if(title == null || title.matches("")) {
			resp.sendRedirect("/write?cause=valid");
			return;
		}

		int r = PostDAO.createReview(writerName, IMG, title, postBody, writerId);

		if (r == 1) {
			req.setAttribute("writesuccess", true);
		}

		resp.sendRedirect("/board");
	}
}
