package com.cji.exam.trademark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cji.exam.trademark.repository.ProjectRepository;
import com.cji.exam.trademark.vo.ProjectVo;
import com.cji.exam.trademark.vo.ResultData;
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
	
	public int newCreateProject(int memberId, String name, String projectCode, String company) {
			
			projectRepository.createProject(memberId, name,projectCode,company );
			int projectId =  projectRepository.getLastInsertId();
			
			return projectId;
		}
	
	public int createSubProject(int memberId, int projectId, String subProjectName) {
		
		projectRepository.createSubProject(memberId, projectId, subProjectName);
		
		int subProjectId = projectRepository.getLastInsertId();
		
		
		System.out.println("subProjectId 생성 : " + subProjectId);
		
		return subProjectId;
	}
	
	public ProjectVo getProject(int projectId) {
		
		return projectRepository.getProject(projectId);
	}
	
	public SubProject getSubProject(int projectId) {
		return projectRepository.getSubProject(projectId);
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

	public List<ProjectVo> getUionSubProjects() {
		return projectRepository.getUionSubProjects();
	}

	public List<SubProject> getSubprojects() {
		return projectRepository.getSubprojects();
	}

	public List<SubProject> getSubProjectsByProjectId(int projectId) {
		return projectRepository.getSubProjectsByProjectId(projectId);
	}

	public List<ProjectVo> getProjectsByMemberId(int loginedMemberId) {
		return projectRepository.getProjectsByMemberId(loginedMemberId);
	}

	public int getTrademarkCountByProjectId(int projectId) {
		return projectRepository.getTrademarkCountByProjectId(projectId);
	}

	public void deleteProject(int projectId) {
		System.out.println("project Service");		
		System.out.println(projectId);
		projectRepository.deleteProject(projectId);
	}


}
