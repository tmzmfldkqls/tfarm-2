package com.tfarm.board.service;

import java.util.List;
import java.util.Map;

import com.tfarm.board.model.TicketDto;

public interface AlbumService {

	int writeArticle(TicketDto albumDto);
	TicketDto viewArticle(int seq);
	List<TicketDto> listArticle(Map<String, String> map);
	void modifyArticle(TicketDto albumDto);
	void deleteArticle(int seq);
	
}
