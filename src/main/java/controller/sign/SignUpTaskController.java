package controller.sign;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import repository.UserDAO;
import service.UserService;

@WebServlet("/user/signUp-task")
public class SignUpTaskController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 회원가입시 사용자 정보 처리

		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String area = req.getParameter("area");

		System.out.println("id = " + id);
		System.out.println("pass = " + pass);
		System.out.println("name = " + name);
		System.out.println("area = " + area);

		// 패스워드를 암호화하고 비밀번호에 세팅
		String hashed = BCrypt.hashpw(pass, BCrypt.gensalt());

		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pass", hashed);
		map.put("name", name);
		map.put("area", area);

		// 회원가입시 제약조건이 맞지 않으면 에러 팝업 / 그게 아니면 가입 성공으로 메인페이지로
		if (UserService.volume(id, pass, name)) {
			int r = UserDAO.create(map);
			resp.sendRedirect("/index");
			req.setAttribute("logon", true);
			return;
		} else {

			resp.sendRedirect("/user/signUp?cause=valid");

		}

	}

}
