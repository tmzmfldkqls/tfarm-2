package com.tfarm.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tfarm.board.model.ReboardDto;
import com.tfarm.board.service.ReboardService;
import com.tfarm.common.service.CommonService;
import com.tfarm.member.model.MemberDto;
import com.tfarm.util.BoardConstance;
import com.tfarm.util.PageNavigation;

@Controller
@RequestMapping("/reboard")
public class ReboardController {

	@Autowired
	private ReboardService reboardService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("/list.tfarm")
	public ModelAndView list(@RequestParam Map<String, String> map, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String category = commonService.getCategory(Integer.parseInt(map.get("bcode")));
		List<ReboardDto> list = reboardService.listArticle(map);
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
		mav.setViewName("/WEB-INF/reboard/list");
		return mav;
	}
	
	@RequestMapping(value="/write.tfarm", method=RequestMethod.GET)
	public ModelAndView write(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		String category = commonService.getCategory(Integer.parseInt(map.get("bcode")));
		mav.addObject("category", category);
		mav.addObject("querystring", map);
		mav.setViewName("/WEB-INF/reboard/write");
		return mav;
	}
	
	@RequestMapping(value="/write.tfarm", method=RequestMethod.POST)
	public ModelAndView write(ReboardDto reboardDto, 
			@RequestParam Map<String, String> map,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
//		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
//		if(memberDto != null) {
			int seq = commonService.getNextSeq();
			reboardDto.setSeq(seq);
			reboardDto.setId("memberDto.getId()");
			reboardDto.setEmail("memberDto.getEmail1() @ memberDto.getEmail2()");
			reboardDto.setRef(seq);
			int cnt = reboardService.writeArticle(reboardDto);
			mav.addObject("querystring", map);
			mav.addObject("seq", seq);
			if(cnt!=0){	
				mav.setViewName("/WEB-INF/reboard/writeok");
			}else{
				mav.setViewName("/WEB-INF/reboard/writefail");
			}
//		} else {
//			mav.setViewName("/login/login");
//		}
		return mav;
	}
	
	@RequestMapping(value="/view.tfarm", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam Map<String, String> map,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String category = commonService.getCategory(Integer.parseInt(map.get("bcode")));
//		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
//		if(memberDto != null) {
			int seq = Integer.parseInt(map.get("seq"));
			ReboardDto reboardDto = reboardService.viewArticle(seq);
			
			mav.addObject("querystring", map);
			mav.addObject("article", reboardDto);
			mav.addObject("category", category);
			mav.setViewName("/WEB-INF/reboard/view");
//		} else {
//			mav.setViewName("/login/login");
//		}
		return mav;
	}
	
	@RequestMapping(value="/reply.tfarm", method=RequestMethod.GET)
	public ModelAndView reply(@RequestParam Map<String, String> map,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
//		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
//		if(memberDto != null) {
			int seq = Integer.parseInt(map.get("seq"));
			ReboardDto reboardDto = reboardService.viewArticle(seq);
			System.out.println("lev==="+reboardDto.getLev());
			mav.addObject("querystring", map);
			mav.addObject("article", reboardDto);
			mav.setViewName("/WEB-INF/reboard/reply");
//		} else {
//			mav.setViewName("/login/login");
//		}
		return mav;
	}
	
	@RequestMapping(value="/reply.tfarm", method=RequestMethod.POST)
	public ModelAndView reply(ReboardDto reboardDto, @RequestParam Map<String, String> map,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
//		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
//		if(memberDto != null) {
			int seq = commonService.getNextSeq();
			reboardDto.setSeq(seq);
			reboardDto.setId("memberDto.getId()");
			reboardDto.setEmail("memberDto.getEmail1() + @ + memberDto.getEmail2()");
			int cnt = reboardService.replyArticle(reboardDto);
			mav.addObject("querystring", map);
			mav.addObject("seq", seq);
			
			if(cnt!=0){
				mav.setViewName("/WEB-INF/reboard/writeok");
			}else{
				mav.setViewName("/WEB-INF/reboard/writefail");
			}
//		} else {
//			mav.setViewName("/login/login");
//		}
		return mav;
	}
}










