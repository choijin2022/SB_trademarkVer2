package com.cji.exam.trademark.controller;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cji.exam.trademark.helper.WordHelper;
import com.cji.exam.trademark.service.ProjectService;
import com.cji.exam.trademark.service.TrademarkService;
import com.cji.exam.trademark.service.WorkspaceService;
import com.cji.exam.trademark.util.Utility;
import com.cji.exam.trademark.vo.ProjectVo;
import com.cji.exam.trademark.vo.ResultData;
import com.cji.exam.trademark.vo.Rq;
import com.cji.exam.trademark.vo.SubProject;
import com.cji.exam.trademark.vo.Trademark;

@Controller
public class UserWorkspaceController {
	
	private ProjectService projectService;
	private TrademarkService trademarkservice;
	private Rq rq;
	private WorkspaceService worksapceService;
	
	@Autowired
	UserWorkspaceController( ProjectService projectService, TrademarkService trademarkservice, Rq rq,WorkspaceService worksapceService){
		this.projectService = projectService;
		this.trademarkservice = trademarkservice;
		this.rq = rq;
		this.worksapceService = worksapceService;
	}
	
	
	@RequestMapping("/usr/workspace/main")
	public String showWorkspaceMain(Model model,@RequestParam(defaultValue = "3") int boardId,
			@RequestParam(defaultValue = "title") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {
		
//		Board board = boardService.getBoardById(boardId);
//		if (board == null) {
//			return rq.jsReturnOnView("존재하지 않는 게시판입니다", true);
//		}
		
		List<ProjectVo> projects = projectService.getProjectsByMemberId(rq.getLoginedMemberId());
				
//		projectService.getProjects();
		
		int projectCount = projects.size();
		
		
		// 로그인 기능 구현 후 다시 수정하기
		//List<Trademark> trademarks = trademarkservice.getTrademarksByProjectId(projectId);
		
//		model.addAttribute("board", board);
		model.addAttribute("projects", projects);
		model.addAttribute("projectCount", projectCount);
		model.addAttribute("boardId", boardId);
		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "usr/workspace/main";
	}
	
	@RequestMapping("/usr/workspace/myWork")
	public String showMyWork(Model model,@RequestParam(defaultValue = "0")int projectId, @RequestParam(defaultValue = "3") int boardId,
			@RequestParam(defaultValue = "title") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {
		
//		Board board = boardService.getBoardById(boardId);
//		if (board == null) {
//			return rq.jsReturnOnView("존재하지 않는 게시판입니다", true);
//		}
		if (projectId==0) {
			return rq.jsReturnOnView("존재하지 않는 프로젝트입니다", true);
		}
		
		ProjectVo project = projectService.getProject(projectId);
		
		int subProjectCount = projectService.getSubProjectCount(projectId);
		
		
		if(subProjectCount > 1) {
			List<String> subProjectName = projectService.getSubProjectNames(projectId);
			List<SubProject> subProjects = projectService.getSubProjectsByProjectId(projectId);
			model.addAttribute("subProjects", subProjects);
			model.addAttribute("subProjectName", subProjectName);
		}else {
			String subProjectName = projectService.getSubProjectName(projectId);
			SubProject subProject = projectService.getSubProject(projectId);
			model.addAttribute("subProject", subProject);
			model.addAttribute("subProjectName", subProjectName);
			System.out.println("subProjectName : " + subProjectName);
		}
		
		//SubProject subProjects = projectService.getSubProjects(projectId);
		int allTrademarkCount = projectService.getTrademarkCountByProjectId(projectId);
		List<Trademark> trademarks = trademarkservice.getTrademarksByProjectId(projectId);
		
//		model.addAttribute("board", board);
		model.addAttribute("allTrademarkCount", allTrademarkCount);
		model.addAttribute("project", project);
		model.addAttribute("subProjectCount", subProjectCount);
		model.addAttribute("trademarks", trademarks);
		model.addAttribute("boardId", boardId);
		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "usr/workspace/myWork";
	}
	
	@RequestMapping("/usr/workspace/list")
	public String showList(Model model, @RequestParam(defaultValue = "0")int projectId, @RequestParam(defaultValue = "0")int subProjectId, @RequestParam(defaultValue = "3") int boardId,
			@RequestParam(defaultValue = "title") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {
		
		if (projectId==0) {
			return rq.jsReturnOnView("존재하지 않는 프로젝트입니다", true);
		}
		
		ProjectVo project = projectService.getProject(projectId);
		
		int subProjectCount = projectService.getSubProjectCount(projectId);
		
		List<SubProject> subProjects = new ArrayList<>();
		if(subProjectCount > 1) {
			subProjects = projectService.getSubProjectsByProjectId(projectId);
			
		}else {
			SubProject subProject = projectService.getSubProject(projectId);
			System.out.println("subProject : " + subProject);
			subProjects.add(subProject);
		}
		
		//SubProject subProjects = projectService.getSubProjects(projectId);
		
		List<Trademark> trademarks = trademarkservice.getTrademarksBySubId(subProjectId);
		System.out.println("subProjects : "+subProjects);
		int allTrademarkCount = projectService.getTrademarkCountByProjectId(projectId);
		
//		model.addAttribute("board", board);
		model.addAttribute("allTrademarkCount", allTrademarkCount);
//		model.addAttribute("board", board);
		model.addAttribute("project", project);
		model.addAttribute("subProjects", subProjects);
		model.addAttribute("subProjectCount", subProjectCount);
		model.addAttribute("trademarks", trademarks);
		model.addAttribute("boardId", boardId);
		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "usr/workspace/list";
//		return "usr/workspace/list?projectId="+projectId;
//		return "usr/workspace/list?projectId="+projectId+"&subProjectId="+subProjectId;
	}
	
	
	
	@RequestMapping("/usr/workspace/download")
	public String doDownloadTrademarks(Model model, @RequestParam(defaultValue = "") String ids, @RequestParam(defaultValue = "0")int projectId, @RequestParam(defaultValue = "0")int subProjectId,@RequestParam(defaultValue = "3") int boardId,
			@RequestParam(defaultValue = "title") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) throws Exception {
		
		if (ids == null) {
			return rq.jsReturnOnView("상표를 다시 선택해주세요", true);
		}
		
		List<Integer> trademarkIds = new ArrayList<>();
		
		for (String idStr : ids.split(",")) {
			trademarkIds.add(Integer.parseInt(idStr));
		}
		List<Trademark> trademarks = trademarkservice.getTrademarksByTrademarkId(trademarkIds);
		
		System.out.println(trademarks);
		
		//WordHelper.generateWord(trademarks);
		//WordHelper.insertTrademark(trademarks);
		//worksapceService.doTrademarksSetToWork(trademarks);
		//worksapceService.doWordParser();
		
		
		//return "/api/word";
		return "/list?projectId="+projectId;
	}
	
	@RequestMapping("/usr/workspace/storedTrademark")
	@ResponseBody
	public String doStoredTrademarkFromDB(Model model, String ids, @RequestParam(defaultValue = "0")int projectId, @RequestParam(defaultValue = "0")int subProjectId, @RequestParam(defaultValue = "3") int boardId) {
		
		if(projectId == 0) {
			return Utility.jsReplace(Utility.f("상표를 저장할 프로젝트를 선택해주세요."), "history.back()");
		}
		List<Integer> trademarkIds = new ArrayList<>();
		
		for (String idStr : ids.split("!")) {
			trademarkIds.add(Integer.parseInt(idStr));
		}
		System.out.println("trademarkIds : "+trademarkIds);
		trademarkservice.storedTrademarksFromDB(trademarkIds, projectId);
		String subProjectName = projectService.getSubProjectName(subProjectId);
//		projectService.storedSubProject
		
//		projectService.createSubProject(rq.getLoginedMemberId(), projectId, subProjectName);
		//SubProject subProjects = projectService.getSubProjects(projectId);
		
		
//		model.addAttribute("board", board);
		model.addAttribute("boardId", boardId);
		
		return Utility.jsReplace(Utility.f("%d개 상표를 저장했습니다", trademarkIds.size()), "/usr/workspace/list?projectId="+projectId);
		}
	
	
	
}
