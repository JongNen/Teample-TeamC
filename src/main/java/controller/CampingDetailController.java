package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import data.Like;
import data.camping.Item;
import repository.PostDAO;
import util.CampingAPI;

@WebServlet("/detail")
public class CampingDetailController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String contentId = req.getParameter("contentId");
	    Item camp = CampingAPI.findByItem(contentId);
	    List<Like> like = PostDAO.findByCamp(contentId);

	   

	    req.setAttribute("camp", camp);    
	    req.setAttribute("likeCheckJson", new Gson().toJson(like));
	   

	    req.getRequestDispatcher("/WEB-INF/views/campingDetail.jsp").forward(req, resp);
	}

}
