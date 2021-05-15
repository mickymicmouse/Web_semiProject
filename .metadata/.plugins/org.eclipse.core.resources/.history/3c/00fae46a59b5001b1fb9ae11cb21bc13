package com.spring.crazy.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.crazy.model.CrazyMemberVO;
import com.spring.crazy.service.CrazyLoginService;

@Controller
public class LoginController {

	@Inject
	CrazyLoginService service;
	
	@RequestMapping(value = "/login.do")
	public String loginview() {
		return "login";
	}
	
	@RequestMapping(value = "/join.do")
	public String joinview() {
		return "join";
	}
	@ResponseBody
	@RequestMapping(value="/idchk", method=RequestMethod.POST)
	public int idchk(CrazyMemberVO vo) throws Exception{
		int result = service.idchk(vo);
		return result;
	}
	
	@RequestMapping(value="/logout.do")
	public ModelAndView logout(HttpSession session) throws Exception {
		service.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		mav.addObject("msg","logout");
		return mav;
	}
	
	@RequestMapping(value="/loginpro.do", method=RequestMethod.POST)
	public ModelAndView loginpros(@ModelAttribute CrazyMemberVO vo, HttpSession session) throws Exception {
		System.out.println(vo.getEmail());
		String status = service.loginpros(vo, session);
		ModelAndView mav = new ModelAndView();
		//로그인 실패
		if(status == null) {
			System.out.println("로그인 실패");
			mav.setViewName("login");
			mav.addObject("msg", "error");
		//사용자
		}else if (status.equals("1")){
			mav.setViewName("home");
		//관리자
		} else {
			mav.setViewName("home");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/crazyRegister.do", method=RequestMethod.POST)
	public ModelAndView postRegister(CrazyMemberVO vo) throws Exception{
		
		int result = service.idchk(vo);
		ModelAndView mav = new ModelAndView();
		try {
			if (result==1) {
				mav.setViewName("join");
				mav.addObject("msg", "error");
				return mav;
			}else if(result==0) {
				service.register(vo);
				mav.setViewName("login");
			}
			
		}catch(Exception e){
			throw new RuntimeException();
		}
		return mav;
		
	}
	
}
