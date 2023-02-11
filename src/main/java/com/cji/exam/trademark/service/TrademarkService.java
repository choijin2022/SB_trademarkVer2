package com.cji.exam.trademark.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cji.exam.trademark.repository.TrademarkRepository;
import com.cji.exam.trademark.vo.Trademark;



@Service
public class TrademarkService {

	private TrademarkRepository storedTrademarkRepository;
	
	@Autowired
	TrademarkService(TrademarkRepository storedTrademarkRepository){
		this.storedTrademarkRepository = storedTrademarkRepository;
	}
	
	public void storedTrademark(Trademark trademark) {
//		Trademark trademark = new Trademark();
		System.out.println("service ?????");
		storedTrademarkRepository.storedTrademark(trademark);
		
	}

}
