package com.tfarm.board.dao;

import java.util.List;
import java.util.Map;

import com.tfarm.board.model.TicketDto;

public interface TicketDao {
	
	int writeArticle(TicketDto ticketDto);
	TicketDto viewArticle(int seq);
	List<TicketDto> listArticle(Map<String, String> map);
	int modifyArticle(TicketDto ticketDto);
	int deleteArticle(int seq);


}
