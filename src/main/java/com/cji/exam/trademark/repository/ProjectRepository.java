package com.cji.exam.trademark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.cji.exam.trademark.vo.ProjectVo;
import com.cji.exam.trademark.vo.SubProject;

@Mapper
public interface ProjectRepository {
	
	@Insert("""
			INSERT INTO ProjectVo
			SET regDate = NOW(),
				updateDate = NOW(),
				`name` = #{name}
			""")
	public void createProject(String name);
	
	@Insert("""
			INSERT INTO subProject
			SET regDate = NOW(),
				updateDate = NOW(),
				projectId = #{projectId},
				`name` = #{subProjectName}
			""")
	public void createSubProject(int projectId, String subProjectName);
	
	
	@Select("""
			SELECT *
			FROM ProjectVo
			ORDER BY id DESC
			""")
	public List<ProjectVo> getProjects();
	
	@Select("""
			
			SELECT *
				FROM projectVo AS P LEFT JOIN subProject AS S
				ON P.id = S.projectId
		UNION
			SELECT *
				FROM projectVo AS P RIGHT JOIN subProject AS S 
				ON P.id = S.projectId;	
			""")
	public List<ProjectVo> getAllProjects();
	
	
	@Select("""
			SELECT LAST_INSERT_ID()
			""")
	public int getLastInsertId();

	@Select("""
			SELECT *
				FROM ProjectVo
				where id = #{projectId}
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
			where projectId = #{projectId}
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
				where projectId = #{projectId}
			""")
	public SubProject getSubproject(int projectId);

	
	
	
	
	
	



	

	
	
	
	

}
