package repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import data.CampReview;
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

	// 게시글 페이징처리해서 불러오기
	public static List<Review> findByPostAtoB(Map map) {

		SqlSession session = factory.openSession(true);
		try {
			return session.selectList("posts.findByPostAtoB", map);
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

	public static List<Review> allPosts(Map map) {
		SqlSession session = factory.openSession(true);
		try {
			return session.selectList("posts.allPosts", map);
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
	//후기삭제하기
	public static int deleteReview(int postNum) {
		SqlSession session = factory.openSession(true);
		try {
			return session.delete("posts.deleteReview", postNum);
		} finally {
			session.close();
		}
	}

	// 본인이 쓴 후기 전체 삭제
	public static int deleteAllReview(String id) {
		SqlSession session = factory.openSession(true);
		try {
			return session.delete("posts.deleteAllReview", id);
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

	// 좋아요 여부 확인
	public static int likeCheck(Map map) {
		SqlSession session = factory.openSession(true);
		try {
			return session.selectOne("posts.likeCheck", map);
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

	// 좋아요 삭제
	public static int unlikeCamp(Map map) {
		SqlSession session = factory.openSession(true);
		try {
			return session.delete("posts.unlikeCamp", map);
		} finally {
			session.close();
		}
	}

	// 좋아요된 캠핑장 전체 삭제
	public static int allDeleteCamp(String id) {
		SqlSession session = factory.openSession(true);
		try {
			return session.delete("posts.allDeleteCamp", id);
		} finally {
			session.close();
		}
	}

	// 캠핑장 정보 불러오기
	public static List<Like> findByCamp(String id) {
		SqlSession session = factory.openSession(true);
		try {
			return session.selectList("posts.findByCamp", id);
		} finally {
			session.close();
		}
	}
	
	// 캠핑장에 대한 리뷰 작성
		public static int campReviewCreate(Map map) {
			SqlSession session = factory.openSession(true);
			try {
				return session.insert("posts.campReviewCreate", map);
			} finally {
				session.close();
			}
		}
		
		// 캠핑장에 대한 리뷰 불러오기
		public static List<CampReview> findByCampReview(String id) {
			SqlSession session = factory.openSession(true);
			try {

				return session.selectList("posts.findByCampReview", id);
			} finally {
				session.close();
			}
		}
		
		// 캠핑장에 대한 리뷰 삭제(본인만 가능)
		public static int deleteCampReview(int id) {
			SqlSession session = factory.openSession(true);
			try {

				return session.delete("posts.deleteCampReview", id);
			} finally {
				session.close();
			}
		}
	
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
