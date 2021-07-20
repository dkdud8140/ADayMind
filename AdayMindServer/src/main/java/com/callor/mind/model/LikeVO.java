package com.callor.mind.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class LikeVO {
	
	private Long li_seq;//	BIGINT
	private Long li_wr_seq;//	BIGINT
	private Long li_fan;//	BIGINT
	private Date li_date;//	TIMESTAMP 
}
