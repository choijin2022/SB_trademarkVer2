package com.cji.exam.trademark.controller;

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

@Controller
public class UserProjectController {
	
	private ProjectService projectService;
	
	@Autowired
	UserProjectController( ProjectService projectService){
		this.projectService = projectService;
	}
	
	
	
/*
	@RequestMapping("/usr/project/createWork")
	@ResponseBody
	public String doWrite(int boardId, String title, String body) {

		if (Utility.empty(title)) {
			return Utility.jsHistoryBack("제목을 입력해주세요");
		}
		if (Utility.empty(body)) {
			return Utility.jsHistoryBack("내용을 입력해주세요");
		}

		ResultData<Integer> writeArticleRd = articleService.writeArticle(rq.getLoginedMemberId(), boardId, title, body);

		int id = writeArticleRd.getData1();

		return Utility.jsReplace(Utility.f("%d번 글이 생성되었습니다", id), Utility.f("detail?id=%d", id));
	}
	
	@RequestMapping("/usr/project/list")
	public String showWorkspaceList(Model model, @RequestParam(defaultValue = "3") int boardId,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "title") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {

		if (page <= 0) {
			return rq.jsReturnOnView("페이지번호가 올바르지 않습니다", true);
		}

		Board board = boardService.getBoardById(boardId);

		if (board == null) {
			return rq.jsReturnOnView("존재하지 않는 게시판입니다", true);
		}

		int articlesCount = articleService.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);

		int itemsInAPage = 10;

		int pagesCount = (int) Math.ceil((double) articlesCount / itemsInAPage);

		List<Article> articles = articleService.getArticles(boardId, searchKeywordTypeCode, searchKeyword, itemsInAPage,
				page);

		model.addAttribute("board", board);
		model.addAttribute("articles", articles);
		model.addAttribute("articlesCount", articlesCount);
		model.addAttribute("boardId", boardId);
		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);

		return "usr/project/list";
	}
	*/
	
//	@RequestMapping("/usr/project/getProject")
//	@ResponseBody
//	public ResultData<List<ProjectVo>> getProject(Model model) {
//		
//		List<ProjectVo> projects = projectService.getProjects();
//		
//		if(projects == null) {
//			return ResultData.from("F-1", "프로젝트가 존재하지 않습니다");
//		}
//		
//		int projectCount = projects.size();
//		System.out.println("projectCount : "+projectCount);
//		model.addAttribute("projects", projects);
//		model.addAttribute("projectCount", projectCount);
//		
//		return ResultData.from("S-1", "프로젝트 조회 성공", "projects", projects);
//	}
	
	@RequestMapping("/usr/project/getProject")
	@ResponseBody
	public List<ProjectVo> getProject(Model model) {
		
		List<ProjectVo> projects = projectService.getProjects();
		
//		if(projects == null) {
//			return ResultData.from("F-1", "프로젝트가 존재하지 않습니다");
//		}
		int projectCount = projects.size();
		System.out.println("projectCount : "+projectCount);
		model.addAttribute("projects", projects);
		model.addAttribute("projectCount", projectCount);
		
		return  projects;
	}
	
	@RequestMapping(value="/usr/project/createProject", method = { RequestMethod.POST })
	@ResponseBody
	public ResultData<ProjectVo> doCreateProject(@RequestParam("name") String name, @RequestParam("subProjectName") String subProjectName) {
		System.out.println(name);
		System.out.println(subProjectName);
		if (Utility.empty(name)) {
			return ResultData.from("F-1", "생성할 프로젝트 이름을 입력해주세요");
		}
		if (Utility.empty(subProjectName)) {
			subProjectName = "새폴더";
		}
		
		
		
		int projectId = projectService.newCreateProject(name);
		int subProjectId = 	projectService.createSubProject(projectId, subProjectName);
		
		ProjectVo project = projectService.getProject(projectId);
		
		

		return ResultData.from("S-1", "프로젝트 생성 성공", "project", project);
	}
}
