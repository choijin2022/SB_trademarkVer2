package com.cji.exam.trademark.controller;

import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cji.exam.trademark.helper.WordHelper;
import com.cji.exam.trademark.vo.Trademark;


@RestController
@RequestMapping("/api")
public class WordController {
    

    @GetMapping(value = "/word", 
            produces = "application/vnd.openxmlformats-"
                    + "officedocument.wordprocessingml.document")
    public ResponseEntity<InputStreamResource> word() 
            throws IOException, InvalidFormatException {
    	//FileOutputStream out = new FileOutputStream("C:\\cji_d\\01.sts\\wordTest");
        
    	ByteArrayInputStream bis = WordHelper.generateWord();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", 
                "inline; filename=test.docx");
        return ResponseEntity.ok().headers(headers).
                body(new InputStreamResource(bis));
    }
    
    /*
    @GetMapping(value = "/word", 
            produces = "application/vnd.openxmlformats-"
                    + "officedocument.wordprocessingml.document")
    public ResponseEntity<InputStreamResource> word(List<Trademark> trademarks) 
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

