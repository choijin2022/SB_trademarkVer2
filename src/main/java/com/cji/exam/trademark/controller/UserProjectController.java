package com.cji.exam.trademark.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cji.exam.trademark.service.ProjectService;
import com.cji.exam.trademark.util.Utility;
import com.cji.exam.trademark.vo.ProjectVo;
import com.cji.exam.trademark.vo.ResultData;
import com.cji.exam.trademark.vo.Rq;
import com.cji.exam.trademark.vo.SubProject;

@Controller
public class UserProjectController {
	
	private ProjectService projectService;
	private Rq rq;
	
	@Autowired
	UserProjectController( ProjectService projectService,  Rq rq){
		this.projectService = projectService;
		this.rq = rq;
	}
	
	
	

	
	@RequestMapping("/usr/project/getProject")
	@ResponseBody
	public List<ProjectVo> getProject(Model model) {
		
		
		
		List<ProjectVo> projects = projectService.getProjectsByMemberId(rq.getLoginedMemberId());
		
//		if(projects == null) {
//			return ResultData.from("F-1", "프로젝트가 존재하지 않습니다");
//		}
		int projectCount = projects.size();
		
		
		
		System.out.println("projectCount : "+projectCount);
		model.addAttribute("projects", projects);
		model.addAttribute("projectCount", projectCount);
		
		return projects;
	}
	
	@RequestMapping("/usr/project/getSubProject")
	@ResponseBody
	public List<SubProject> getSubProject(Model model, @RequestParam(defaultValue = "0")int projectId) {
		
//		if(projects == null) {
//			return ResultData.from("F-1", "프로젝트가 존재하지 않습니다");
//		}
		
		int subProjectCount = projectService.getSubProjectCount(projectId);
		model.addAttribute("subProjectCount", subProjectCount);
		List<SubProject> subProjects = new ArrayList<>();
		
		if(subProjectCount == 1 ) {
			
			SubProject subProject = projectService.getSubProject(projectId);
			subProjects.add(subProject);
			return subProjects;
		}
		else {
			subProjects = projectService.getSubProjectsByProjectId(projectId);
		}
		
		System.out.println("subProjectCount : "+subProjectCount);
		System.out.println(subProjectCount);
		model.addAttribute("subProjects", subProjects);
		
		return subProjects;
		
	}
	
	
	
	@RequestMapping("/usr/project/getAllProject")
	@ResponseBody
	public List<ProjectVo> getAllProject(Model model, @RequestParam(defaultValue = "0")int projectId) {
		
//		List<ProjectVo> projects = projectService.getProjects();
		List<ProjectVo> projects = projectService.getUionSubProjects();
		
//		if(projects == null) {
//			return ResultData.from("F-1", "프로젝트가 존재하지 않습니다");
//		}
		
		int projectCount = projects.size();
		
		List<SubProject> subProjects = projectService.getSubprojects();
		
		System.out.println("projectCount : "+projectCount);
		model.addAttribute("projects", projects);
		model.addAttribute("subProjects", subProjects);
		model.addAttribute("projectCount", projectCount);
		
		return  projects;
	}

	
	

	@RequestMapping(value="/usr/project/createProject", method = { RequestMethod.POST })
	@ResponseBody
	public ResultData<ProjectVo> doCreateProject(@RequestParam("name") String name, @RequestParam("subProjectName") String subProjectName, @RequestParam("projectCode")String projectCode, @RequestParam("company")String company) {
		System.out.println(name);
		System.out.println(subProjectName);
		System.out.println(projectCode);
		System.out.println(company);
		if (Utility.empty(name)) {
			return ResultData.from("F-1", "생성할 프로젝트 이름을 입력해주세요");
		}
		if (Utility.empty(subProjectName)) {
			subProjectName = "새폴더";
		}
		
		
		
		int projectId = projectService.newCreateProject(rq.getLoginedMemberId(), name,projectCode,company );
		int subProjectId = 	projectService.createSubProject(rq.getLoginedMemberId(), projectId, subProjectName);
		System.out.println(subProjectId);
		
		ProjectVo project = projectService.getProject(projectId);
		
		

		return ResultData.from("S-1", "프로젝트 생성 성공", "project", project);
	}
	
	@RequestMapping("/usr/project/deleteProject")
	@ResponseBody
	public String doDeleteProject(int projectId) {
		System.out.println("controller !!!!");
//		System.out.println("id : "+id);
		System.out.println(projectId);
//		int projectId = Integer.parseInt(id);
		if (projectId==0) {
			return Utility.f("F-1", "삭제할 프로젝트를 선택해주세요");
		}
		
		ProjectVo project = projectService.getProject(projectId);
		if(project.getMemberId() != rq.getLoginedMemberId()) {
			return Utility.f("F-1", "권한이 없습니다.");
		}
		
		projectService.deleteProject( projectId);
//		List<ProjectVo> projects = projectService.getProjects();
		
		return Utility.jsReplace(Utility.f("해당 프로젝트를 삭제했습니다"), Utility.f("/usr/workspace/main"));
//		return Utility.jsReplace(Utility.f("해당 프로젝트를 삭제했습니다"), "/usr/workspace/main");
	}
	
	@RequestMapping("/usr/project/renameProject")
	@ResponseBody
	public  List<ProjectVo> projectNameUpdate(int projectId, String rename, Model model) {
		
		projectService.updateProjectName(projectId, rename);
		
//		if(projects == null) {
//			return ResultData.from("F-1", "프로젝트가 존재하지 않습니다");
//		}
		
		List<ProjectVo> projects = projectService.getProjects();
		
		List<SubProject> subProjects = projectService.getSubprojects();
		model.addAttribute("projects", projects);
		model.addAttribute("subProjects", subProjects);
		
		return  projects;
	}
}
