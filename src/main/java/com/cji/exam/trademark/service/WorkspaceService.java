package com.cji.exam.trademark.service;

import org.springframework.stereotype.Service;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;

@Service
public class WorkspaceService {

	public static final String WORDFILE  = "C:\\cji_d\\01.sts\\wordTest";	
	public void doWordParser() {
		
		System.out.println("doWordParser 시작??");
		
		File directory = new File(WORDFILE);
		File[] files = directory.listFiles();
		
		for(File f: files) {
			if(!f.isDirectory()) {
				try (FileInputStream fis = new FileInputStream(f.getAbsolutePath());
					 XWPFDocument document = new XWPFDocument(fis);) {
					for(XWPFParagraph paragraph: document.getParagraphs()) {
						for(XWPFRun run: paragraph.getRuns()) {
							if(run.getFontSize()>=13) {
								run.setText("("+f.getName().substring(0, 8)+")"+run,0);
							}
						}
					}
					document.write(new FileOutputStream(f.getAbsolutePath()));
				} catch (FileNotFoundException e) {
					System.err.println(f.getName()+" 파일이 없습니다");;
				} catch (IOException e1) {
					System.err.println(e1);
				}
			}
			System.out.println(f.getName()+" 처리 완료");
		}
		
		
	}
	
}
