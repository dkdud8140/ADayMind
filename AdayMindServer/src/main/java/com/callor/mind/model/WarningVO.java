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
public class WarningVO {

	private Long wa_seq;		//	BIGINT
	private Long wa_writing;	//	BIGINT
	private Long wa_user;		//	BIGINT
	private String wa_content;	//	VARCHAR(3000)
	private int wa_check;		//	TINYINT(1)
	private Date wa_date;		//	TIMESTAMP 
	private Long wa_reporter;

}
