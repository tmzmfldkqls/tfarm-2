package com.tfarm.board.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tfarm.board.dao.BoardDao;
import com.tfarm.board.dao.TicketDao;
import com.tfarm.board.model.ReboardDto;
import com.tfarm.board.model.TicketDto;
import com.tfarm.common.dao.CommonDao;
import com.tfarm.util.BoardConstance;

@Service
public class TicketServiceImpl implements TicketService {

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int writeArticle(TicketDto ticketDto) {
		TicketDao ticketDao = sqlSession.getMapper(TicketDao.class);
		return ticketDao.writeArticle(ticketDto);
	}

	@Override
	public TicketDto viewArticle(int seq) {
		CommonDao commonDao = sqlSession.getMapper(CommonDao.class);
		commonDao.updateHit(seq);
		TicketDao ticketDao = sqlSession.getMapper(TicketDao.class);		
		return ticketDao.viewArticle(seq);
	}

	@Override
	public List<TicketDto> listArticle(Map<String, String> map) {
		TicketDao ticketDao = sqlSession.getMapper(TicketDao.class);
		int pg = Integer.parseInt(map.get("pg"));
		int end = BoardConstance.ALBUM_LIST_SIZE * pg;
		int start = end - BoardConstance.ALBUM_LIST_SIZE;
		map.put("start", start + "");
		map.put("end", end + "");
		return ticketDao.listArticle(map);
	}

	@Override
	public int modifyArticle(TicketDto ticketDto) {
		TicketDao ticketDao = sqlSession.getMapper(TicketDao.class);
		return ticketDao.modifyArticle(ticketDto);
		
	}

	@Override
	public int deleteArticle(int seq) {
		TicketDao ticketDao = sqlSession.getMapper(TicketDao.class);
		return ticketDao.deleteArticle(seq);
	}
}
