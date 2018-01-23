package com.tfarm.board.dao;

import java.util.List;
import java.util.Map;

import com.tfarm.board.model.BoardDto;


public interface BoardDao {
	
	BoardDto viewArticle(int seq);
	List<BoardDto> listArticle(Map<String, String> map);

}
