package com.tfarm.admin.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tfarm.admin.board.service.BoardAdminService;
import com.tfarm.member.model.MemberDetailDto;
import com.tfarm.member.model.MemberDto;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
//	@Qualifier("BoardAdminService1")
	private BoardAdminService boardAdminService;

	@RequestMapping(value="/adminpage.tfarm")
	public ModelAndView adminpage(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/admin_main");
		return mav;
	}
	
	@RequestMapping(value="/memberlist.tfarm", method=RequestMethod.GET)
	public @ResponseBody String memberList(@RequestParam("word") String word , @RequestParam("key") String key) {		
		
		List<MemberDetailDto> memberList = boardAdminService.memberList();
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		for(MemberDetailDto member : memberList) {
			JSONObject js = new JSONObject();
			js.put("memail1",member.getMem_email1());
			js.put("memail2",member.getMem_email2());
			js.put("mid",member.getMem_id());
			js.put("mstate", member.getMem_state());
			js.put("mno", member.getMem_no());
			js.put("joindate", member.getMem_join_date());
			jarray.add(js);
		}		
		json.put("memberList", jarray);

		return json.toString();
	}	
}
