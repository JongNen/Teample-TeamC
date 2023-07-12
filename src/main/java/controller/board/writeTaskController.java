package controller.board;

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
			
			Map map = new HashMap<>();
			map.put("writerName", writerName);
			map.put("title", title);
			map.put("postBody", postBody);
			map.put("writerId", writerId);
			

			int r = PostDAO.createReview(map);

			if (r == 1) {
				req.setAttribute("writesuccess", true);
			}

			System.out.println("r====" + r);

			resp.sendRedirect("/board");


	}
}