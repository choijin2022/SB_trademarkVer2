package com.cji.exam.trademark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cji.exam.trademark.repository.ProjectRepository;
import com.cji.exam.trademark.vo.ProjectVo;

@Service
public class ProjectService {
	private ProjectRepository projectRepository;
	
	@Autowired
	ProjectService(ProjectRepository projectRepository){
		this.projectRepository = projectRepository;
	}
	
	public List<ProjectVo> getProjects() {
		
		return projectRepository.getProjects();
	}
	
	public int createSubProject(String subProjectName) {
		
		projectRepository.createSubProject(subProjectName);
		int subProjectId =  projectRepository.getLastInsertId();
		
		return subProjectId;
	}
	
	public int createProject(String name, String subProjectName) {
		
		int subProjectId = createSubProject(subProjectName);
		 System.out.println(subProjectId);
		 
		projectRepository.createProject(name, subProjectId);
		
		int projectId = projectRepository.getLastInsertId();
		System.out.println(projectId);
		
		return projectId;
	}
	
	
	public ProjectVo getProject(int projectId) {
		
		return projectRepository.getProject(projectId);
	}

}
