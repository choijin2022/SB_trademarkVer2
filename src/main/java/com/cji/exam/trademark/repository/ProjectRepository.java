package com.cji.exam.trademark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.cji.exam.trademark.vo.ProjectVo;

@Mapper
public interface ProjectRepository {

	@Select("""
			SELECT *
			FROM ProjectVo
			ORDER BY id DESC
			""")
	public List<ProjectVo> getProjects();
	
	@Insert("""
			INSERT INTO ProjectVo
			SET regDate = NOW(),
				updateDate = NOW(),
				subProjectId = #{subProjectId},
				`name` = #{name}
			""")
	public void createProject(String name, int subProjectId);

	@Insert("""
			INSERT INTO subProject
			SET regDate = NOW(),
				updateDate = NOW(),
				`name` = #{subProjectName}
			""")
	public void createSubProject(String subProjectName);
	
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
	
	
	

}
