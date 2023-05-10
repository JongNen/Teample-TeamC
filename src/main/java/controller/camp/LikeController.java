package controller.camp;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/api/like")
public class LikeController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(); // 현재 HttpSession 객체 가져오기
		User logonUser = (User) session.getAttribute("logonUser"); // 세션 속성 가져오기

		String liker = logonUser.getId();
		String campname = req.getParameter("campname").replace("(주)", "");
		String campid = req.getParameter("campid");

		Map<String, Object> map = new HashMap();
		map.put("liker", liker);
		map.put("campname", campname);
		map.put("campid", campid);

		int result = PostDAO.likeCheck(map);

		if (result == 0) {
			PostDAO.likeCamp(map);
		} else {
			PostDAO.unlikeCamp(map);
		}
		resp.setContentType("text/json;charset=utf-8");
		PrintWriter out = resp.getWriter();

		if (result == 0) {
			out.println("{ \"done\" : \"far\" }");
		} else {
			out.println("{ \"done\" : \"fas\" }");
		}

	}
}
