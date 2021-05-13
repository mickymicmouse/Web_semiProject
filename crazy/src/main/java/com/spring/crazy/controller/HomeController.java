package com.spring.crazy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class HomeController {
		
	@RequestMapping(value = "/home.do")
	public String homeview() {
		return "home";
	}
	
}