package controller.myPage;

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

@WebServlet("/user/myPage")
public class MyPageController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession();
	    User user = (User) session.getAttribute("logonUser");
	    if (user == null) {
	        resp.sendRedirect("/index");
	        return;
	    }
	    
	    String name = req.getParameter("name");
	   
	    List<Review> myPost = PostDAO.readByMyPost(name);
	    req.setAttribute("myPost", myPost);
	   
	    req.getRequestDispatcher("/WEB-INF/views/user/myPage.jsp").forward(req, resp);
	}

}
