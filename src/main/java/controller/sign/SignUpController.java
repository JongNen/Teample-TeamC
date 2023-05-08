package controller.sign;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/signUp")
public class SignUpController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		// doNm 검색 세팅
				String[] doAndMctNm = { "광주광역시", "대구광역시", "대전광역시", "부산광역시", "서울특별시", "세종특별자치시", "인천광역시", "울산광역시", "제주특별자치도", "강원도", "경기도", "경상북도",
						"경상남도", "전라북도", "전라남도", "충청북도", "충청남도" };
				req.setAttribute("doList", doAndMctNm);
				

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
		
		req.getRequestDispatcher("/WEB-INF/views/user/signUp.jsp").forward(req, resp);
	}
}
