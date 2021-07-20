package com.callor.mind.service.impl;

import org.springframework.stereotype.Service;

import com.callor.mind.model.PageDTO;
import com.callor.mind.service.PageService;

import lombok.Setter;

@Setter
@Service("pageServiceV1")
public class PageServiceImplV1 implements PageService {
	
	protected int listPerPage = 10;
	protected int navsPerPage = 10 ;
	
	@Override
	public PageDTO makePage(int totalList, int currentPage) {

		if(totalList < 1 ) return null ;
		
		int totalPages = (int)Math.ceil((double)totalList / (double)this.listPerPage);
		
		int startPage = currentPage - (this.navsPerPage/2);
		startPage = startPage < 1 ? 1 : startPage;
		
		int endPage = startPage + this.navsPerPage - 1;
		endPage = endPage > totalPages ? totalPages : endPage;

		int offset = (currentPage - 1) * this.listPerPage;
		int limit = offset + this.listPerPage;
		limit = limit > totalList ? totalList : limit;
		
		PageDTO pageDTO = PageDTO.builder()
						.totalPages(totalPages)
						.startPage(startPage)
						.endPage(endPage)
						.offset(offset)
						.limit(limit).build();
		return pageDTO;
	}

}
