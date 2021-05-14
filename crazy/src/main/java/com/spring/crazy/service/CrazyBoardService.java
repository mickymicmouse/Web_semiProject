package com.spring.crazy.service;

import java.util.List;

import com.spring.crazy.model.CrazyBoardVO;

public interface CrazyBoardService {
	
	public List<CrazyBoardVO> crazyList(int start, int end) throws Exception;

	public int crazyboardarticle() throws Exception;
	
	public void crazywrite(CrazyBoardVO vo) throws Exception;
	
	public CrazyBoardVO crazyboardread(int bno) throws Exception;
	
	public void crazyboardupdate(CrazyBoardVO vo) throws Exception;
	
	public void crazydelete(int bno) throws Exception;
}
