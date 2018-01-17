package com.tfarm.board.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	
	@RequestMapping("/notice.tfarm")
	public String login() {
		System.out.println("티팜");
		return "redirect:/login/login.jsp";
	}
}
