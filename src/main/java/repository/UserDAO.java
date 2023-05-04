package repository;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import data.User;

public class UserDAO extends DAO {

	// 회원가입
	public static int create(Map map) {
		SqlSession session = factory.openSession(true);
		try {
			return session.insert("users.create", map);
		} finally {
			session.close();
		}
	}

	//로그인
	public static User findById(String id) {
		SqlSession session = factory.openSession(true);
		try {
			return session.selectOne("users.findById", id);
		} finally {
			session.close();
		}
	}

	public static int updateUser(Map map) {
		SqlSession session = factory.openSession(true);
		try {
			return session.update("users.updateUser", map);
		} finally {
			session.close();
		}
	}

//	사용자 정보 삭제
	public static int delete(String id) {
		SqlSession session = factory.openSession(true);
		try {
			return session.delete("users.deleteUser", id);
		} finally {
			session.close();
		}
	}

}
