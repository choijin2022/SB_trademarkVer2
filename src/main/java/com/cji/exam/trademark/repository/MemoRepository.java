package com.cji.exam.trademark.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.cji.exam.trademark.vo.Memo;


@Mapper
public interface MemoRepository {
	
	@Insert("""
			INSERT INTO memo
			SET regDate = NOW(),
				updateDate = NOW(),
				memberId = #{loginedMemberId},
				memoCode = #{memoCode},
				projectId = #{projectId},
				`body` = #{body}
			""")
	public void writeMemo(int loginedMemberId, String memoCode, int projectId, String body);
	
	@Select("""
			SELECT LAST_INSERT_ID()
			""")
	public int getLastInsertId();
	
	@Select("""
			SELECT *
			FROM memo
			WHERE id = #{memoId}
			""")
	public Memo getMemoById(int memoId);

}
