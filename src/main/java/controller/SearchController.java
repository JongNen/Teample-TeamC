package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.camping.Item;
import data.camping.Response;
import util.CampingAPI;

@WebServlet("/search")
public class SearchController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 사용자가 검색한 것을 받아오고
		String doNm = req.getParameter("doNm"); // 도
		String sigunguNm = req.getParameter("sigunguNm"); // 시,군,구
		String lctCl = req.getParameter("lctCl"); // 입자구분

		System.out.println("doNm = " + doNm);
		System.out.println("si = " + sigunguNm);
		System.out.println("lct = " + lctCl);
		
		int p;
		
		if (req.getParameter("pageNo") == null) {
			p = 1;
		} else {
			p = Integer.parseInt(req.getParameter("pageNo"));
		}
		
		String pageNo = p + "";

		
		Response response = CampingAPI.getCamping(pageNo);
		
		// ========================================================		
		
		if (response != null) {
			req.setAttribute("datas", response.getBody().getItems().getItem()); // 검색에 필요한 데이터 끌어다 쓰게
			req.setAttribute("total", response.getBody().getTotalCount()); // 불러온 검색 데이터 수
		
		}
		
	
		// 페이징 처리

		int total = response.getBody().getTotalCount(); // 데이터 전체 개수
		int totalPage = total / 10 + (total % 10 > 0 ? 1 : 0); // 전체 페이지 수
		int viewSize = 5; // 한 화면에 보여지는 페이지 수
		int start = ((p - 1) / viewSize) * viewSize + 1; //1
		int last = (((p - 1) / viewSize) + 1) * viewSize; //5

		if (totalPage < last) {
			last = totalPage;
		}

		req.setAttribute("start", start);
		req.setAttribute("last", last);

		boolean existPrev = start >= 6;
		
		boolean existNext = true;
		
		if (last >= totalPage) {
			existNext = false;
		}

		req.setAttribute("existPrev", existPrev);
		req.setAttribute("existNext", existNext);
//		System.out.println("existPrev = " + existPrev);
//		System.out.println("existNext = " + existNext);
		
		req.getRequestDispatcher("/WEB-INF/views/search.jsp").forward(req, resp);

	}
}
