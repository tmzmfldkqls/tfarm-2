package com.tfarm.board.dao;

import java.util.List;

import com.tfarm.board.model.BoardDto;
import com.tfarm.board.model.TicketDto;

public interface MainDao {
	
	//일반 게시판 인기글 리스트 hit높은순
	List<BoardDto> mainboardlist();
	//티켓 게시판 최신글 리스트 seq 높은순
	List<TicketDto> mainticketlist();
	//일반게시판 공지사항 최신글 리스트 seq 높은순
	List<BoardDto> mainnoticelist();

}
