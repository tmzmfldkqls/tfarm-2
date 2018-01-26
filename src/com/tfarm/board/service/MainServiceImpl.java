package com.tfarm.board.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tfarm.board.dao.MainDao;
import com.tfarm.board.model.BoardDto;
import com.tfarm.board.model.TicketDto;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private SqlSession sqlSession;

	//일반 게시판 인기글 리스트 hit높은순
	@Override
	public List<BoardDto> boardlist() {
		MainDao mainDao = sqlSession.getMapper(MainDao.class);
		return mainDao.mainboardlist();
	}

	//티켓 게시판 최신글 리스트 seq 높은순
	@Override
	public List<TicketDto> ticketlist() {
		MainDao mainDao = sqlSession.getMapper(MainDao.class);
		return mainDao.mainticketlist();
	}

	//일반게시판 공지사항 최신글 리스트 seq 높은순
	@Override
	public List<BoardDto> noticelist() {
		MainDao mainDao = sqlSession.getMapper(MainDao.class);
		return mainDao.mainnoticelist();
	}
	
}
