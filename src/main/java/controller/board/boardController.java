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

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import data.Review;
import repository.PostDAO;

//후기게시판 처리 컨트롤러
@WebServlet("/board")
public class boardController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		
		List<Review> list = PostDAO.FindPostAll();
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/WEB-INF/views/board.jsp").forward(req, resp);
	}

}
