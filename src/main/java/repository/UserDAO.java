package repoistory;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import data.User;

public class UserDAO extends DAO{

	@SuppressWarnings("rawtypes")
	public static int create(Map map) {
		SqlSession session =  factory.openSession(true);
		try {
			return session.insert("Users.create", map);
		} finally {
			session.close();
		}
	}
	
	public static User findById(String id){
		SqlSession session =  factory.openSession(true);
		try {
			return session.selectOne("users.findById", id);
		} finally {
			session.close();
		}
	}
	
	public static int updateUser(Map map) {
		SqlSession session =  factory.openSession(true);
		try {
			return session.insert("Users.updateUser", map);
		} finally {
			session.close();
		}
	}
	
	public static int delete(String id) {
		SqlSession session =  factory.openSession(true);
		try {
			return session.insert("Users.deleteUser", id);
		} finally {
			session.close();
		}
	}
	
	
}
