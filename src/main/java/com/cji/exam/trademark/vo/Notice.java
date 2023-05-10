package com.cji.exam.trademark.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int id;
	private String regDate;
	private String updateDate;
	private String title;
	private String status;
	private String code;
	
}
