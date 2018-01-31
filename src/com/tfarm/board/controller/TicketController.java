package com.tfarm.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tfarm.board.model.BoardDto;
import com.tfarm.board.model.ReboardDto;
import com.tfarm.board.model.TicketDto;
import com.tfarm.board.service.TicketService;
import com.tfarm.common.service.CommonService;
import com.tfarm.member.model.MemberDetailDto;
import com.tfarm.member.model.MemberDto;
import com.tfarm.util.BoardConstance;
import com.tfarm.util.PageNavigation;


@Controller
@RequestMapping("/ticket")
public class TicketController {
	
	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private CommonService commonService;
	
	//주입하자 common-application.xml
		private String upFolder;
		
		public TicketController() {
			this.upFolder = "C:\\javadata\\workspace\\framework\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\tfarm\\upload";
		}
		
		@RequestMapping("/list.tfarm")
		public ModelAndView list(@RequestParam Map<String, String> map, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			List<TicketDto> list = ticketService.listArticle(map);
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
			mav.setViewName("/WEB-INF/ticketboard/list");
			return mav;
		}
	
		@RequestMapping(value="/view.tfarm", method=RequestMethod.GET)
		public ModelAndView view(@RequestParam Map<String, String> map,
				HttpSession session) {
			ModelAndView mav = new ModelAndView();
			MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
			if(memberDto != null) {
				int seq = Integer.parseInt(map.get("seq"));
				TicketDto ticketDto = ticketService.viewArticle(seq);
				mav.addObject("querystring", map);
				mav.addObject("article", ticketDto);
				mav.setViewName("/WEB-INF/ticketboard/view");
			} else {
				mav.setViewName("/login/login");
			}
			return mav;
		}
	@RequestMapping(value ="/write.tfarm", method = RequestMethod.GET)
	public ModelAndView write(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		String category = commonService.getCategory(Integer.parseInt(map.get("bcode")));
		mav.addObject("category", category);
		mav.addObject("querystring", map);
		mav.setViewName("/WEB-INF/ticketboard/write");
		return mav;
	}

	@RequestMapping(value="/write.tfarm",method = RequestMethod.POST)
	public ModelAndView write(TicketDto ticketDto, 
			@RequestParam Map<String, String> map,
			HttpSession session) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		MemberDetailDto memberDetailDto = (MemberDetailDto) session.getAttribute("userInfo");
		if(memberDetailDto != null) {
			int seq = commonService.getNextSeq();
			ticketDto.setSeq(seq);
			ticketDto.setId(memberDetailDto.getMem_id());
			String email =memberDetailDto.getMem_email1() +"@"+ memberDetailDto.getMem_email2();
			ticketDto.setEmail(email);
			//여기서부터 해서
			DateFormat df = new SimpleDateFormat("yyMMdd");
			String saveFolder = df.format(new Date());
			String uploadPath = upFolder + File.separator + saveFolder;
			File folder = new File(uploadPath);
			if(!folder.exists())
				folder.mkdirs();
			ticketDto.setSavefolder(saveFolder);

			//저장할 폴더 만들어짐.
			
			//리스트로 저장할 파일 얻어오기
			List<MultipartFile> list = ticketDto.getUpfile();
			for (MultipartFile multipartFile : list) {
				if(!multipartFile.isEmpty()){
					String ofile = multipartFile.getOriginalFilename();
					ticketDto.setOrign_picture(ofile);//파일이름
					String savePicture = UUID.randomUUID().toString() + ofile.substring(ofile.lastIndexOf("."));//이걸 파일의 이름으로 하자.
					//UUID = 고유 번호
					ticketDto.setSave_picture(savePicture);// 그이름을 여기에 저장하자.
					multipartFile.transferTo(new File(uploadPath, savePicture));
				}
			}
			
			int cnt = ticketService.writeArticle(ticketDto);
			System.out.println("TicketController" + cnt);
			mav.addObject("querystring", map);
			mav.addObject("seq", seq);
			mav.setViewName("/WEB-INF/ticketboard/writeok");
		} else {
			mav.setViewName("/WEB-INF/ticketboard/writefail");
		}
		return mav;
	}
	
	@RequestMapping(value="/modify.tfarm", method=RequestMethod.GET)
	public ModelAndView modify(@RequestParam Map<String,String> map){
		ModelAndView mav = new ModelAndView();
		String category = commonService.getCategory(Integer.parseInt(map.get("bcode")));
		System.out.println("ticketcon" + category);
		int seq = Integer.parseInt(map.get("seq"));
		System.out.println("수정할 Seq==="+seq);
		TicketDto ticketDto = ticketService.viewArticle(seq);
		mav.addObject("querystring", map);
		mav.addObject("article", ticketDto);
		mav.addObject("category", category);
		mav.setViewName("/WEB-INF/ticketboard/modify");
		return mav;
	}
	
	@RequestMapping(value = "/modify.tfarm", method = RequestMethod.POST)
	public ModelAndView modify(TicketDto ticketDto, @RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		int bcode = Integer.parseInt(map.get("bcode"));
		int seq = Integer.parseInt(map.get("seq"));
		int cnt = ticketService.modifyArticle(ticketDto);
		System.out.println(bcode);
		System.out.println(cnt);
		mav.addObject("querystring", map);
		mav.addObject("seq", seq);
		if (cnt != 0) {
			mav.setViewName("/WEB-INF/ticketboard/writeok");
		} else {
			mav.setViewName("/WEB-INF/ticketboard/writefail");
		}

		return mav;
	}
	

}
