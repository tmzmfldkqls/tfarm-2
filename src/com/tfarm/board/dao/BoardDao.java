package com.tfarm.board.dao;

import java.util.List;
import java.util.Map;
import com.tfarm.board.model.BoardDto;
import com.tfarm.board.model.ReboardDto;

public interface BoardDao {
	int writeArticle(ReboardDto reboardDto);
	void updateHit(int seq);
	BoardDto viewArticle(int seq);
	List<ReboardDto> listArticle(Map<String, String> map);
	int modifyArticle(ReboardDto reboardDto);
	int deleteArticle(int seq);
}

