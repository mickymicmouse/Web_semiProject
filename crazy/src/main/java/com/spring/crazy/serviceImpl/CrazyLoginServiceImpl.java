package com.spring.crazy.serviceImpl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.spring.crazy.dao.CrazyLoginDAO;
import com.spring.crazy.model.CrazyMemberVO;
import com.spring.crazy.service.CrazyLoginService;

@Service
public class CrazyLoginServiceImpl implements CrazyLoginService {

	@Inject
	CrazyLoginDAO dao;

	@Override
	public String loginpros(CrazyMemberVO vo, HttpSession session) throws Exception {
		// TODO Auto-generated method stub

		String status = dao.loginpros(vo);
		if (status == null) {
			return null;
		} else {
			session.setAttribute("status", status);
			session.setAttribute("userid", vo.getUserid());
			return status;
		}
	}

	@Override
	public void logout(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		session.invalidate();
	}

	@Override
	public void register(CrazyMemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.register(vo);
	}

	@Override
	public int idchk(CrazyMemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		int result = dao.idchk(vo);
		return result;
	}
}
