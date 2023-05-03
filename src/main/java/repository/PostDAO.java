package repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import data.Review;
import data.User;


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
	
	// 자기가 쓴 글
	public static List<Review> readByMyPost(String name) {
		SqlSession session = factory.openSession(true);
		try {
			return session.selectList("posts.readByMyPost", name);
		} finally {
			session.close();
		}
	}
	
	// 좋아요
		public static int likeCamp(Map map) {
			SqlSession session = factory.openSession(true);
			try {

				return session.insert("posts.likeCamp", map);
			} finally {
				session.close();
			}
		}
	
	


}
