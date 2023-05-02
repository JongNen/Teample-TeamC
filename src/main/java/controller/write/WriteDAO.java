package controller.write;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import repository.DAO;


public class WriteDAO extends DAO{
	//글쓰기 처리하는 DAO
	public static int createReview(String target, String writer, String title, String postBody, String IMG, String writerId ) {
		SqlSession session=factory.openSession(true);
		Map<String, Object> obj=new HashMap<>();
		obj.put("target", target);
		obj.put("writer", writer);
		obj.put("title", title);
		obj.put("postBody", postBody);
		obj.put("writerId", writerId);
		
		//이미지가 빈 값으로 넘어올 수도 있으니 이미지가 없으면 이미지경로 공백입력
		if(IMG==null) {
			obj.put("image", "");
		}else {
			obj.put("image", IMG);
		}
		int r= session.insert("posts.write",obj);
		session.close();
		return r;
	}
	

	
}


