package com.spring.crazy.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value="/loginpro.do", method=RequestMethod.POST)
	public ModelAndView loginpros(@ModelAttribute CrazyMemberVO vo, HttpSession session) throws Exception {
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
			mav.setViewName("adminhome");
		}
		
		return mav;
	}
}
