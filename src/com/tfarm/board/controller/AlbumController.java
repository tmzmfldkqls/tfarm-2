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

import com.tfarm.board.model.TicketDto;
import com.tfarm.board.model.ReboardDto;
import com.tfarm.board.service.AlbumService;
import com.tfarm.common.service.CommonService;
import com.tfarm.member.model.MemberDto;
import com.tfarm.util.BoardConstance;
import com.tfarm.util.PageNavigation;

@Controller
@RequestMapping("/album")
public class AlbumController {

	@Autowired
	private CommonService commonService;
	
	@Autowired
	private AlbumService albumService;
	
	private String upFolder;
	
	public AlbumController() {
		this.upFolder = "D:\\javadate\\workspace\\framework\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kitricafe\\upload";
	}

//	@RequestMapping("/list.kitri")
//	public ModelAndView list(@RequestParam Map<String, String> map, HttpServletRequest request) {
//		ModelAndView mav = new ModelAndView();
//		List<TicketDto> list = albumService.listArticle(map);
//		map.put("listsize", BoardConstance.ALBUM_LIST_SIZE + "");
//		PageNavigation navigation = commonService.makePageNavigation(map);
//		navigation.setRoot(request.getContextPath());
//		navigation.setBcode(Integer.parseInt(map.get("bcode")));
//		navigation.setKey(map.get("key"));
//		navigation.setWord(map.get("word"));
//		navigation.setNavigator();
//		mav.addObject("articlelist", list);
//		mav.addObject("navigator", navigation);
//		mav.addObject("querystring", map);
//		mav.setViewName("/WEB-INF/album/list");
//		return mav;
//	}
//	
//	@RequestMapping(value="/write.kitri", method=RequestMethod.GET)
//	public ModelAndView write(@RequestParam Map<String, String> map) {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("querystring", map);
//		mav.setViewName("/WEB-INF/album/write");
//		return mav;
//	}
//	
//	@RequestMapping(value="/write.kitri", method=RequestMethod.POST)
//	public ModelAndView write(TicketDto albumDto, 
//			@RequestParam Map<String, String> map,
//			HttpSession session) throws IllegalStateException, IOException {
//		ModelAndView mav = new ModelAndView();
//		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
//		if(memberDto != null) {
//			int seq = commonService.getNextSeq();
//			albumDto.setSeq(seq);
//			albumDto.setId(memberDto.getId());
//			albumDto.setName(memberDto.getName());
//			albumDto.setEmail(memberDto.getEmail1() + "@" + memberDto.getEmail2());
//			
//			DateFormat df = new SimpleDateFormat("yymmdd");
//			String saveFolder = df.format(new Date());
//			String uploadPath = upFolder + File.separator + saveFolder;
//			File folder = new File(uploadPath);
//			if(!folder.exists()) {
//				folder.mkdirs();
//			}
//			albumDto.setSaveFolder(saveFolder);
//			List<MultipartFile> list = albumDto.getUpfile();
//			for (MultipartFile multipartFile : list) {
//				if(!multipartFile.isEmpty()) {
//					String ofile = multipartFile.getOriginalFilename();
//					albumDto.setOriginPicture(ofile);
//					String savePicture = UUID.randomUUID().toString() + ofile.substring(ofile.lastIndexOf("."));
//					albumDto.setSavePicture(savePicture);
//					multipartFile.transferTo(new File(uploadPath, savePicture));
//				}
//			} 
//
//			int cnt = albumService.writeArticle(albumDto);
//			mav.addObject("querystring", map);
//			mav.addObject("seq", seq);
//			mav.setViewName("/WEB-INF/album/writeOk");
//		} else {
//			mav.setViewName("/login/login");
//		}
//		return mav;
//	}
}