package com.tfarm.admin.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tfarm.admin.board.dao.BoardAdminDao;
import com.tfarm.admin.board.model.BoardListDto;
import com.tfarm.member.model.MemberDetailDto;
import com.tfarm.member.model.MemberDto;

@Service
public class BoardAdminServiceImpl implements BoardAdminService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardListDto> boardMenu() {
		BoardAdminDao boardAdminDao = sqlSession.getMapper(BoardAdminDao.class);
		return boardAdminDao.boardMenu();
	}
	
	@Override
	public List<MemberDetailDto> memberList() {
		BoardAdminDao boardAdminDao = sqlSession.getMapper(BoardAdminDao.class);
		System.out.println("리스트 사이즈는  : " + boardAdminDao.memberList().size());		
		return boardAdminDao.memberList();
	}

}









