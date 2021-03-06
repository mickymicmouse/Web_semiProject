package com.spring.crazy.serviceImpl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.crazy.dao.CrazyBoardDAO;
import com.spring.crazy.model.CrazyBoardVO;
import com.spring.crazy.service.CrazyBoardService;

@Service
public class CrazyBoardServiceImpl implements CrazyBoardService {
	
	@Inject
	CrazyBoardDAO dao;
	
	@Override
	public List<CrazyBoardVO> crazyList(int start, int end) throws Exception {
		// TODO Auto-generated method stub
		return dao.crazyList(start, end);
	}

	@Override
	public int crazyboardarticle() throws Exception {
		// TODO Auto-generated method stub
		return dao.crazyboardarticle();
	}

	@Override
	public void crazywrite(CrazyBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.crazywrite(vo);
	}

	@Override
	public CrazyBoardVO crazyboardread(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.crazyboardview(bno);
	}

	@Override
	public void crazyboardupdate(CrazyBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.crazyupdate(vo);
	}

	@Override
	public void crazydelete(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.crazydelete(bno);
	}
	
	

}
