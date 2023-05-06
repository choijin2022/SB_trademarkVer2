package com.cji.exam.trademark.util;
import java.util.Iterator;
import java.util.NoSuchElementException;

import com.cji.exam.trademark.vo.DataElement;

public class DataShelfIterator implements Iterator<DataElement>{
	private DataShelf dataShelf;
	private int index;
	
	public DataShelfIterator(DataShelf dataShelf) {
		this.dataShelf = dataShelf;
		this.index = 0;
	}
	
	
	@Override
	public boolean hasNext() {
		if(index < dataShelf.getLength()) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public DataElement next() {
		if(!hasNext()) {
			throw new NoSuchElementException();
		}
		DataElement dataElement = dataShelf.getDataNameAt(index);
		index++;
		return dataElement;
	}
}
