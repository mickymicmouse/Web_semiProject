package com.spring.crazy.dao;

import javax.servlet.http.HttpSession;

import com.spring.crazy.model.CrazyMemberVO;

public interface CrazyLoginDAO {
	public String loginpros(CrazyMemberVO vo) throws Exception;
	
	public void logout(HttpSession session) throws Exception;
	
	public void register(CrazyMemberVO vo) throws Exception;
	
	public int idchk(CrazyMemberVO vo) throws Exception;
}
