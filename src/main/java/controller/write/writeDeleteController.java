package controller.write;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.User;
import repository.PostDAO;
//글 삭제하는 컨트롤러
@WebServlet("/delete")
public class writeDeleteController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		User logonUser =(User)req.getSession().getAttribute("logonUser");
		String writerId=logonUser.getId();
		
		int r=PostDAO.deleteReview(writerId);
		
		if(r==1) {
			req.setAttribute("deletesuccess", true);
		}
		
		
		req.getRequestDispatcher("/WEB-INF/views/board.jsp").forward(req, resp);
	
	}

}
