package com.tfarm.board.service;

import java.util.List;

import com.tfarm.board.model.MemoDto;

public interface MemoService {

	void writeMemo(MemoDto memoDto);
	List<MemoDto> listMemo(int seq);
	void deleteMemo(int mseq);
	void modifyMemo(MemoDto memoDto);
}
