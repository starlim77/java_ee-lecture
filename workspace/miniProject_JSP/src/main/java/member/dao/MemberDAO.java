package member.dao;

import java.io.IOException;

import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	
	private static MemberDAO memberDAO = new MemberDAO();
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	private SqlSessionFactory sqlSessionFactory;
	
	public MemberDAO() {
		try {
			//추상클래스 Reader
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int memberWrite(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
	    int su = sqlSession.insert("memberSQL.write", memberDTO);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}
	
	public MemberDTO memberLogin(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String name = null;
		
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberLogin", map);
		sqlSession.close();
		return memberDTO;
	}
	
	public boolean isExistId(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		boolean exist = true;
		String chechedId=null;
		chechedId = sqlSession.selectOne("memberSQL.isExistId", id);
		if(chechedId==null) exist=false;
		sqlSession.close();
		return exist;
	}
	
}