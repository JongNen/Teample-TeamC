package repository;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Dao {
	protected static SqlSessionFactory factory;

	static {
			System.out.println("DAO. static initializer");
		try {

			factory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis/config.xml"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
