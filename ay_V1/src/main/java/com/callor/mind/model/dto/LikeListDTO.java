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
public class LikeListDTO {

	private String vl_content;
	private String vl_origin;
	private String vl_user ;
	private String vl_like_date;
	private String vl_like_count;
		
}
