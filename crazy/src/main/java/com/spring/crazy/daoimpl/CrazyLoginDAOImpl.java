package com.spring.crazy.daoimpl;

import javax.inject.Inject;

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

}
