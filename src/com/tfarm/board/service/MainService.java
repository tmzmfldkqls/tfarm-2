package com.tfarm.board.service;

import java.util.List;
import java.util.Map;

import com.tfarm.board.model.BoardDto;
import com.tfarm.board.model.TicketDto;


public interface MainService {
	
	List<BoardDto> boardlist();
	List<BoardDto> noticelist();
	List<TicketDto> ticketlist();
	
}
