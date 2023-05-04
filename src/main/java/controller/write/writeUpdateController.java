//package controller.write;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import data.Review;
//import data.User;
//import repository.PostDAO;
////후기글 수정하게 해주는 컨트롤러
//@WebServlet("/updateReview")
//public class writeUpdateController extends HttpServlet{
//
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		
//		User logonUser=(User)req.getSession().getAttribute("logonUser");
//		Review number=(Review)req.getSession().getAttribute("number");
//		
//		int postNum=number.getPostNum();
//		String writerName=logonUser.getName();
//		String writerId=logonUser.getId();
//		String title=req.getParameter("title");
//		String postBody=req.getParameter("postBody");
//		String IMG="";
//		
//		int r=PostDAO.updateReview(postNum,writerName,IMG, title, postBody, writerId);
//		
//		if(r==1) {
//			req.setAttribute("updatesuccess", true);
//		}
//		
//		
//		req.getRequestDispatcher("/WEB-INF/views/board.jsp").forward(req, resp);
//	
//	}
//	
//}
