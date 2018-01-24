package com.tfarm.admin.board.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tfarm.admin.board.model.BoardListDto;
import com.tfarm.admin.board.service.BoardAdminService;

@Controller
@RequestMapping("/boardadmin")
public class BoardAdminController {

	@Autowired
//	@Qualifier("BoardAdminService1")
	private BoardAdminService boardAdminService;

	@RequestMapping("/boardmenu.kitri")
	public String boardMenu(HttpServletRequest request) {
		List<BoardListDto> list = boardAdminService.boardMenu();
		System.out.println(" : " + list.size());
		ServletContext context = request.getServletContext();
		context.setAttribute("boardmenu", list);
		return "redirect:/index.jsp";
	}
	
}
