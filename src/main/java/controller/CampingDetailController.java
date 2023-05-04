package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.camping.Item;
import data.camping.Response;

import util.CampingAPI;

@WebServlet("/detail")
public class CampingDetailController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String contentId = req.getParameter("contentId");
		System.out.println("test = " + contentId);
		Item camp = CampingAPI.findByItem(contentId);
	
		
		
		req.setAttribute("camp", camp);
		
		
		req.getRequestDispatcher("/WEB-INF/views/campingDetail.jsp").forward(req, resp);
	}
}
