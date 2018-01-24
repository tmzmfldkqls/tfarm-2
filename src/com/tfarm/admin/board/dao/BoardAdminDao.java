package com.tfarm.admin.board.dao;

import java.util.List;
import java.util.Map;

import com.tfarm.admin.board.model.BoardListDto;
import com.tfarm.member.model.MemberDetailDto;
import com.tfarm.member.model.MemberDto;

public interface BoardAdminDao {

	List<BoardListDto> boardMenu();

	List<MemberDetailDto> memberList(Map<String, String> map);

	List<MemberDetailDto> memberList();

	void memberDelete(int mno);

	void memberDetailDelete(int mno);

	int totalmember();	
	int totalacticle();	
	int totalmemo();	
}
