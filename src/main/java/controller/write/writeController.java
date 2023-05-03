package controller.write;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.User;


public class writeController extends HttpServlet {

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//			//글쓰기 컨트롤러
//			req.setCharacterEncoding("utf-8");
//			
//			User logonUser = (User)req.getSession().getAttribute("logonUser");
//			
//			String target=req.getParameter("target");
//			String writer=logonUser.getName();
//			String title=req.getParameter("title");
//			String postBody=req.getParameter("postBody");
//			String IMG=req.getParameter("IMG");
//			
//			System.out.println("writer="+writer);
//			
//			int r=WriteDAO.createReview(target, writer, title, postBody, IMG);
		
			req.getRequestDispatcher("/WEB-INF/views/write.jsp").forward(req, resp);
		}
		
}

