package com.tfarm.main.controller;

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

import com.tfarm.board.model.BoardDto;
import com.tfarm.board.model.TicketDto;
import com.tfarm.board.service.MainService;
import com.tfarm.common.service.CommonService;
import com.tfarm.util.BoardConstance;
import com.tfarm.util.PageNavigation;
import com.tfarm.util.StringEncoder;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value="totallist.tfarm")
	public @ResponseBody String totallist(){
		List<BoardDto> blist = mainService.boardlist();
//		List<TicketDto> tlist = mainService.ticketlist();
//		List<BoardDto> nlist = mainService.noticelist();
		
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		for(BoardDto boardDto : blist){
			JSONObject board = new JSONObject();
			board.put("subject", StringEncoder.urlUtf(boardDto.getSubject()).replaceAll("\\+", "%20"));
			board.put("id", boardDto.getId());
			board.put("hit", boardDto.getHit());
			board.put("seq", boardDto.getSeq());
			board.put("bcode",boardDto.getBcode());
						
			jarray.add(board);
		}
		
		json.put("blist", jarray);
		System.out.println(json.toJSONString());
		return json.toJSONString();
	}
	
	@RequestMapping(value="totallist1.tfarm")
	public @ResponseBody String totallist1(){
//		List<BoardDto> blist = mainService.boardlist();
//		List<TicketDto> tlist = mainService.ticketlist();
		List<BoardDto> nlist = mainService.noticelist();
		
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		for(BoardDto boardDto : nlist){
			JSONObject board = new JSONObject();
			board.put("subject", StringEncoder.urlUtf(boardDto.getSubject()).replaceAll("\\+", "%20"));
			board.put("id", boardDto.getId());
			board.put("hit", boardDto.getHit());
			board.put("seq", boardDto.getSeq());
			board.put("bcode",boardDto.getBcode());
						
			jarray.add(board);
		}
		
		json.put("nlist", jarray);
		System.out.println(json.toJSONString());
		return json.toJSONString();
	}
	
	@RequestMapping(value="totallist2.tfarm")
	public @ResponseBody String totallist2(){
//		List<BoardDto> blist = mainService.boardlist();
		List<TicketDto> tlist = mainService.ticketlist();
//		List<BoardDto> nlist = mainService.noticelist();
		
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		for(TicketDto ticketDto : tlist){
			JSONObject ticket = new JSONObject();
			ticket.put("subject", StringEncoder.urlUtf(ticketDto.getSubject()).replaceAll("\\+", "%20"));
			ticket.put("id", ticketDto.getId());
			ticket.put("hit", ticketDto.getHit());
			ticket.put("seq", ticketDto.getSeq());
			ticket.put("bcode",ticketDto.getBcode());
						
			jarray.add(ticket);
		}
		
		json.put("tlist", jarray);
		System.out.println(json.toJSONString());
		return json.toJSONString();
	}
		
}
