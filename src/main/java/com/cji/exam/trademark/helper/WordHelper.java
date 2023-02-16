package com.cji.exam.trademark.helper;


import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

import com.cji.exam.trademark.vo.Trademark;

public class WordHelper {
/*
    public static ByteArrayInputStream generateWord()
            throws FileNotFoundException, IOException, 
                        InvalidFormatException {

        try (XWPFDocument doc = new XWPFDocument()) {

            XWPFParagraph p1 = doc.createParagraph();
            XWPFRun r1 = p1.createRun();
            r1.setFontSize(10);
            r1.setText("유사판단 (유사도 표시 극히 동일, 유사 : ★ /  다소 동일, 유사 : ☆ )");
            r1.setFontFamily("맑은 고딕");
            r1.addBreak();
            
         // Creating first Row
            XWPFTable table = doc.createTable();
            XWPFTableRow row1 = table.getRow(0);
            row1.getCell(0).setText("No");
            row1.addNewTableCell().setText("유사도");
            row1.addNewTableCell().setText("현재상태");
            row1.addNewTableCell().setText("표장");
            row1.addNewTableCell().setText("출원번호/우선권 ");
            row1.addNewTableCell().setText("출원인/등록권자 ");
            row1.addNewTableCell().setText("유사군/품목");
            
      

            ByteArrayOutputStream b = new ByteArrayOutputStream();
            doc.write(b);
            return new ByteArrayInputStream(b.toByteArray());
        }

    }
    
    */


    public static ByteArrayInputStream generateWord(List<Trademark> trademarks)
            throws FileNotFoundException, IOException, 
                        InvalidFormatException {

        try (XWPFDocument doc = new XWPFDocument()) {

            XWPFParagraph p1 = doc.createParagraph();
            XWPFRun r1 = p1.createRun();
            r1.setFontSize(10);
            r1.setText("유사판단 (유사도 표시 극히 동일, 유사 : ★ /  다소 동일, 유사 : ☆ )");
            r1.setFontFamily("맑은 고딕");
            r1.addBreak();
            
         // Creating first Row
            XWPFTable table = doc.createTable();
            XWPFTableRow row1 = table.getRow(0);
            row1.getCell(0).setText("No");
            row1.addNewTableCell().setText("유사도");
            row1.addNewTableCell().setText("표장");
            row1.addNewTableCell().setText("현재상태");
            row1.addNewTableCell().setText("출원번호/우선권 ");
            row1.addNewTableCell().setText("출원인/등록권자 ");
            row1.addNewTableCell().setText("유사군/품목");
//                row1.setAlignment(ParagraphAlignment.CENTER);
            
            
            
        	// ----------------------------
    		int i = 1;
    		for(Trademark trademark : trademarks) {
    			XWPFTableRow row = table.createRow();
    			String imgF = trademark.getBigDrawing();
    			XWPFParagraph p = doc.createParagraph();
    			
    			row.getCell(0).setText(Integer.toString(i));
    			row.getCell(1).setText("");
    			row.getCell(2).setText("");
    			row.getCell(3).setText(trademark.getApplicationStatus());
    			row.getCell(4).setText(trademark.getApplicationNumber());
    			row.getCell(5).setText(trademark.getApplicantName());
    			row.getCell(6).setText("");
    			i++;
    		}
            


             ByteArrayOutputStream b = new ByteArrayOutputStream();
             doc.write(b);
             return new ByteArrayInputStream(b.toByteArray());
            }

        }
    
    
    
    
    
    
    
    public static ByteArrayInputStream insertTrademark(List<Trademark> trademarks)  throws FileNotFoundException, IOException, 
    InvalidFormatException{
    	try (XWPFDocument doc = new XWPFDocument()) {
    		
    		XWPFTable table = doc.createTable();
    		int i = 1;
    		for(Trademark trademark : trademarks) {
    			XWPFTableRow row = table.createRow();
    			String imgF = trademark.getBigDrawing();
    			XWPFParagraph p = doc.createParagraph();
    			
    			row.getCell(0).setText(Integer.toString(i));
    			row.getCell(1).setText("");
    			row.getCell(2).setText("");
    			row.getCell(3).setText(trademark.getApplicationStatus());
    			row.getCell(4).setText(trademark.getApplicationNumber());
    			row.getCell(5).setText(trademark.getApplicantName());
    			row.getCell(6).setText("");
    			i++;
    		}
    		
    		
    		ByteArrayOutputStream a = new ByteArrayOutputStream();
            doc.write(a);
            return new ByteArrayInputStream(a.toByteArray());
        	
    	}
    }
	
}