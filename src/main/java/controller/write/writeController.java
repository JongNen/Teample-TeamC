package controller.write;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.User;
//글쓰기 컨트롤러
@WebServlet("/write")
public class writeController extends HttpServlet {

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			req.getRequestDispatcher("/WEB-INF/views/write.jsp").forward(req, resp);
		}
		
}

