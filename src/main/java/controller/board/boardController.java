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
		
		String page =  req.getParameter("p");

		// page 파라미터값이 null 이면 1로 고정 그게아니면 파람값으로
		int p;
		if(page == null) {
			p = 1;
		}else {
			p = Integer.parseInt(page);
		}
		
		// 파라미터 a, b값을 설계
		int a = (p-1)*10;
		int b = 10;
		
		Map<String, Integer> map = new HashMap<>();
		map.put("a", a);
		map.put("b", b);
		
		// 글 목록 가져오기
		List<Review> list = PostDAO.findByPostAtoB(map);
		
		// 글 목록 세팅해주기
		req.setAttribute("list", list);
		
		int total = PostDAO.findByPostAll();
		int totalPage = total/10 + (total % 10 > 0 ? 1 : 0);
		int viewPage = 5;
		
		int endPage = (((p-1)/viewPage)+1) * viewPage;
		if(totalPage < endPage) {
		    endPage = totalPage;
		}
		
		int startPage = ((p-1)/viewPage) * viewPage + 1;
		
		int idx = p * 10;
		
		req.setAttribute("idx", idx);
		req.setAttribute("start", startPage);
		req.setAttribute("last", endPage);
		req.setAttribute("totalPage", totalPage);
		boolean existPrev = startPage >= viewPage+1;
		boolean existNext = true;
		if(endPage >= totalPage)
		{
			existNext = false;
		}
		
		req.setAttribute("existPrev", existPrev);
		req.setAttribute("existNext", existNext);
		

		req.getRequestDispatcher("/WEB-INF/views/board.jsp").forward(req, resp);
	}

}
