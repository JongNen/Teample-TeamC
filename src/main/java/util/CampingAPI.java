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
import data.camping.response;

public class CampingAPI {
	
	public static response getItems() {
		
		try {
			String target ="https://apis.data.go.kr/B551011/GoCamping/basedList";
			Map<String, String> params=new HashMap<>();
			
			params.put("servicekye","RPPbdyJrFWXPErbjkYj7c62Huc3q6%2BU1raX7vbIJSFWslNC%2BCLOI0ytzsVmrM7j169lh3yP5m1cYBeQVSD5ZLA%3D%3D" );
			params.put("MobileOS","ETC");
			params.put("MobileApp", "aa");
			params.put("_type", "json");
			
			String queryString=QueryStringBuilder.build(params);
			URI uri=new URI(target+"?"+queryString);
			
			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder(uri).GET().build();
			HttpResponse<String> response = client.send(request, BodyHandlers.ofString());
			
			Gson gson=new Gson();
			
			Result responseResult = gson.fromJson(response.body(), Result.class);
			
			
			return responseResult.getResponse();
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
