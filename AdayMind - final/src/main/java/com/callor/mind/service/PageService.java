package com.callor.mind.service;

import com.callor.mind.model.PageDTO;

public interface PageService {
	public PageDTO makePage(int totalList, int currentPage);
}
