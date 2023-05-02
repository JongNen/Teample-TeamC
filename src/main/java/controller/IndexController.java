package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.camping.Response;
import util.CampingAPI;

@WebServlet("/index")
public class IndexController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Response response = CampingAPI.getCamping("1");
		
		req.setAttribute("campingList", response.getBody().getItems().getItem());		
		
			

		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
		
		
	}
}
