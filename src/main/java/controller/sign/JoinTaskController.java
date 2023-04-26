package controller.sign;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/join-task")
public class JoinTaskController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 회원가입시 사용자 정보 처리
		req.setCharacterEncoding("utf-8");

		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String like_Area = req.getParameter("likeArea");

		int r = 1;

		// 회원가입 실패시 에러 처리 / 가입 성공시 로그인 처리 후 메인 페이지로 이동

		if (r != 1) {

			resp.sendRedirect("/user/signUp?error=1");
		} else {
			resp.sendRedirect("/");
			req.setAttribute("logon", true);
		

		}

	}

}
