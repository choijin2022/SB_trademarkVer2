package com.cji.exam.trademark.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProjectVo {
	private int id;
	private int memberId;
	private String regDate;
	private String updateDate;
	private String name;
	private String projectCode;
	private String company;
	private int delStatus;
	private String delDate;
	
	private String memoBody;
	
	private int subProjecId;
	private String subProjectName;
	
}
