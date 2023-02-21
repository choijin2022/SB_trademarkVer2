package com.cji.exam.trademark.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Memo {
	private int id;
	private int projectId;
	private int subProjectId;
	private int memberId;
	private String memoCode;
	private String body;
	private String regDate;
	private String updateDate;
}
