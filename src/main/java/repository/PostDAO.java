package repository;

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

		SqlSession session = factory.openSession();
		try {
			return session.selectList("posts.findByPostAtoB", map);
		} finally {
			session.close();
		}
	}
	
	// 게시글 전체 갯수 불러오기
	public static int findByPostAll() {
		SqlSession session = factory.openSession(true);
		try {
			return session.selectOne("posts.findByPostAll");
		} finally {
			session.close();
		}
	}

	// 자기가 쓴 글
	public static List<Like> readByMyPost(String name) {
		SqlSession session = factory.openSession(true);
		try {
			return session.selectList("posts.readByMyPost", name);
		} finally {
			session.close();
		}
	}


	// 자유게시판 글 작성
		public static int createReview(Review review) {
			SqlSession session = factory.openSession(true);
			try {
				return session.insert("posts.createReview", review);
			} finally {
				session.close();
			}
		}
		
	 // 자유게시판 글 수정
		public static int modifyReview(Map map) {
			SqlSession session = factory.openSession(true);
			try {
				return session.update("posts.modifyReview", map);
			} finally {
				session.close();
			}
		}
		
	// 자유게시판 글 삭제하기
	public static int deleteReview(int postNum) {
		SqlSession session = factory.openSession(true);
		try {
			return session.delete("posts.deleteReview", postNum);
		} finally {
			session.close();
		}
	}

	// 본인이 쓴 자유게시판 글 전체 삭제
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
	public static int DeleteLikeCamp(String id) {
		SqlSession session = factory.openSession(true);
		try {
			return session.delete("posts.DeleteLikeCamp", id);
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
		
		
		// 캠핑장에 대한 리뷰 전체 삭제
				public static int deleteAllCampReview(String id) {
					SqlSession session = factory.openSession(true);
					try {

						return session.delete("posts.deleteAllCampReview", id);
					} finally {
						session.close();
					}
				}
		
		
		
	
	// 특정 게시글 볼때
	public static Review findByPostNum(String postNum) {
		SqlSession session = factory.openSession();
		try {
			return session.selectOne("posts.findBypostNum", Integer.parseInt(postNum));

		} finally {
			session.close();
		}
	}

	
}