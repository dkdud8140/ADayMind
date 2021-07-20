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
public class WritingVO {

	private Long wr_seq;			//	BIGINT
	private Long wr_user;			//	BIGINT
	private String wr_nick;			//	VARCHAR(50)
	private String wr_content;		//	VARCHAR(3000)
	private int wr_like_count;		//	INT
	private int wr_warning_count;	//	INT
	private Date wr_write_date;		//	TIMESTAMP 
	private Date wr_last_date;		//	TIMESTAMP 
	private String wr_origin;		//	VARCHAR(50)

}
