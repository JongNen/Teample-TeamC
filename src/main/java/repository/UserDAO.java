package repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import data.user.User;

public class UserDAO extends DAO{

	
	public static int create(Map map) {
		SqlSession session = factory.openSession(true);
		try {
			return session.insert("users.create", map);
		} finally {
			session.close();
		}
	}
	
	public static User findById(String id){
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
	
	public static int delete(String id) {
		SqlSession session = factory.openSession(true);
		try {
			return session.delete("users.deleteUser", id);
		} finally {
			session.close();
		}
	}
	
	
}
