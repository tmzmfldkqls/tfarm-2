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
import com.tfarm.board.model.ReboardDto;
import com.tfarm.board.service.BoardService;
import com.tfarm.common.service.CommonService;
import com.tfarm.member.model.MemberDetailDto;
import com.tfarm.util.BoardConstance;
import com.tfarm.util.PageNavigation;
import com.tfarm.util.StringEncoder;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private BoardService boardService;

	@Autowired
	private CommonService commonService;

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
				js.put("mstate", StringEncoder.urlUtf("차단"));
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
	
	@RequestMapping(value="/memberUpdate.tfarm", method=RequestMethod.GET)
	public void memberUpdate(@RequestParam("targetMno") int targetMno) {
		
		 boardAdminService.memberUpdate(targetMno);
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
	
	@RequestMapping(value="/totalgragh.tfarm", method=RequestMethod.GET)
	public @ResponseBody String totalgragh(@RequestParam("query") String query) {
		
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		List<TargetDto> targets = boardAdminService.graghBycondition(query);
		
		if("category".equals(query)){//카테고리 그래프	
			//카테고리 별 매핑
			Map<Integer , String > map = new HashMap(); 
			map.put(1, "공지사항");
			map.put(2, "FAQ");
			map.put(3, "Q&A");
			map.put(4, "뮤지컬");
			map.put(5, "콘서트");
			map.put(6, "연극");
			map.put(7, "클래식/무용");
			map.put(8, "스포츠/레저");
			map.put(9, "전시/행사");
			map.put(10, "아동가족");
			map.put(11, "신고게시판");
			map.put(12, "블랙리스트");
	
			for(TargetDto target : targets) {
				JSONObject js = new JSONObject();
				js.put("category",StringEncoder.urlUtf(map.get(target.getBcode())));
				js.put("count",target.getTarget());			
				jarray.add(js);
			}		
			json.put("CategorySet", jarray);
		}else if("member".equals(query)){
			for(TargetDto target : targets) {
				JSONObject js = new JSONObject();
				js.put("logtime",StringEncoder.urlUtf(target.getLogtime() + "일"));
				js.put("count",target.getTarget());			
				jarray.add(js);
			}
			json.put("MemberSet", jarray);
		}else if("article".equals(query)){
			//일자별 아티클 개수
			for(TargetDto target : targets) {
				JSONObject js = new JSONObject();
				js.put("rownum",target.getRownum());
				js.put("logtime",StringEncoder.urlUtf(target.getLogtime() + "일"));
				js.put("count",target.getTarget());			
				jarray.add(js);
			}		
			json.put("wholeArticleSet", jarray);
		}else{//메모일때	
			;
		}
		return json.toString(); 
	}
	
	@RequestMapping(value="/calimlist.tfarm", method=RequestMethod.GET)
	public @ResponseBody ModelAndView calimlist(@RequestParam("targetMno") String targetMno) {	
		ModelAndView mav = new ModelAndView();
		
//		String category = commonService.getCategory(Integer.parseInt(map.get("bcode")));
//		List<ReboardDto> list = boardService.listArticle(map);
//		map.put("listsize", BoardConstance.BOARD_LIST_SIZE + "");
//		PageNavigation navigation = commonService.makePageNavigation(map);
//		navigation.setRoot(request.getContextPath());
//		navigation.setBcode(Integer.parseInt(map.get("bcode")));
//		navigation.setKey(map.get("key"));
//		navigation.setWord(map.get("word"));
//		navigation.setNavigator();
//		mav.addObject("articlelist", list);
//		mav.addObject("navigator", navigation);
//		mav.addObject("querystring", map);
//		mav.addObject("category", category);
//		mav.setViewName("/WEB-INF/notice/list");
		return mav;
	}
	
	
}
