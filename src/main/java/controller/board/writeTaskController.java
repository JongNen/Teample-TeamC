package controller.board;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import data.User;
import repository.PostDAO;

//글쓰기 작업을 마무리해주는 컨트롤러
@WebServlet("/write-task")
public class writeTaskController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");

		HttpSession session = req.getSession();
		User logonUser = (User) session.getAttribute("logonUser");
		Boolean logon = (Boolean) session.getAttribute("logon");

		if (logonUser == null || !logon) {
			resp.sendRedirect("/board");
			return;
		}

		String path = req.getServletContext().getRealPath("/upload");
		System.out.println("path ==> " + path);
		int fileSize = 1024 * 1024 * 10; // 5MB

		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}

		try {
			MultipartRequest multi = new MultipartRequest(req, path, fileSize, "UTF-8", new DefaultFileRenamePolicy());

			Enumeration e = multi.getFileNames();
			System.out.println("file ==> " + e);

			String IMG = null;
			String orgfilename = null;

			String writerName = logonUser.getName();
			String writerId = logonUser.getId();
			String title = multi.getParameter("title");
			String postBody = multi.getParameter("postBody");

			if (title == null || title.matches("")) {
				resp.sendRedirect("/write?cause=valid");
				return;
			}

			while (e.hasMoreElements()) {
				String file = (String) e.nextElement();
				IMG = multi.getFilesystemName(file);
				System.out.println("IMG ==> " + IMG);
				orgfilename = multi.getOriginalFileName(file);
				System.out.println("orgfilename ==> " + orgfilename);
			}

			int r = PostDAO.createReview(writerName, IMG, title, postBody, writerId);

			if (r == 1) {
				req.setAttribute("writesuccess", true);
			}

			System.out.println("r====" + r);

			resp.sendRedirect("/board");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}