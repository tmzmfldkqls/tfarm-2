package com.tfarm.admin.board.service;

import java.util.List;

import com.tfarm.admin.board.model.BoardListDto;
import com.tfarm.member.model.MemberDetailDto;
import com.tfarm.member.model.MemberDto;

public interface BoardAdminService {

	List<BoardListDto> boardMenu();

	List<MemberDetailDto> memberList();
	
}
