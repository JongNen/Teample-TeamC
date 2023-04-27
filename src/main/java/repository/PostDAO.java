package repository;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import data.Review;

public class PostDAO extends DAO{
	
	public static Review readByPost(String postNum){
		SqlSession session = factory.openSession(true);
		try {
			return session.selectOne("posts.readByPost", postNum);
		} finally {
			session.close();
		}
	}
	
	public static Review findByPostAtoB(Map map){
		SqlSession session = factory.openSession(true);
		try {
			return session.selectOne("posts.findByPostAtoB", map);
		} finally {
			session.close();
		}
	}

}
