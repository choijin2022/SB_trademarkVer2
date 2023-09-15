package com.cji.exam.trademark.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cji.exam.trademark.helper.WordHelper;
import com.cji.exam.trademark.helper.WordHelper3;
import com.cji.exam.trademark.service.TrademarkService;
import com.cji.exam.trademark.service.WorkspaceService;
import com.cji.exam.trademark.vo.Trademark;


@RestController
@RequestMapping("/api")
public class WordController {
    private TrademarkService trademarkservice;
    private WorkspaceService worksapceService;
    
	@Autowired
	private WordController(TrademarkService trademarkservice, WorkspaceService worksapceService){
		this.trademarkservice = trademarkservice;
		this.worksapceService = worksapceService;
	}
	

    @GetMapping(value = "/word", 
            produces = "application/vnd.openxmlformats-"
                    + "officedocument.wordprocessingml.document")
    public ResponseEntity<InputStreamResource> word(@RequestParam(defaultValue = "") String ids) 
            throws IOException, InvalidFormatException {
    	List<Integer> trademarkIds = new ArrayList<>();
		
		for (String idStr : ids.split(",")) {
			trademarkIds.add(Integer.parseInt(idStr));
		}
		List<Trademark> trademarks = trademarkservice.getTrademarksByTrademarkId(trademarkIds);
		
		System.out.println(trademarks);
		
    	ByteArrayInputStream bis = WordHelper.generateWord(trademarks);
    	
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", 
                "inline; filename=test.docx");
        return ResponseEntity.ok().headers(headers).
                body(new InputStreamResource(bis));
    }
 // test용 download 클릭시 작동/ WordHelper3
    @GetMapping(value = "/wordTest", 
            produces = "application/vnd.openxmlformats-"
                    + "officedocument.wordprocessingml.document")
    public ResponseEntity<InputStreamResource> wordTest(@RequestParam(defaultValue = "") String ids) 
            throws IOException, InvalidFormatException {
    	List<Integer> trademarkIds = new ArrayList<>();
		
		for (String idStr : ids.split(",")) {
			trademarkIds.add(Integer.parseInt(idStr));
		}
		List<Trademark> trademarks = trademarkservice.getTrademarksByTrademarkId(trademarkIds);
		
		System.out.println(trademarks);
		
    	ByteArrayInputStream bis = WordHelper3.generateWord(trademarks);
    	
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", 
                "inline; filename=test.docx");
        return ResponseEntity.ok().headers(headers).
                body(new InputStreamResource(bis));
    }
    
    // test용
    /*
    @GetMapping(value = "/word", 
            produces = "application/vnd.openxmlformats-"
                    + "officedocument.wordprocessingml.document")
    public ResponseEntity<InputStreamResource> word() 
            throws IOException, InvalidFormatException {
    	//FileOutputStream out = new FileOutputStream("C:\\cji_d\\01.sts\\wordTest");
    	System.out.println("api trademarks"+trademarks);
    	
        ByteArrayInputStream bis = WordHelper.generateWord(trademarks);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", 
                "inline; filename=test.docx");
        return ResponseEntity.ok().headers(headers).
                body(new InputStreamResource(bis));
    }
    */
}

