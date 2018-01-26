package com.tfarm.board.dao;

import java.util.List;
import java.util.Map;

import com.tfarm.board.model.BoardDto;
import com.tfarm.board.model.ReboardDto;

public interface BoardDao {
	int writeArticle(ReboardDto reboardDto);
	void updateStep(ReboardDto reboardDto);
	int replyArticle(ReboardDto reboardDto);
	void updateReply(int pseq);
	BoardDto viewArticle(int seq);
	List<ReboardDto> listArticle(Map<String, String> map);

}
