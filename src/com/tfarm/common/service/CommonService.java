package com.tfarm.common.service;

import java.util.Map;

import com.tfarm.util.PageNavigation;

public interface CommonService {

	int getNextSeq();
	PageNavigation makePageNavigation(Map<String, String> map);
	
}
