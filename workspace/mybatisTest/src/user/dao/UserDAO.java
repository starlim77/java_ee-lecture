package user.dao;

import java.io.IOException;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	//인터페이스
	private SqlSessionFactory sqlSessionFactory;
	private static UserDAO userDAO = new UserDAO();
	
	public static UserDAO getInstanse() {
		return userDAO;
	}
	
	public UserDAO() {
		//환경설정 파일을 읽어온다.
		try {
			//추상클래스 Reader
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void write(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		sqlSession.insert("userSQL.write", userDTO);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public List<UserDTO> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		List<UserDTO> list = sqlSession.selectList("userSQL.getList");
		sqlSession.close();
		return list;
	}
	
	public UserDTO getUser(String id) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
	 	UserDTO userDTO = sqlSession.selectOne("userSQL.getUser", id);
		sqlSession.close();
		return userDTO;
	}

	public int update(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.update("userSQL.update", map);
		sqlSession.commit();
		sqlSession.close();
		
		
		return su;
	}

	public int delete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.delete("userSQL.delete", id);
		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}

	public List<UserDTO> search(int num, String search) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String order=null;
		if(num==1) {
			order="name";
		}
		else {
			order="id";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("order", order);
		map.put("search", search);
		List<UserDTO> list = sqlSession.selectList("userSQL.search", map);
		sqlSession.close();
		
		return list;
	}
	
	
	
}