package com.callor.mind.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class WriteListDTO {

	private String vw_seq;
	private String vw_user_seq;
	
	private String vw_nick;
	
	private String vw_content;
	private int vw_like_conunt;
	private int vw_warning_conunt;
	private String vw_write_date;
	private String vw_last_date;
	private String vw_origin;
	
}
