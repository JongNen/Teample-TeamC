package controller.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.Review;
import repository.PostDAO;

//후기게시판 처리 컨트롤러
@WebServlet("/board")
public class boardController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		int p;

		if (req.getParameter("p") == null) {
			p = 1;
		}else {
			p = Integer.parseInt(req.getParameter("p"));
			
		}
		List<Review> reviewLi = PostDAO.FindPostAll();
		
		int totalPage = reviewLi.size() % 10 == 0 ? reviewLi.size() : reviewLi.size() / 10 + 1;
		
		Map<String, Object> map = new HashMap<>();
		map.put("a", p * 10 - 9); // 1~10 1page 11 ~ 20 2page
		map.put("b", p * 10);
		List<Review> list = PostDAO.findByPostAtoB(map);

		req.setAttribute("list", list);
		req.setAttribute("totalPage", totalPage);
		req.getRequestDispatcher("/WEB-INF/views/board.jsp").forward(req, resp);
	}

}
