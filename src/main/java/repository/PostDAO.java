package repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import data.Like;
import data.Review;

public class PostDAO extends DAO {

	public static Review readByPost(String postNum) {
		SqlSession session = factory.openSession(true);
		try {
			return session.selectOne("posts.readByPost", postNum);
		} finally {
			session.close();
		}
	}

	public static Review findByPostAtoB(Map map) {
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

	// 좋아요 추가
	public static int likeCamp(Map map) {
		SqlSession session = factory.openSession(true);
		try {

			return session.insert("posts.likeCamp", map);
		} finally {
			session.close();
		}
	}

	// 좋아요 여부 확인
	public static int likeCheck(Map map) {
		SqlSession session = factory.openSession(true);
		try {
			return session.selectOne("posts.likeCheck", map);
		} finally {
			session.close();
		}
	}

	// 좋아요 삭제
	public static int unlikeCamp(Map map) {
		SqlSession session = factory.openSession(true);
		try {

			return session.insert("posts.unlikeCamp", map);
		} finally {
			session.close();
		}
	}

}
