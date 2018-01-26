package com.tfarm.admin.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.tfarm.admin.board.model.TargetDto;
import com.tfarm.admin.board.service.BoardAdminService;
import com.tfarm.member.model.MemberDetailDto;
import com.tfarm.util.StringEncoder;

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
	
	@RequestMapping(value="/memberlist.tfarm")	
	public @ResponseBody String memberList(@RequestParam Map<String, String> map) {			
		List<MemberDetailDto> memberList = boardAdminService.memberList(map);
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		
		for(MemberDetailDto member : memberList) {
			JSONObject js = new JSONObject();
			js.put("memail",member.getMem_email1() + "@" + member.getMem_email2());
			js.put("mid",member.getMem_id());
			if(member.getMem_state() == 0){
				js.put("mstate", StringEncoder.urlUtf("일반회원"));
			}
			else if(member.getMem_state() == 1){
				js.put("mstate", StringEncoder.urlUtf("관리자"));
			}
			else {
				js.put("mstate", StringEncoder.urlUtf("블랙리스트"));
				}
			
			js.put("mno", member.getMem_no());
			js.put("joindate", member.getMem_join_date());
			
			//이름 인코딩
			js.put("mname", StringEncoder.urlUtf(member.getMem_name()).replaceAll("\\+", "%20"));
			js.put("mbirth", member.getMem_birth());
			js.put("mtel", member.getMem_tel1() + "-" + member.getMem_tel2() + "-" + member.getMem_tel3());
			
			//주소 인코딩	
			String address = member.getMem_address1() + " " + member.getMem_address2();			
			js.put("maddress", (StringEncoder.urlUtf(address).replaceAll("\\+", "%20")).replaceAll("null", "%20"));
			jarray.add(js);
		}		
		json.put("memberList", jarray);
		return json.toJSONString(); 		
	}	
	
	@RequestMapping(value="/memberDelete.tfarm", method=RequestMethod.GET)
	public ModelAndView memberDelete(@RequestParam("targetMno") String targetMno) {
		 ModelAndView mav = new ModelAndView();
		 String[] strArray = targetMno.split(","); 
		 
		 int[] amno = new int[strArray.length];
		 for(int i=0;i<strArray.length;i++)
			 amno[i] = Integer.parseInt(strArray[i]);
		if(boardAdminService.memberDelete(amno) == 1)
			 mav.setViewName("/admin/admin_main");
		else
			 mav.setViewName("/error/error404");//임시로 404 띄울 거임
		return mav;
	}
	
	@RequestMapping(value="/basicInfo.tfarm")
	public @ResponseBody String basicInfo(HttpServletRequest request) {
		
		Map<String, Integer> basicInfo = boardAdminService.basicInfo();
		JSONObject json = new JSONObject();	
		
		json.put("totalmember", basicInfo.get("totalmember"));
		json.put("totalacticle",  basicInfo.get("totalacticle"));
		json.put("totalmemo",  basicInfo.get("totalmemo"));
		
		return json.toJSONString(); 		
	}
	
	@RequestMapping(value="/articlegragh.tfarm", method=RequestMethod.POST)
	public @ResponseBody String gragh(HttpServletRequest request) {
		List<TargetDto> targets = boardAdminService.wholeArticle();
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		//일자별 아티클 개수
		for(TargetDto target : targets) {
			JSONObject js = new JSONObject();
			js.put("rownum",target.getRownum());
			js.put("logtime",StringEncoder.urlUtf(target.getLogtime() + "일"));
			System.out.println(target.getLogtime());
			js.put("count",target.getTarget());
			
			jarray.add(js);
		}		
		json.put("wholeArticleSet", jarray);

		return json.toString(); 	
	}
}
