package util;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import data.camping.Result;
import data.camping.item;
import data.camping.response;

public class CampingAPI {
	
	public static Map<String, item> cache; 
	static{
		cache = new HashMap<>();
	}
	public synchronized static response getCamping(String upkind, String upr_cd, String pageNo,
			String bgnde, String endde) {
	
		try {
			String target ="https://apis.data.go.kr/B551011/GoCamping/basedList";
			Map<String, String> params=new HashMap<>();
			
			params.put("servicekye","bI%2BSi3PKj%2FCVQyxnzKyhn7%2BhaxEO6V5qaw1LzLm8fal6Nr3ACYr%2BfUtAxY3ep0JRvLC2IohFjTNknAczemfuFQ%3D%3D" );
			params.put("MobileOS","ETC");
			params.put("MobileApp", "aa");
			params.put("_type", "json");
			params.put("numOfRows", "5");
			
			String queryString=QueryStringBuilder.build(params);
			URI uri=new URI(target+"?"+queryString);
			
			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(uri).GET().build();
			HttpResponse<String> response = client.send(request, BodyHandlers.ofString());
			
			Gson gson=new Gson();
			
			Result responseResult = gson.fromJson(response.body(), Result.class);
			
			for(item one : responseResult.getResponse().getBody().getItems().getItem() ) {
				cache.put(one.getContentId(), one);			
			}
			
			return responseResult.getResponse();
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}



