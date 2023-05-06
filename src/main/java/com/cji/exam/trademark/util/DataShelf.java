package com.cji.exam.trademark.util;
import java.util.Iterator;

import com.cji.exam.trademark.vo.DataElement;

public class DataShelf implements Iterable<DataElement>{
	private DataElement[] DataElements;
	private String[] DataString;
	private int last = 0;
	
	public DataShelf(int maxsize) {
		this.DataElements = new DataElement[maxsize];
	}
	
	public DataElement getDataNameAt(int index) {
		return DataElements[index];
	}
	public void appendDataName(DataElement dataName) {
		this.DataElements[last] = dataName;
		last++;
	}
//	public void appendDataName(String str) {
//		this.DataString[last] = str;
//		last++;
//	}
	public int getLength() {
		return last;
	}
	
	
	@Override
	public Iterator<DataElement> iterator(){
		return new DataShelfIterator(this);
	}


}
