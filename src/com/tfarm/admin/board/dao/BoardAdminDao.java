package com.tfarm.admin.board.dao;

import java.util.List;

import com.tfarm.admin.board.model.BoardListDto;
import com.tfarm.member.model.MemberDetailDto;
import com.tfarm.member.model.MemberDto;

public interface BoardAdminDao {

	List<BoardListDto> boardMenu();

	List<MemberDetailDto> memberList();
	
}
