package com.spring.crazy.service;

import javax.servlet.http.HttpSession;
import com.spring.crazy.model.CrazyMemberVO;

public interface CrazyLoginService {

	public String loginpros(CrazyMemberVO vo, HttpSession session) throws Exception;
	
	public void logout(HttpSession session) throws Exception;
	
	public void register(CrazyMemberVO vo) throws Exception;
	
	public int idchk(CrazyMemberVO vo) throws Exception;
}
