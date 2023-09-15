package com.cji.exam.trademark.controller;

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ServerProperties.Tomcat.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;

import com.cji.exam.trademark.service.ProjectService;
import com.cji.exam.trademark.vo.Patent;
import com.cji.exam.trademark.vo.Rq;


@Controller
public class UserApiPatentController {
//	private static final int numOfRows = 50;
	private ProjectService projectService;
	private Rq rq;
	@Autowired
	public UserApiPatentController(ProjectService projectService, Rq rq){
		this.projectService = projectService;
		this.rq = rq;
	}
	
	
	
	@RequestMapping("/usr/patent/patentApi2")
	public String patentApi() {
		return "usr/patent/patentApi2";
	}
	

	
	
	@RequestMapping("/usr/patent/openPatentDesc")
	public String showDetailPatent(Model model,@RequestParam(defaultValue = "") String applicationNumber) {
		try {
			String url = "http://kipo-api.kipi.or.kr/openapi/service/patUtiModInfoSearchSevice/getPubFullTextInfoSearch";
			String serviceKey = "U4edfHljSlmlj96jWD%2Fc6swkeQW0otDCYK9srFWtMqjoiON7WlWpKF0NF%2F2wYAsP%2FMUdxBf7s4IHaUalVapzOg%3D%3D";
//			String serviceKey = "WTh4nA6jgRy5Jxmw4vhBoRbWDJFex7P%2BNr1NnXssp1P6N6NDjsY5hEZnOLCS4NEOpS8SSkrREQp%2FqX%2BsrB42DQ%3D%3D";
//			String serviceKey = "sd2%2Fw1FPMP7dCiLT1r8GNJatfwBCKhZfFVQAA3lNV55hr4o2tNP9B0NpNBn7iAGvAN8QwKTBfli73H%2Fdq7xZBw%3D%3D";
			
			System.out.println("controller_openPatentDesc");
			
			
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			

			Document documentInfo = dBuilder.parse(url + "?applicationNumber="+applicationNumber + "&ServiceKey=" + serviceKey );
			documentInfo.getDocumentElement().normalize();
			System.out.println("root tag : " + documentInfo.getDocumentElement().getNodeName());	
			
			NodeList nList = documentInfo.getElementsByTagName("item");
			System.out.println(nList.getLength());
			System.out.println("파싱할 tag수 : " + nList.getLength());
			System.out.println(nList.getLength());
			Node node = nList.item(0);
			
			Element eElement = (Element) node;
			// PDF 객체 생성 후 저장
			String pdfUrl = getTagValue("path", eElement);
			System.out.println(pdfUrl);
			
			UrlResource pdfFile = new UrlResource(pdfUrl);
			Patent patent = new Patent();
			
			
				model.addAttribute(rq.getLoginedMemberId());
//			}
			model.addAttribute("memberId", rq.getLoginedMemberId());
//			}
			
			
			
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "usr/patent/openPatentDesc";
	}
	
	
	@RequestMapping("/usr/patent/searchPatent")
	public String doSearchPatent(Model model, @RequestParam(defaultValue = "10") int numOfRows, @RequestParam(defaultValue = "TEST") String searchString, @RequestParam(defaultValue = "1") int pageNo) {
		List<Patent> patents = new ArrayList<>();
		String totalCount;
		try {
			String url = "http://kipo-api.kipi.or.kr/openapi/service/patUtiModInfoSearchSevice/getWordSearch";
//			String serviceKey = "U4edfHljSlmlj96jWD%2Fc6swkeQW0otDCYK9srFWtMqjoiON7WlWpKF0NF%2F2wYAsP%2FMUdxBf7s4IHaUalVapzOg%3D%3D";
			String serviceKey = "WTh4nA6jgRy5Jxmw4vhBoRbWDJFex7P%2BNr1NnXssp1P6N6NDjsY5hEZnOLCS4NEOpS8SSkrREQp%2FqX%2BsrB42DQ%3D%3D";
//			String serviceKey = "sd2%2Fw1FPMP7dCiLT1r8GNJatfwBCKhZfFVQAA3lNV55hr4o2tNP9B0NpNBn7iAGvAN8QwKTBfli73H%2Fdq7xZBw%3D%3D";
			
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			

			Document documentInfo = dBuilder.parse(url + "?word="+searchString + "&ServiceKey=" + serviceKey + "&numOfRows=" + numOfRows + "&pageNo=" + pageNo );
			
			
//			페이지
			documentInfo.getDocumentElement().normalize();
			System.out.println("root tag : " + documentInfo.getDocumentElement().getNodeName());
			
			NodeList nCoutnNode = documentInfo.getElementsByTagName("count");
			totalCount = getCountItem(nCoutnNode,"totalCount");
			int setPageNo = Integer.parseInt(getCountItem(nCoutnNode,"pageNo"));
			System.out.println("totalCount : "+totalCount);
			System.out.println("setPageNo : "+setPageNo);
			System.out.println("pageNo : " + pageNo);
			
			
			NodeList nList = documentInfo.getElementsByTagName("item");
			System.out.println("파싱할 tag수 : " + nList.getLength());
			System.out.println(nList.getLength());
			for(int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if(nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					
					System.out.println(getTagValue("indexNo", eElement));
					// Trademark 객체 생성 후 저장
					Patent patent = new Patent();
					if(getTagValue("inventionTitle", eElement) == null || getTagValue("inventionTitle", eElement) == "") {
						patent.setInventionTitle("(없음)");
					}else {
						patent.setInventionTitle(getTagValue("inventionTitle", eElement));
					}
					if(getTagValue("applicationNumber", eElement) == null || getTagValue("applicationNumber", eElement) == "") {
						patent.setApplicationNumber(getTagValue("internationalRegisterNumber", eElement));
					}else {
						patent.setApplicationNumber(getTagValue("applicationNumber", eElement));
					}
					if(getTagValue("applicationDate", eElement) == null || getTagValue("applicationDate", eElement) == "") {
						patent.setApplicationDate(getTagValue("internationalRegisterDate", eElement));
					}else {
						patent.setApplicationDate(getTagValue("applicationDate", eElement));
					}
					patent.setSearchString(searchString);
					patent.setTotalCount(totalCount);
					if(pageNo >1) {
						int thisIndexNo = Integer.parseInt(getTagValue("indexNo", eElement));
						int addIndexNo = (numOfRows*pageNo-numOfRows)+thisIndexNo;
						patent.setIndexNo(Integer.toString(addIndexNo));
					}else {
						patent.setIndexNo(getTagValue("indexNo", eElement));
					}
					
					
					
					patent.setAstrtCont(getTagValue("astrtCont", eElement));
					patent.setRegisterStatus(getTagValue("registerStatus", eElement));
					patent.setPublicationNumber(getTagValue("publicationNumber", eElement));
					patent.setPublicationDate(getTagValue("publicationDate", eElement));
					patent.setRegisterNumber(getTagValue("registerNumber", eElement));
					patent.setRegisterDate(getTagValue("registerDate", eElement));
					patent.setRegisterNumber(getTagValue("registerNumber", eElement));
					patent.setRegisterDate(getTagValue("registerDate", eElement));
					patent.setOpenNumber(getTagValue("openNumber", eElement));
					patent.setOpenDate(getTagValue("openDate", eElement));
					patent.setApplicantName(getTagValue("applicantName", eElement));
//					patent.setClaimScope(getTagValue("claimScope", eElement));
					patent.setIpcNumber(getTagValue("ipcNumber", eElement));
//					patent.setIpcNumber(getTagValue("ipcNumber", eElement));
//					patent.setApplicant(getTagValue("applicant", eElement));
					patent.setDrawing(getTagValue("drawing", eElement));
					patent.setBigDrawing(getTagValue("bigDrawing", eElement));
					patent.setPageNo(pageNo);
					// 페이지 정보
					int totalCnt = Integer.parseInt(totalCount);
					int pagesCount = setPage(pageNo, totalCnt, numOfRows);
					
					patent.setItemsTotalCount(totalCnt);
					patent.setPagesCount(pagesCount);
					patent.setNumOfRows(numOfRows);
					System.out.println("출원번호" + patent.getApplicationNumber());
					
					
//					String aIPC = patent.getIpcNumber().trim();
//					String mIPC = aIPC.split("|")[0];
//					patent.setMIPC(mIPC);
					
//					System.out.println(mIPC);
					
					// 콤마제거
					if(patent.getInventionTitle() != null) {
						String title = patent.getInventionTitle();
						if(title.contains(",")) {
							String str = title.replace(",", "(_콤마)");
							patent.setInventionTitle(str);
						}
					}
					
					if(patent.getApplicantName() != null) {
						String applicantName = patent.getApplicantName();
						if(applicantName.contains(",")) {
							String str = removeComma(applicantName);
							patent.setApplicant(str);
						}
					}
					//bar 제거
					if(patent.getIpcNumber() != null) {
						String ipcNumber = patent.getIpcNumber();
						if(ipcNumber.contains("|")) {
							String str = removeBar(ipcNumber);
							patent.setMIPC(str);
						}
					}
					


					System.out.println("출원인 이름 : " + patent.getApplicantName());
					System.out.println("발명의 명칭 : "+ patent.getInventionTitle() );
					System.out.println("페이지번호 : "+ patent.getPageNo() );
					System.out.println(patent);
					// 리스트에 trademark 넣기
					patents.add(patent);
					
					
				}
			}
			
			//List<SubProject> subProjects =  projectService.getSubprojects();
//			if(rq.getLoginedMember() != null) {
				model.addAttribute(rq.getLoginedMemberId());
//			}
//			if(rq.getLoginedMemberId() != 0) {
			model.addAttribute("memberId", rq.getLoginedMemberId());
//			}
			
			model.addAttribute("numOfRows", numOfRows);
			model.addAttribute("patents", patents);
			//model.addAttribute("subProjects", subProjects);
			System.out.println(patents);
			//System.out.println("SubProjects"+subProjects);
			
			
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return "usr/patent/searchPatent";
	}

	
	
	
	
	


	//콤마 지우기
	private String removeComma(String str) {
		str = str.replace(",", "");
		return str;
	}
	
	// | 지우기
		private String removeBar(String str) {
			str = str.replace("|", "");
			return str;
		}

	private int setPage(int page, int totalCnt, int numOfRows) {
		int pagesCount = (int) Math.ceil((double) totalCnt / numOfRows);
		return pagesCount;
	}

	private String getCountItem(NodeList nCoutnNode, String itemName) {
		String totalCount="";
		for(int temp = 0; temp < nCoutnNode.getLength(); temp++) {
			Node nCntNode = nCoutnNode.item(temp);
			if(nCntNode.getNodeType() == Node.ELEMENT_NODE) {
				Element eElement = (Element) nCntNode;
				
				totalCount = getTagValue(itemName, eElement);
				
			}
			
		}		
		
		return totalCount;
	}

	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if(nValue == null) {
			return null;
		}
		return nValue.getNodeValue();
	}
	

	

}
