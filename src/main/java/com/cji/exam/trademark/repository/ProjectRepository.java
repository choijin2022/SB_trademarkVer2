package com.cji.exam.trademark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.cji.exam.trademark.vo.ProjectVo;
import com.cji.exam.trademark.vo.SubProject;

@Mapper
public interface ProjectRepository {
	
	@Insert("""
			INSERT INTO ProjectVo
			SET regDate = NOW(),
				updateDate = NOW(),
				memberId = #{memberId},
				`name` = #{name},
				projectCode = #{projectCode},
				company = #{company}
			""")
	public void createProject(int memberId, String name, String projectCode, String company);
	
	@Insert("""
			INSERT INTO subProject
			SET regDate = NOW(),
				updateDate = NOW(),
				memberId = #{memberId},
				projectId = #{projectId},
				`name` = #{subProjectName}
			""")
	public void createSubProject(int memberId, int projectId, String subProjectName);
	
	
	@Select("""
			SELECT *
			FROM ProjectVo
			ORDER BY id DESC
			""")
	public List<ProjectVo> getProjects();
	
	@Select("""
			SELECT *
			FROM ProjectVo
			WHERE memberId = #{memberId}
			ORDER BY id DESC
			""")
	public List<ProjectVo> getProjectsByMemberId(int memberId);
	
	
	@Select("""
			
			SELECT *
				FROM projectVo AS P LEFT JOIN subProject AS S
				ON P.id = S.projectId
		UNION
			SELECT *
				FROM projectVo AS P RIGHT JOIN subProject AS S 
				ON P.id = S.projectId;	
			""")
	public List<ProjectVo> getUionSubProjects();
	
	
	@Select("""
			SELECT LAST_INSERT_ID()
			""")
	public int getLastInsertId();

	@Select("""
			SELECT *
				FROM ProjectVo
				WHERE id = #{projectId}
			""")
	public ProjectVo getProject(int projectId);

	@Select("""
			SELECT *
			FROM subProject
			ORDER BY id DESC
			""")
	public List<SubProject> getSubprojects();
	
	
	
	@Select("""
			SELECT COUNT(id)
			FROM subProject
			WHERE projectId = #{projectId}
			""")
	public int getSubProjectCount(int projectId);

	@Select("""
			SELECT `name`
				FROM subProject
				WHERE projectId = #{projectId}
			""")
	public String getSubProjectName(int projectId);
	
	@Select("""
			SELECT `name`
				FROM subProject
				WHERE projectId = #{projectId}
			""")
	public List<String> getSubProjectNames(int projectId);
	
	@Select("""
			SELECT *
				FROM subProject
				WHERE projectId = #{projectId}
			""")
	public SubProject getSubProject(int projectId);

	
	@Select("""
			SELECT *
				FROM subProject
				WHERE projectId = #{projectId}
				ORDER BY id DESC
			""")
	public List<SubProject> getSubProjectsByProjectId(int projectId);
	
	
	@Select("""
			SELECT COUNT(*) AS 전체상표수
				FROM trademark
				WHERE projectId = #{projectId};
			""")
	public int getTrademarkCountByProjectId(int projectId);

	
	
	@Delete("""
			DELETE FROM projectVo
			WHERE id = #{projectId}
			""")
	public void deleteProject(int projectId);

	@Update("""
			UPDATE projectVo 
			SET `name` = #{rename},
			updateDate = NOW()
			WHERE id = #{projectId};
			""")
	public void updateProjectName(int projectId, String rename);
	
	
	@Select("""
			SELECT * 
				FROM  Memo
				WHERE memberId = #{loginedMemberId}
			""")
	public List<ProjectVo> getProjectsAndMemosByMemberId(int loginedMemberId);

	
	
	
	
	
	



	

	
	
	
	

}
