package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import repository.PostDAO;

@WebServlet("/like")
public class LikeController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String campname = req.getParameter("campname");
		System.out.println("idididid = " + id);
		System.out.println("campname = " + campname );
		

		Map<String, Object> map = new HashMap();
		map.put("liker", id);
		map.put("campname", campname);

		int result = PostDAO.likeCheck(map);
		
		if(result == 0) {
			PostDAO.likeCamp(map);
		}else {
			PostDAO.unlikeCamp(map);
		}
		
		
		req.getRequestDispatcher("/WEB-INF/views/detail.jsp").forward(req, resp);
	}

}
