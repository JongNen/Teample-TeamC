package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.User;
import data.camping.Item;
import data.camping.Response;
import util.CampingAPI;

@WebServlet("/index")
public class IndexController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(); // 현재 HttpSession 객체 가져오기
		User logonUser = (User) session.getAttribute("logonUser"); // 세션 속성 가져오기

		List<Item> response = CampingAPI.campingList();

		List<Item> recommends = new ArrayList<>();
		
		int count = 0;

		if (req.getSession().getAttribute("logonUser") == null || logonUser.getArea() == null) {
			// 로그인 상태가 아니면..
			while (count < 5) {
				count++;
				Item item = response.get((int) (Math.random() * response.size()));

				recommends.add(item);
			}

		} else {
			// 반복문을 돌면서 하나씩 체크
			

			for (Item item : response) {
				if (item.getSigunguNm().length() >= 2 && item.getAddr1().length() >= 2
						&& item.getDoNm().length() >= 2) {

					if (logonUser.getArea().matches(item.getSigunguNm())) {

						count++;
						recommends.add(item);

					} else if (logonUser.getArea().substring(0,2).matches(item.getDoNm().substring(0,2))) {

						count++;
						recommends.add(item);
					}

					if (count == 5) {
						count = 0;
						break;
					}
				}
			}
		}

		req.setAttribute("campingList", recommends);

		// 도- 광역시 검색 세팅
		String[] doAndMctNm = { "광주시", "대구시", "대전시", "부산시", "서울시", "세종시", "인천시", "울산시", "제주도", "강원도", "경기도", "경상북도",
				"경상남도", "전라북도", "전라남도", "충청북도", "충청남도" };
		req.setAttribute("doList", doAndMctNm);

		// lctCl 검색 세팅
		String[] thema = { "강", "계곡", "도심", "산", "섬", "숲", "해변" };

		req.setAttribute("themaList", thema);

		// sigungu 검색 세팅(각 광역시, 도에 있는 시, 군, 구를 세팅

		String[] seoul = { "전체", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구",
				"마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" };
		req.setAttribute("seoul", seoul);

		String[] busan = { "전체", "강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구",
				"영도구", "중구", "해운대구" };
		req.setAttribute("busan", busan);

		String[] daegu = { "전체", "남구", "달서구", "달성군", "동구", "북구", "상주", "서구", "수성구", "중구" };
		req.setAttribute("daegu", daegu);

		String[] incheon = { "전체", "강화군", "계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "옹진군", "중구" };
		req.setAttribute("incheon", incheon);

		String[] gwangju = { "전체", "광산구", "남구", "동구", "북구", "서구" };
		req.setAttribute("gwangju", gwangju);

		String[] daejeon = { "전체", "대덕구", "동구", "서구", "유성구", "중구" };
		req.setAttribute("daejeon", daejeon);

		String[] ulsan = { "전체", "남구", "동구", "북구", "울주군", "중구" };
		req.setAttribute("ulsan", ulsan);

		String[] sejong = { "전체", "금남면", "세종시", "소정면", "연서면", "전동면" };
		req.setAttribute("sejong", sejong);

		String[] gyeonggi = { "전체", "가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시",
				"성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시",
				"이천시", "파주시", "평택시", "포천시", "하남시", "화성시" };
		req.setAttribute("gyeonggi", gyeonggi);

		String[] gangwon = { "전체", "강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군",
				"춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군" };
		req.setAttribute("gangwon", gangwon);

		String[] chungbuk = { "전체", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "증평군", "진천군", "청원군", "청주시",
				"충주시" };
		req.setAttribute("chungbuk", chungbuk);

		String[] chungnam = { "전체", "계룡시", "공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "예산군", "천안시",
				"청양군", "태안군", "홍성군" };
		req.setAttribute("chungnam", chungnam);

		String[] jeonbuk = { "전체", "고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시",
				"정읍시", "진안군" };
		req.setAttribute("jeonbuk", jeonbuk);

		String[] jeonnam = { "전체", "강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군",
				"여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군" };
		req.setAttribute("jeonnam", jeonnam);

		String[] gyeongbuk = { "전체", "경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군",
				"영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시" };
		req.setAttribute("gyeongbuk", gyeongbuk);

		String[] gyeongnam = { "전체", "거제시", "거창군", "고성군", "김해시", "남해군", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "창녕군",
				"창원시", "통영시", "하동군", "함안군", "함양군", "합천군" };
		req.setAttribute("gyeongnam", gyeongnam);

		String[] jeju = { "전체", "제주시", "서귀포시" };
		req.setAttribute("jeju", jeju);
		
		//상세 검색때 필요한 데이터
		String[] facList = { "지자체", "국립공원", "자연휴양림", "국민여가", "민간" };
		req.setAttribute("facList", facList);

		String[] sbrList = { "전기", "무선인터넷", "장작판매", "온수", "트렘폴린", "물놀이장", "놀이터", 
							"산책로", "운동장", " 운동시설", "마트-편의점"};
		req.setAttribute("sbrList", sbrList);
		
		String[] indutyList = {"일반야영장", "자동차야영장", "카라반", "글램핑"};
		req.setAttribute("indutyList", indutyList);
		
		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);

	}
}
