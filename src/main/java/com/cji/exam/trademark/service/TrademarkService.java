package com.cji.exam.trademark.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.cji.exam.trademark.repository.TrademarkRepository;
import com.cji.exam.trademark.vo.Trademark;



@Service
public class TrademarkService {

	private TrademarkRepository trademarkRepository;
	
	@Autowired
	TrademarkService(TrademarkRepository trademarkRepository){
		this.trademarkRepository = trademarkRepository;
	}
	
	public int storedTrademark(Trademark trademark, int projectId) {
		trademarkRepository.storedTrademark(trademark);
		int getLastInsertId = trademarkRepository.getLastInsertId();
		
		return getLastInsertId;
		
	}

	public List<Trademark> getTrademarks(int projectId) {
		System.out.println("trademark service getTrademarks");
		
		return trademarkRepository.getTrademarks(projectId);
	}

	public void connectTrademark(int trademarkId, int projectId) {
		System.out.println("connectTrademark : " + trademarkId);
		trademarkRepository.createConnectTrademark(trademarkId,projectId );
		
	}

	public void connectTrademarkSub(int trademarkId, int projectId, int subProjectId) {
		trademarkRepository.createConnectTrademarkSub(trademarkId,projectId,subProjectId);
	}

}
