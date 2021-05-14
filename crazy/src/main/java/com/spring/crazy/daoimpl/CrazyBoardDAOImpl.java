package com.spring.crazy.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.crazy.dao.CrazyBoardDAO;
import com.spring.crazy.model.CrazyBoardVO;

@Repository
public class CrazyBoardDAOImpl implements CrazyBoardDAO {

	@Inject
	SqlSession session;
	
	
	@Override
	public List<CrazyBoardVO> crazyList(int start, int end) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("crazy.crazyList", map);
	}


	@Override
	public int crazyboardarticle() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("crazy.crazyboardarticle");
	}


	@Override
	public void crazywrite(CrazyBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert("crazy.crazywrite",vo);
	}


	@Override
	public CrazyBoardVO crazyboardview(int bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("crazy.crazyboardview", bno);
	}


	@Override
	public void crazyupdate(CrazyBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update("crazy.crazyboardupdate", vo);
	}


	@Override
	public void crazydelete(int bno) throws Exception {
		// TODO Auto-generated method stub
		session.delete("crazy.boarddelete",bno);
	}

}
