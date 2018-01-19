package com.tfarm.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tfarm.member.model.MemberDetailDto;
import com.tfarm.member.model.MemberDto;
import com.tfarm.member.model.ZipDto;
import com.tfarm.member.model.service.MemberService;
import com.tfarm.util.StringEncoder;

import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

@Controller
@RequestMapping("/user")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/join.tfarm", method=RequestMethod.GET)
	public String join() {
		return "redirect:/join/join.jsp";
	}
	
	@RequestMapping(value="/join.tfarm", method=RequestMethod.POST)
	public ModelAndView join(MemberDetailDto memberDetailDto) {
		ModelAndView mav = new ModelAndView();
		int cnt = memberService.registerMember(memberDetailDto);
		String viewName = "/index";
		if(cnt != 0) {
			mav.addObject("registerinfo", memberDetailDto);
			viewName = "/WEB-INF/join/registerok";
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/jusopopup.tfarm")
	public String jusoPopup() {
		return "redirect:/join/jusoPopup.jsp";
	}
	
	@RequestMapping(value="/home.tfarm")
	public String home() {
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="/pwcheck.tfarm")
	public String confirmpass() {
		return "redirect:/join/confirmpass.jsp";
	}
	
	@RequestMapping(value="/mypage.tfarm")
	public String mypage(@RequestParam(value="mem_id", required=true) String id, 
			@RequestParam(value="mem_pw", required=true) String pass) {
		System.out.println("마이페이지:"+ id + "  "+ pass);
		int cnt = memberService.pwCheck(id, pass);
		String mv = "/join/confirmpass.jsp";
		if(cnt !=0) {
			mv = "/mypage.jsp";
		}
		return "redirect:"+mv;
	}
	
	
	@RequestMapping(value="/login.tfarm", method=RequestMethod.GET)
	public String login() {
		return "redirect:/login/login.jsp";
	}
	
	@RequestMapping(value="/login.tfarm", method=RequestMethod.POST)
	public String login(@RequestParam(value="mem_id", required=true) String id,
			@RequestParam(value="mem_pw", required=true) String pass, HttpServletRequest request, HttpSession session) {
		String url = request.getHeader("referer");
		MemberDetailDto memberdetailDto = memberService.login(id, pass);
		session.setAttribute("userInfo", memberdetailDto);
		if(url.contains("login.jsp")) {
			url = "/index.jsp";
		}
		System.out.println("로그인 됬냐"+url);
		return "redirect:"+url;
	}
	
	@RequestMapping("/logout.tfarm")
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		return "redirect:/index.jsp";
	}
//	
//	@RequestMapping("/memberout.kitri")
//	public String memberout(HttpSession session) {
//		String id = ((MemberDto) session.getAttribute("userInfo")).getId();
//		memberService.deleteMember(id);
//		session.removeAttribute("userInfo");
//		return "redirect:/index.jsp";
//	}
//	
	@RequestMapping("/idcheck.tfarm")
	public @ResponseBody String idCheck(@RequestParam("sid") String sid) {
		int cnt = memberService.idCheck(sid);
		System.out.println("아이디 갯수 : " + cnt);
		JSONObject json = new JSONObject();
		json.put("idcount", cnt);
		json.put("sid", sid);
		return json.toJSONString();//{idcount : 0, sid : java2} << json
	}

//	@RequestMapping(value="/zipsearch.kitri",method=RequestMethod.GET)
//	public String zipSearch() {
//		return "redirect:/join/zipsearch.jsp";
//	}
//	
//	@RequestMapping(value="/zipsearch.kitri",method=RequestMethod.POST)
//	public @ResponseBody String zipSearch(@RequestParam("sdong") String sdong) {
//		System.out.println("검색동 : " + sdong);
//		List<ZipDto> list = memberService.zipSearch(sdong);
//		System.out.println("검색 갯수 : " + list.size());
//		JSONObject json = new JSONObject();
//		JSONArray jarray = new JSONArray();//[]
//		//[
//		//	{"zip1" : 123, "zip2" : 567, "sido" : "서울", "gugun" : "구로"}, 
//		//	{}, 
//		//	{}
//		//]
//		for(ZipDto zipDto : list) {
//			JSONObject zip = new JSONObject();//ZipDto
//			zip.put("zip1", zipDto.getZip1());
//			zip.put("zip2", zipDto.getZip2());
//			zip.put("sido", StringEncoder.urlUtf(zipDto.getSido()));
//			zip.put("gugun", StringEncoder.urlUtf(zipDto.getGugun()));
//			zip.put("dong", StringEncoder.urlUtf(zipDto.getDong()).replaceAll("\\+", "%20"));
//			zip.put("bunji", StringEncoder.urlUtf(zipDto.getBunji()).replaceAll("\\+", "%20"));
//			
//			jarray.add(zip);
//		}
//		//{"zlist" : [
//		//				{"zip1" : 123, "zip2" : 567, "sido" : "서울", "gugun" : "구로"}, 
//		//				{}, 
//		//				{}
//		//			 ]
//		//}
//		json.put("zlist", jarray);
//		System.out.println(json.toJSONString());
//		return json.toJSONString();
//	}
}















