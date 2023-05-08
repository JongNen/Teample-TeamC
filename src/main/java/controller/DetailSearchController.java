package controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.camping.Item;
import util.CampingAPI;

@WebServlet("/detailSearch")
public class DetailSearchController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String[] doNm = req.getParameterValues("doNm"); // 도
		String[] lctCl = req.getParameterValues("lctCl"); // 입지
		String[] facltDivNm = req.getParameterValues("facltDivNm"); // 사업주체
		String[] sbrsCl = req.getParameterValues("sbrsCl"); // 부대시설
		String[] induty = req.getParameterValues("induty"); // 주요시설
		
	
		// 기타 정보(동물, 트레일러, 캠핑카)
		String animalCmgCl = req.getParameter("animalCmgCl") != null ? req.getParameter("animalCmgCl") : "";
		String trlerAcmpnyAt = req.getParameter("trlerAcmpnyAt") != null ? req.getParameter("trlerAcmpnyAt") : "";
		
//		System.out.println("do = " + Arrays.toString(doNm));
//		System.out.println("thema = " + Arrays.toString(lctCl));
//		System.out.println("company = " + Arrays.toString(facltDivNm));
//		System.out.println("siseol = " + Arrays.toString(sbrsCl));
//		System.out.println("trler = " +  trlerAcmpnyAt);
//		System.out.println("=======================");
			
		int p;

		if (req.getParameter("pageNo") == null) {
			p = 1;
		} else {
			p = Integer.parseInt(req.getParameter("pageNo"));
		}

		String pageNo = p + "";

		if (doNm == null && lctCl == null && facltDivNm == null && sbrsCl == null 
			&&induty==null&& animalCmgCl == null && trlerAcmpnyAt == null) {
			List<Item> response = CampingAPI.getCamping(pageNo);

			if (response != null) {
				req.setAttribute("datas", response); // 검색에 필요한 데이터 끌어다 쓰게
				req.setAttribute("total", CampingAPI.cache.size()); // 불러온 검색 데이터 수

	        	}

			int total = CampingAPI.cache.size(); // 데이터 전체 개수
			int totalPage = total / 10 + (total % 10 > 0 ? 1 : 0); // 전체 페이지 수
			int viewSize = 5; // 한 화면에 보여지는 페이지 수
			int start = ((p - 1) / viewSize) * viewSize + 1; // 1
			int last = (((p - 1) / viewSize) + 1) * viewSize; // 5

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
			
			
		} else {
			//애완동물 
			if (animalCmgCl.equals("on")) {
				animalCmgCl = "가능";
			} else if(animalCmgCl.equals("불가능") ){
				animalCmgCl = "불가능";
			} else {
				animalCmgCl =null;
			}
	//	System.out.println("animal = " +  animalCmgCl);
			
			if(trlerAcmpnyAt.equals("on")) {
				trlerAcmpnyAt = "Y";
			} else {
				trlerAcmpnyAt = "N";
			} 
			
			List<Item> list = CampingAPI.detailSearch(doNm, lctCl, facltDivNm, sbrsCl, induty, animalCmgCl, trlerAcmpnyAt);
			
			
			List<Item> response = CampingAPI.detailSearchPaging(list, pageNo);
			
			if (response != null) {
				req.setAttribute("datas", response); // 검색에 필요한 데이터 끌어다 쓰게
				req.setAttribute("total", list.size()); // 불러온 검색 데이터 수

			}
			
			int total = list.size();
			int totalPage = total / 10 + (total % 10 > 0 ? 1 : 0); // 전체 페이지 수
			int viewSize = 5; // 한 화면에 보여지는 페이지 수
			int start = ((p - 1) / viewSize) * viewSize + 1; // 1
			int last = (((p - 1) / viewSize) + 1) * viewSize; // 5

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
			System.out.println("exstNext =" + existNext);
			
		}

		// doNm 검색 세팅
		String[] doAndMctNm = {"광주시", "대구시", "대전시", "부산시", "서울시", "세종시", "인천시", "울산시", "제주도", "강원도", "경기도", "경상북도",
				"경상남도", "전라북도", "전라남도", "충청북도", "충청남도" };
		req.setAttribute("doList", doAndMctNm);
		
		// lctCl 검색 세팅
				
		String[] thema = {"강", "계곡", "도심", "산", "섬", "숲", "해변" };
				
		req.setAttribute("themaList", thema);

		String[] facList = {"지자체", "국립공원", "자연휴양림", "국민여가", "민간" };
		req.setAttribute("facList", facList);

		String[] sbrList = {"전기", "무선인터넷", "장작판매", "온수", "트램폴린", "물놀이장", "놀이터", "산책로", "운동장", " 운동시설", "마트.편의점" };
		req.setAttribute("sbrList", sbrList);
		
		String[] indutyList = {"일반야영장", "자동차야영장", "카라반", "글램핑"};
		req.setAttribute("indutyList", indutyList);
		
		req.getRequestDispatcher("/WEB-INF/views/detailSearch.jsp").forward(req, resp);
	}
}
