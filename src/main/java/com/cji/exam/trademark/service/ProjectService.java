package com.cji.exam.trademark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cji.exam.trademark.repository.ProjectRepository;
import com.cji.exam.trademark.vo.ProjectVo;
import com.cji.exam.trademark.vo.SubProject;

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
	
//	public int createSubProject(String subProjectName) {
//		
//		projectRepository.createSubProject(subProjectName);
//		int subProjectId =  projectRepository.getLastInsertId();
//		
//		return subProjectId;
//	}
	
	public int newCreateProject(String name) {
			
			projectRepository.createProject(name);
			int projectId =  projectRepository.getLastInsertId();
			
			return projectId;
		}
	
	public int createSubProject(int projectId, String subProjectName) {
		
		projectRepository.createSubProject(projectId, subProjectName);
		
		int subProjectId = projectRepository.getLastInsertId();
		
		
		System.out.println(subProjectId);
		
		return subProjectId;
	}
	
	public ProjectVo getProject(int projectId) {
		
		return projectRepository.getProject(projectId);
	}
	
	public SubProject getSubproject(int projectId) {
		return projectRepository.getSubproject(projectId);
	}

	public int getSubProjectCount(int projectId) {
		
		return projectRepository.getSubProjectCount(projectId);
	}

	public List<String> getSubProjectNames(int projectId) {
		List<String> subProjectNames = projectRepository.getSubProjectNames(projectId);
		System.out.println("subProjectNames : " + subProjectNames);
		return subProjectNames;
	}
	public String getSubProjectName(int projectId) {
		return projectRepository.getSubProjectName(projectId);
	}

	public List<ProjectVo> getAllProjects() {
		return projectRepository.getAllProjects();
	}

	public List<SubProject> getSubprojects() {
		return projectRepository.getSubprojects();
	}
	
	

}
