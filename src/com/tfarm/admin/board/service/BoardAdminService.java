package com.tfarm.admin.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tfarm.admin.board.model.BoardListDto;
import com.tfarm.admin.board.model.TargetDto;
import com.tfarm.member.model.MemberDetailDto;
import com.tfarm.member.model.MemberDto;

public interface BoardAdminService {

	List<BoardListDto> boardMenu();

	List<MemberDetailDto> memberList(Map<String, String> map);

	int memberDelete(int[] amno);
	
	Map<String, Integer>basicInfo();
	List<TargetDto>wholeArticle();

	List<TargetDto> graghBycondition(String query);
}
