package com.cji.exam.trademark.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cji.exam.trademark.vo.Patent;
import com.cji.exam.trademark.vo.Rq;

@Controller
public class UserApiPatController {
	private Rq rq;
	@Autowired
	public UserApiPatController(Rq rq){
		this.rq = rq;
	}
	
	@RequestMapping("/usr/patent/patentApi")
	public String patentApi() {
		return "usr/patent/patentApi";
	}
	
	@RequestMapping("/usr/patent/searchPatent")
	public String doSearchPatent(Model model, @RequestParam(defaultValue = "10") int numOfRows, @RequestParam(defaultValue = "TEST") String word, @RequestParam(defaultValue = "1") int pageNo) {
		List<Patent> patents = new ArrayList<>();
		String totalCount;
		try {
			String url = "http://kipo-api.kipi.or.kr/openapi/service/patUtiModInfoSearchSevice/getWordSearch";
			String serviceKey = "U4edfHljSlmlj96jWD%2Fc6swkeQW0otDCYK9srFWtMqjoiON7WlWpKF0NF%2F2wYAsP%2FMUdxBf7s4IHaUalVapzOg%3D%3D";
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "usr/patent/searchPatent";
	
	
	}
	
	
	
}
