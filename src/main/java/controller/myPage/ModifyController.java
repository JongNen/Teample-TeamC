package controller.myPage;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import data.User;
import repository.UserDAO;
import service.UserService;

@WebServlet("/user/modify")
public class ModifyController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		User logonUser = (User) session.getAttribute("logonUser");
		Boolean logon = (Boolean) session.getAttribute("logon");

		if (logon == null || !logon) {
			resp.sendRedirect("/user/login");
			return;
		}

		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String doNm = req.getParameter("doNm");
		String sigunguNm = req.getParameter("sigunguNm");
		

		if (!UserService.volume(id, pass, name)) {
			resp.sendRedirect("/user/myPage?cause=valid");
			return;
		}

		Map<String, Object> update = new HashMap<>();
		update.put("id", id);
		if (pass != null) {
			pass = BCrypt.hashpw(pass, BCrypt.gensalt());
		} else {
			pass = logonUser.getPass(); // 비밀번호를 이전 비밀번호로 유지
		}
		update.put("pass", pass);
		if (name == null) {
			update.put("name", logonUser.getName());
		} else {

			update.put("name", name);
		}

		if (doNm != null && sigunguNm == null) {

			update.put("area", doNm);
		} else if (doNm != null && sigunguNm != null) {
			update.put("area", sigunguNm);
		} else {
			update.put("area", null);
		}

		UserDAO.updateUser(update);

		session.removeAttribute("logonUser");
		session.setAttribute("logonUser", UserDAO.findById(id));

		resp.sendRedirect("/index");

	}

}
