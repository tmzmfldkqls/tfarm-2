package com.tfarm.board.service;

import java.util.List;
import java.util.Map;

import com.tfarm.board.model.BoardDto;
import com.tfarm.board.model.ReboardDto;


public interface BoardService {

	int writeArticle(ReboardDto reboardDto);
	int replyArticle(ReboardDto reboardDto);
	BoardDto viewArticle(int seq);
	List<ReboardDto> listArticle(Map<String, String> map);
	void modifyArticle(ReboardDto reboardDto);
	void deleteArticle(int seq);
}
