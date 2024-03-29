package com.cji.exam.trademark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.cji.exam.trademark.vo.Memo;
import com.cji.exam.trademark.vo.ProjectVo;


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
	
	@Select("""
			SELECT *
			FROM memo
			WHERE projectId = #{projectId}
			""")
	public Memo getMemoByProjectId(int projectId);

	@Select("""
			SELECT *
			FROM memo
			WHERE memberId = #{loginedMemberId}
			""")
	public List<Memo> getMemosByMemberId(int loginedMemberId);
	
	
	@Select("""
			SELECT B.body AS memoBody
				FROM projectVo AS A
				 LEFT JOIN memo AS B
				 ON A.id = B.projectId
				 WHERE A.memberId = #{loginedMemberId};				

			""")
	public List<String> getMemoBodysByMemberId(int loginedMemberId);

	
	@Delete("""
			DELETE FROM memo
				WHERE id = #{memoId};
			
			
			""")
	public void deleteMemo(int memoId);
	
	@Update("""
			UPDATE memo
			     SET updateDate = NOW(),
			         `body` = #{memoBody}
			     WHERE id = #{memoId};
			
			""")
	public void updateMemoBody(int memoId, String memoBody);
	
	
	
	
	
}
