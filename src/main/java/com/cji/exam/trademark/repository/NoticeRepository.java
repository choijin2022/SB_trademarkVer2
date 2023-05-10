package com.cji.exam.trademark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.cji.exam.trademark.vo.Notice;

@Mapper
public interface NoticeRepository {
	
	@Select("""
			SELECT * 
				FROM notice;
			
			""")
	public List<Notice> getNotices();
	

}
