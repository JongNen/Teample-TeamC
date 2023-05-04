package repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

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

	// 게시글 페이징처리해서 불러오기
	public static List<Review> findByPostAtoB(Map map) {
		SqlSession session = factory.openSession(true);
		try {
			return session.selectList("posts.findByPostAtoB", map);
		} finally {
			session.close();
		}
	}

	public static List<Review> readByMyPost(String name) {
		SqlSession session = factory.openSession(true);
		try {
			return session.selectList("posts.readByMyPost", name);
		} finally {
			session.close();
		}
	}

	// 모든 리뷰 보기
	public static List<Review> allPosts() {
		SqlSession session = factory.openSession(true);
		try {
			return session.selectList("posts.allPosts");
		} finally {
			session.close();
		}
	}

	// 후기 작성
	public static int createReview(String writerName, String IMG, String title, String postBody, String writerId) {
		SqlSession session = factory.openSession(true);
		Map<String, Object> obj = new HashMap<>();

		if (IMG == null) {
			obj.put("IMG", "");
		} else {
			obj.put("IMG", IMG);
		}
		obj.put("title", title);
		obj.put("postBody", postBody);
		obj.put("writerId", writerId);
		obj.put("writerName", writerName);

		int r = session.insert("posts.write", obj);

		session.close();
		return r;
	}

	// 후기 삭제
	public static int deleteReview(int postNum) {
		SqlSession session = factory.openSession(true);
		try {
			return session.delete("posts.delete", postNum);
		} finally {
			session.close();
		}
	}

	// 게시글 전부 다 불러올때
	public static List<Review> FindPostAll() {
		SqlSession session = factory.openSession();
		try {
			return session.selectList("posts.allPosts");
		} finally {
			session.close();
		}
	}
	// 게시글 페이징 처리시
//	public static List<Review> getFindPostAtoB(int a, int b) {
//		Map map = new HashMap<>();
//		map.put("a", a);
//		map.put("b", b);
//		SqlSession session=factory.openSession();
//		try {
//			return session.selectList("posts.findByPostAtoB", map);
//		} finally {
//			session.close();
//		}
//	}

	// 특정 게시글 볼때
	public static Review findByPost(String postNum) {
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("posts.findBypostNum", postNum);
		} finally {
			session.close();
		}
	}

	// 후기 수정하기
	public static int modifyReview(String title, String IMG, String postBody, int postNum) {
		SqlSession session = factory.openSession(true);
		Map<String, Object> obj = new HashMap<>();
		try {
			if (IMG == null) {
				obj.put("IMG", "");
			} else {
				obj.put("IMG", IMG);
			}
			obj.put("title", title);
			obj.put("postBody", postBody);
			obj.put("postNum", postNum);
			return session.update("posts.modify", obj);
		} finally {
			session.close();
		}

	}

}
