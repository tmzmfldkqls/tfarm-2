package com.tfarm.admin.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<MemberDetailDto> memberList(Map<String, String> map) {
		BoardAdminDao boardAdminDao = sqlSession.getMapper(BoardAdminDao.class);
		return boardAdminDao.memberList(map);
	}
	@Transactional
	@Override
	public int memberDelete(int[] amno) {
		BoardAdminDao boardAdminDao = sqlSession.getMapper(BoardAdminDao.class);
		for(int mno : amno){		
			boardAdminDao.memberDetailDelete(mno);
			boardAdminDao.memberDelete(mno);
		}
		return 1;
	}
	@Override
	public Map<String, Integer> basicInfo() {
		BoardAdminDao boardAdminDao = sqlSession.getMapper(BoardAdminDao.class);
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("totalmember", boardAdminDao.totalmember());
		map.put("totalacticle", boardAdminDao.totalacticle());
		map.put("totalmemo", boardAdminDao.totalmemo());
		
		return map;
	}
}