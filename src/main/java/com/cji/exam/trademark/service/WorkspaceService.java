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

	public void doTrademarksSetToWork(List<Trademark> trademarks) {
		//경로에 파일 생성
//		String TEMPPATH = "C:\\cji_d\\01.sts\\wordTest\\TemplateVer01.docx";
		String TEMPPATH = "C:\\cji_d\\01.sts\\wordTest\\test.docx";
		FileOutputStream fos = null;
		try {
			File file = new File(TEMPPATH);
			XWPFDocument doc = new XWPFDocument(new FileInputStream(file));
			XWPFTable table = null;
			
			// -------- 테이블 요소 구하기
			Iterator<IBodyElement> docElementsIterator = doc.getBodyElementsIterator();
			while(docElementsIterator.hasNext()) {
				IBodyElement docElement = docElementsIterator.next();

				if("TABLE".equalsIgnoreCase(docElement.getElementType().name())) {
					List<XWPFTable> xwpfTableList = docElement.getBody().getTables();

					table = xwpfTableList.get(0);
				}
			}
			// ----------------------------
			XWPFTableRow row = table.createRow();
			for(Trademark trademark : trademarks) {
				row.getCell(0).setText(trademark.getIndexNo());
				row.addNewTableCell().setText(trademark.getApplicationStatus());
				row.addNewTableCell().setText("");
				row.addNewTableCell().setText(trademark.getApplicationNumber());
				row.addNewTableCell().setText(trademark.getApplicantName());
				row.addNewTableCell().setText("");
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
