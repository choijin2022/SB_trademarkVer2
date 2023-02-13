package com.cji.exam.trademark.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProjectVo {
	private int id;
	private String regDate;
	private String updateDate;
	private String name;
	private int delStatus;
	private String delDate;
	
}
