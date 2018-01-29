package com.tfarm.board.service;

import java.util.List;
import java.util.Map;

import com.tfarm.board.model.TicketDto;

public interface TicketService {
	
	int writeArticle(TicketDto ticketDto);
	TicketDto viewArticle(int seq);
	List<TicketDto> listArticle(Map<String, String> map);
	int modifyArticle(TicketDto ticketDto);
	int deleteArticle(int seq);
	
}
