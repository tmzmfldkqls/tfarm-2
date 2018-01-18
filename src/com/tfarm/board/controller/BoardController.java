package com.tfarm.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tfarm.member.model.MemberDetailDto;
import com.tfarm.member.model.MemberDto;
import com.tfarm.admin.board.model.BoardListDto;
import com.tfarm.admin.board.service.BoardAdminService;
import com.tfarm.board.model.BoardDto;
import com.tfarm.board.model.ReboardDto;
import com.tfarm.board.service.BoardService;
import com.tfarm.common.service.CommonService;
import com.tfarm.util.BoardConstance;
import com.tfarm.util.PageNavigation;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private BoardAdminService boardAdminService;

	@Autowired
	private CommonService commonService;

	@RequestMapping("/boardmenu.tfarm")
	public String boardMenu(HttpServletRequest request) {
		List<BoardListDto> list = boardAdminService.boardMenu();
		System.out.println("갯수 : " + list.size());
		ServletContext context = request.getServletContext();
		context.setAttribute("boardmenu", list);
		return "redirect:/index.jsp";
	}

	@RequestMapping(value = "/list.tfarm", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam Map<String, String> map, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String category = commonService.getCategory(Integer.parseInt(map.get("bcode")));
		List<ReboardDto> list = boardService.listArticle(map);
		map.put("listsize", BoardConstance.BOARD_LIST_SIZE + "");
		PageNavigation navigation = commonService.makePageNavigation(map);
		navigation.setRoot(request.getContextPath());
		navigation.setBcode(Integer.parseInt(map.get("bcode")));
		navigation.setKey(map.get("key"));
		navigation.setWord(map.get("word"));
		navigation.setNavigator();
		mav.addObject("articlelist", list);
		mav.addObject("navigator", navigation);
		mav.addObject("querystring", map);
		mav.addObject("category", category);
		mav.setViewName("/WEB-INF/notice/list");
		return mav;
	}

	@RequestMapping(value = "/write.tfarm", method = RequestMethod.GET)
	public ModelAndView write(@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String category = commonService.getCategory(Integer.parseInt(map.get("bcode")));
		mav.addObject("querystring", map);
		mav.addObject("category", category);
		mav.setViewName("/WEB-INF/notice/write");
		return mav;
	}

	@RequestMapping(value = "/write.tfarm", method = RequestMethod.POST)
	public ModelAndView write(ReboardDto reboardDto, @RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto)session.getAttribute("userInfo");
		int seq = commonService.getNextSeq();
		reboardDto.setSeq(seq);
		reboardDto.setId("admin");
		reboardDto.setEmail("admin@tfarm.com");
		int cnt = boardService.writeArticle(reboardDto);
		System.out.println(cnt);
		mav.addObject("querystring", map);
		mav.addObject("seq", seq);
		if (cnt != 0) {
			mav.setViewName("/WEB-INF/notice/writeok");
		} else {
			mav.setViewName("/WEB-INF/notice/writefail");
		}

		return mav;
	}
	
	@RequestMapping(value="/view.tfarm", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam Map<String, String> map,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int seq = Integer.parseInt(map.get("seq"));
		String category = commonService.getCategory(Integer.parseInt(map.get("bcode")));
		System.out.println(category);
		BoardDto boardDto = boardService.viewArticle(seq);
		mav.addObject("querystring", map);
		mav.addObject("article", boardDto);
		mav.addObject("category", category);
		mav.setViewName("/WEB-INF/notice/view");
		
		return mav;
	}
}
