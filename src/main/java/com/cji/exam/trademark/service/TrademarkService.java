package com.cji.exam.trademark.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	public List<Trademark> getTrademarksByProjectId(int projectId) {
		System.out.println("trademark service getTrademarks");
		
		return trademarkRepository.getTrademarksByProjectId(projectId);
	}

	public void connectTrademark(int trademarkId, int projectId) {
		System.out.println("connectTrademark : " + trademarkId);
		trademarkRepository.createConnectTrademark(trademarkId,projectId );
		
	}

	public void connectTrademarkSub(int trademarkId, int projectId, int subProjectId) {
		trademarkRepository.createConnectTrademarkSub(trademarkId,projectId,subProjectId);
	}

	
	public void deleteTrademarks(List<Integer> trademarkIds) {
		for (int trademarkId : trademarkIds) {
			Trademark trademark = getTrademarkById(trademarkId);
			
			if (trademark != null) {
				deleteTrademark(trademark);
			}
		}
	}

	private Trademark getTrademarkById(int trademarkId) {
		
		return trademarkRepository.getTrademarkById(trademarkId);
	}

	private void deleteTrademark(Trademark trademark) {
		trademarkRepository.deleteTrademarks(trademark.getId());
	}

	public List<Trademark> getTrademarksByTrademarkId(List<Integer> trademarkIds) {
	
		List<Trademark> trademarks = new ArrayList<>();
		for (int trademarkId : trademarkIds) {
			
			Trademark trademark = getTrademarkById(trademarkId);
			
			if (trademark != null) {
				trademarks.add(trademark);
				}
			}
		
		return trademarks;
	}

	public int storedTrademarksFromDB(List<Integer> trademarkIds, int projectId) {
		for (int trademarkId : trademarkIds) {
			Trademark trademark = getTrademarkById(trademarkId);
			Trademark setTrademark = new Trademark();
			
			System.out.println("------------------------");
			System.out.println("trademark : "+trademark);
			
			setTrademark.setProjectId(projectId);
			if(trademark.getTitle() == null) {
				setTrademark.setTitle("없음");
			}else {
				setTrademark.setTitle(trademark.getTitle());
			}
			setTrademark.setApplicantName(trademark.getApplicantName());
			setTrademark.setApplicationNumber(trademark.getApplicationNumber());
			setTrademark.setApplicationDate(trademark.getApplicationDate());
			setTrademark.setPublicationNumber(trademark.getPublicationNumber());
			setTrademark.setPublicationDate(trademark.getPublicationDate());
			setTrademark.setRegistrationNumber(trademark.getRegistrationNumber());
			setTrademark.setRegistrationDate(trademark.getRegDate());
			setTrademark.setRegistrationPublicNumber(trademark.getRegistrationPublicNumber());;
			setTrademark.setRegistrationPublicDate(trademark.getRegistrationPublicDate());
			setTrademark.setPriorityNumber(trademark.getPriorityNumber());
			setTrademark.setPriorityDate(trademark.getPriorityDate());
			setTrademark.setInternationalRegisterNumber(trademark.getInternationalRegisterNumber());
			setTrademark.setInternationalRegisterDate(trademark.getInternationalRegisterDate());
			setTrademark.setApplicationStatus(trademark.getApplicationStatus());
			setTrademark.setClassificationCode(trademark.getClassificationCode());
			setTrademark.setViennaCode(trademark.getViennaCode());
			setTrademark.setAgentName(trademark.getAgentName());
			setTrademark.setRegPrivilegeName(trademark.getRegPrivilegeName());
			setTrademark.setFullText(trademark.getFullText());
			setTrademark.setDrawing(trademark.getDrawing());
			setTrademark.setBigDrawing(trademark.getBigDrawing());
			
			
			
			if (trademark != null) {
				trademarkRepository.storedTrademark(setTrademark);
			}
		}
		return trademarkIds.size();
		
	}

	public List<Trademark> getTrademarksBySubId(int projectId, int subProjectId) {
		
		return trademarkRepository.getTrademarksBySubId(projectId, subProjectId);
	}


		
	
	
	
}
