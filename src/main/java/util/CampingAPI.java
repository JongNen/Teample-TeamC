package util;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import data.camping.Body;
import data.camping.Item;
import data.camping.Result;

public class CampingAPI {

	public static List<Item> cache;

	/** 서버 초기화시 캐시에 데어터 세팅하는 메소드 */
	public static void loadOn() {

		try {

			String target = "https://apis.data.go.kr/B551011/GoCamping/basedList";
			String queryString = "serviceKey=bI%2BSi3PKj%2FCVQyxnzKyhn7%2BhaxEO6V5qaw1LzLm8fal6Nr3ACYr%2BfUtAxY3ep0JRvLC2IohFjTNknAczemfuFQ%3D%3D";
			queryString += "&_type=json&MobileOS=ETC&MobileApp=aa&numOfRows=3436";

			URI uri = new URI(target + "?" + queryString);
			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(uri).GET().build();
			HttpResponse<String> response = client.send(request, BodyHandlers.ofString());

			// Gson 라이브러리를 사용하여 JSON 문자열을 객체로 변환
			Gson gson = new Gson();

			Result responseResult = gson.fromJson(response.body(), Result.class);

			cache = responseResult.getResponse().getBody().getItems().getItem();

		} catch (Exception e) {

		}

	}

	/** 데이터를 불러올때 10개씩 불러오기(전체 데이터 페이징) */
	public synchronized static List<Item> getCamping(String pageNo) {

		int page = pageNo == null ? 1 : Integer.parseInt(pageNo);
		int from = (page - 1) * 10;
		int to = page == 344 ? from + 6 : page * 10;

		return cache.subList(from, to);

	}
	
	public synchronized static List<Item> campingList(String pageNo) {

		int page = pageNo == null ? 1 : Integer.parseInt(pageNo);
		int from = 0;
		int to = 3436;

		return cache.subList(from, to);

	}
	


	

	/** Item에 있는 contentId를 찾는 메소드 */
	public static Item findByItem(String contentId) {
		Item found = null;
		for (Item i : cache) {
			if (i.getContentId().equals(contentId)) {
				found = i;
				break;
			}
		}
		return found;
	}

	/**
	 * 세팅된 cache에서 도,시군구, 입지구분등 기본 검색에 관한 메서드 검색에서 공백이 아니거나 가져오는 변수가 같지 않으면 continue
	 */
	public static List<Item> search(String doNm, String sigungu, String lctCl) {

		List<Item> found = new ArrayList<>();

		for (Item item : cache) {
			if (!doNm.equals("") && !item.getDoNm().equals(doNm)) {
				continue;
			}
			if (!sigungu.equals("") && !item.getSigunguNm().equals(sigungu)) {
				continue;
			}
			if (!lctCl.equals("") && !item.getLctCl().contains(lctCl)) {
				continue;
			}
			found.add(item);
			System.out.println(item.getLctCl());
		}
		return found;
	}

	/** 도, 시군구, 입지구분 등 검색할때 마다 한화면에 보여지는 개수 처리하는 메소드 */

	public static List<Item> searchPaging(List<Item> searchData, String pageNo) {
		int page = pageNo == null ? 1 : Integer.parseInt(pageNo);
		int from = (page - 1) * 10; // 0;
		int to = page == (searchData.size() / 10 + 1) ? from + (searchData.size() % 10) : page * 10;

		return searchData.subList(from, to);
	}

}