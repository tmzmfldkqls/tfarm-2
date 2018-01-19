package com.tfarm.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tfarm.board.dao.BoardDao;
import com.tfarm.board.model.BoardDto;
import com.tfarm.board.model.ReboardDto;
import com.tfarm.util.BoardConstance;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int writeArticle(ReboardDto reboardDto) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		return boardDao.writeArticle(reboardDto);
	}

	@Override
	public int replyArticle(ReboardDto reboardDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardDto viewArticle(int seq) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		boardDao.updateHit(seq);
		return boardDao.viewArticle(seq);
	}

	@Override
	public List<ReboardDto> listArticle(Map<String, String> map) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		int pg = Integer.parseInt(map.get("pg"));
		int end = BoardConstance.BOARD_LIST_SIZE * pg;
		int start = end - BoardConstance.BOARD_LIST_SIZE;
		map.put("start", start + "");
		map.put("end", end + "");
		return boardDao.listArticle(map);
	}

	@Override
	public void modifyArticle(ReboardDto reboardDto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteArticle(int seq) {
		// TODO Auto-generated method stub
		
	}

}
