package com.cji.exam.trademark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.cji.exam.trademark.vo.ProjectVo;

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
	



	

	
	
	
	

}
