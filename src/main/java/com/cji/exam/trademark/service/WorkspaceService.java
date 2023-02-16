package com.cji.exam.trademark.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.util.Units;
import org.apache.poi.xwpf.usermodel.Document;
import org.apache.poi.xwpf.usermodel.IBodyElement;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

import org.springframework.stereotype.Service;

import com.cji.exam.trademark.vo.Trademark;


@Service
public class WorkspaceService {

public void doWordParser() throws Exception {
		
		//경로에 파일 생성
		String TEMPPATH = "C:\\cji_d\\01.sts\\wordTest";
		// initialize a blank document
		XWPFDocument document = new XWPFDocument();
		// create a new file
		FileOutputStream out;
		try {
			out = new FileOutputStream(new File("document.docx"));
			// create a new paragraph paragraph
			XWPFParagraph paragraph = document.createParagraph();
			XWPFRun run = paragraph.createRun();
			run.setText("File Format Developer Guide - " +
			  "Learn about computer files that you come across in " +
			  "your daily work at: www.fileformat.com ");
			document.write(out);
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
		
		
	}

public void doModifyAndReCreateToWord(List<Trademark> trademarks) throws IOException, InvalidFormatException {
	//경로에 파일 생성
//	String TEMPPATH = "C:\\cji_d\\01.sts\\wordTest\\test.docx";
	String TEMPPATH = "C:\\Users\\cjidi\\Downloads\\test.docx";
	FileOutputStream fos = null;
	try {
		File file = new File(TEMPPATH);
		XWPFDocument doc = new XWPFDocument();
//		XWPFDocument doc = new XWPFDocument(new FileInputStream(file));
		//XWPFTable table = null;
		XWPFParagraph p1 = doc.createParagraph();
        XWPFRun r1 = p1.createRun();
        r1.setFontSize(10);
        r1.setText("유사판단 (유사도 표시 극히 동일, 유사 : ★ /  다소 동일, 유사 : ☆ )");
        r1.setFontFamily("맑은 고딕");
        r1.addBreak();
        
     // Creating first Row
        XWPFTable table = doc.createTable();
        XWPFTableRow row1 = table.getRow(0);
        row1.getCell(0).setText("No");
        row1.addNewTableCell().setText("유사도");
        row1.addNewTableCell().setText("표장");
        row1.addNewTableCell().setText("현재상태");
        row1.addNewTableCell().setText("출원번호/우선권 ");
        row1.addNewTableCell().setText("출원인/등록권자 ");
        row1.addNewTableCell().setText("유사군/품목");
		
		// -------- 테이블 요소 구하기
		/*
		Iterator<IBodyElement> docElementsIterator = doc.getBodyElementsIterator();
		while(docElementsIterator.hasNext()) {
			IBodyElement docElement = docElementsIterator.next();
			if("TABLE".equalsIgnoreCase(docElement.getElementType().name())) {
				List<XWPFTable> xwpfTableList = docElement.getBody().getTables();
				table = xwpfTableList.get(0);
			}
		}
		*/
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
		
		fos = new FileOutputStream(new File(TEMPPATH));
		doc.write(fos);
		
		if(fos != null) fos.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		File file = new File(TEMPPATH);
	
	}
}
