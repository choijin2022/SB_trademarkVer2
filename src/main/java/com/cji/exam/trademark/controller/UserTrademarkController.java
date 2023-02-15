package com.cji.exam.trademark.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cji.exam.trademark.service.ProjectService;
import com.cji.exam.trademark.service.TrademarkService;
import com.cji.exam.trademark.util.Utility;
import com.cji.exam.trademark.vo.Trademark;

@Controller
public class UserTrademarkController {
	
	private TrademarkService trademarkService;
	
	
	@Autowired
	UserTrademarkController(TrademarkService trademarkService){
		this.trademarkService = trademarkService;
		
	}
	
	@RequestMapping("/usr/trademark/storedTrademark")
	@ResponseBody
	public String doStoreTrademark(String test, @RequestParam(defaultValue = "0")int projectId, @RequestParam(defaultValue = "0")int subProjectId) {
		if(projectId == 0) {
			return Utility.jsReplace(Utility.f("상표를 저장할 프로젝트를 선택해주세요."), "history.back()");
		}
		System.out.println("projectId : " + projectId);
		
		
		String[] testArr = test.split("!");
		System.out.println("controller 실행");
		int totalSelectedTrademark = testArr.length;
		
		for(int i = 0; i < testArr.length; i++) {
			System.out.println(testArr[i]);
			String[] testArr2 = testArr[i].split(",",-1);
			
			Trademark trademark = new Trademark();
			trademark.setProjectId(projectId);
			
			trademark.setIndexNo(testArr2[0]);
			trademark.setTitle(testArr2[1]);
			trademark.setApplicantName(testArr2[2]);
			trademark.setApplicationNumber(testArr2[3]);
			trademark.setApplicationDate(testArr2[4]);
			trademark.setPublicationNumber(testArr2[5]);
			trademark.setPublicationDate(testArr2[6]);
			trademark.setRegistrationNumber(testArr2[7]);
			trademark.setRegistrationDate(testArr2[8]);
			trademark.setRegistrationPublicNumber(testArr2[9]);
			trademark.setRegistrationPublicDate(testArr2[10]);
			trademark.setPriorityNumber(testArr2[11]);
			trademark.setPriorityDate(testArr2[12]);
			trademark.setInternationalRegisterNumber(testArr2[13]);
			trademark.setInternationalRegisterDate(testArr2[14]);
			trademark.setApplicationStatus(testArr2[15]);
			trademark.setClassificationCode(testArr2[16]);
			trademark.setViennaCode(testArr2[17]);
			trademark.setAgentName(testArr2[18]);
			trademark.setRegPrivilegeName(testArr2[19]);
			trademark.setFullText(testArr2[20]);
			trademark.setDrawing(testArr2[21]);
			trademark.setBigDrawing(testArr2[22]);
//			int rowNum = Integer.parseInt(testArr2[23]);
//			trademark.setNumOfRows(rowNum);
			
			int trademarkId = trademarkService.storedTrademark(trademark, projectId);
			
			if(subProjectId !=0) {
				trademarkService.connectTrademarkSub(trademarkId, projectId, subProjectId);
			}
			
			trademarkService.connectTrademark(trademarkId, projectId);
			
			System.out.println(trademark);
//			list.add(trademark);
//			for(int j = 0; j < testArr2.length; j++) {
//				System.out.println(testArr2[j]);
//				
//				
////				list.add(testArr2[j]);
//				
//			}
		}
		
		return Utility.jsReplace(Utility.f("%d개 상표를 저장했습니다", totalSelectedTrademark), "/usr/trademark/trademarkApi2");
		 
	}
/*
	private List<Map<String, String>> SetListMap(String[] testArr) {
		List<Map<String, String>> ListMap = new ArrayList<>();
		
		for(int i = 0; i < testArr.length; i++) {
			String[] testArr2 = testArr[i].split(",",-1);
			Map<String, String> map = new HashMap<>();
			map.put("indexNo", testArr2[0]);
			map.put("applicantName", testArr2[1]);
			map.put("applicationNumber", testArr2[2]);
			map.put("applicationDate", testArr2[3]);
			map.put("publicationNumber", testArr2[4]);
			map.put("publicationDate", testArr2[5]);
			map.put("registrationNumber", testArr2[6]);
			map.put("registrationDate", testArr2[7]);
			map.put("registrationPublicNumber", testArr2[8]);
			map.put("registrationPublicDate", testArr2[9]);
			map.put("priorityNumber", testArr2[10]);
			map.put("priorityDate", testArr2[11]);
			map.put("internationalRegisterNumber,", testArr2[12]);
			map.put("internationalRegisterDate", testArr2[13]);
			map.put("applicationStatus", testArr2[14]);
			map.put("classificationCode", testArr2[15]);
			map.put("viennaCode", testArr2[16]);
			map.put("agentName", testArr2[17]);
			map.put("regPrivilegeName", testArr2[18]);
			map.put("fullText", testArr2[19]);
			map.put("drawing", testArr2[20]);
			map.put("bigDrawing", testArr2[21]);
			
			ListMap.add(map);
			for (String mapKey : map.keySet()) {
				System.out.println("key : " + mapKey + " / " + "value : " + map.get(mapKey));
			}
		}
		return ListMap;
	}
	*/
	
//	@RequestMapping("/usr/trademark/list")
//	public String showList() {
//		return "usr/trademark/list";
//	}
	
	@RequestMapping("/usr/trademark/doDeleteTrademarks")
	@ResponseBody
	public String doDeleteTrademarks(@RequestParam(defaultValue = "") String ids) {
		
		if (Utility.empty(ids)) {
			return Utility.jsHistoryBack("선택한 상표가 없습니다");
		}
		
		
		
		List<Integer> trademarkIds = new ArrayList<>();
		
		for (String idStr : ids.split(",")) {
			trademarkIds.add(Integer.parseInt(idStr));
		}
		
		trademarkService.deleteTrademarks(trademarkIds);
		
		return Utility.jsReplace(Utility.f("%d개 상표를 삭제했습니다", trademarkIds.size()), "/usr/workspace/main");
	}
	
}
