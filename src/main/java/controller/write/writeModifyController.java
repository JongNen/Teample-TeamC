package controller.write;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.Review;
import repository.PostDAO;

//후기글 수정하게 해주는 컨트롤러
@WebServlet("/modifyReview")
public class writeModifyController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String number = req.getParameter("number");
		Review review = PostDAO.findByPost(number);

		req.setAttribute("post", review);

		req.getRequestDispatcher("/WEB-INF/views/writeModify.jsp").forward(req, resp);

	}

}
