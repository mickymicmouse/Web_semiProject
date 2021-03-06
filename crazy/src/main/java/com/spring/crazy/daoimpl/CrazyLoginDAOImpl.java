package com.spring.crazy.daoimpl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;
import com.spring.crazy.dao.CrazyLoginDAO;
import com.spring.crazy.model.CrazyMemberVO;

@Repository
public class CrazyLoginDAOImpl implements CrazyLoginDAO {

	@Inject
	SqlSession session;
	
	@Override
	public String loginpros(CrazyMemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("crazy.logincheck", vo);
	}

	@Override
	public void logout(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void register(CrazyMemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert("crazy.register",vo);
		
	}

	@Override
	public int idchk(CrazyMemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		int result = session.selectOne("crazy.idchk",vo);
		return result;
	}

}
